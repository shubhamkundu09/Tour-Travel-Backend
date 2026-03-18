// TourService.java
package com.anandaholidays.service;

import com.anandaholidays.dto.TourRequest;
import com.anandaholidays.dto.TourResponse;
import com.anandaholidays.entity.Tour;
import com.anandaholidays.exception.ResourceNotFoundException;
import com.anandaholidays.repository.TourRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class TourService {

    private final TourRepository tourRepository;
    private final FileStorageService fileStorageService;

    @Transactional
    public TourResponse createTour(TourRequest request) throws IOException {
        Tour tour = mapToEntity(request);

        // Handle images
        List<String> imageNames = new ArrayList<>();
        if (request.getMainImage() != null && !request.getMainImage().isEmpty()) {
            imageNames.add(fileStorageService.storeFile(request.getMainImage()));

            if (request.getAdditionalImages() != null) {
                for (MultipartFile image : request.getAdditionalImages()) {
                    if (!image.isEmpty()) {
                        imageNames.add(fileStorageService.storeFile(image));
                    }
                }
            }
        }
        tour.setTourImages(imageNames);
        tour.setIsActive(true);

        Tour savedTour = tourRepository.save(tour);
        log.info("Tour created with id: {}", savedTour.getId());
        return mapToResponse(savedTour);
    }

    @Transactional
    public TourResponse updateTour(Long id, TourRequest request) throws IOException {
        Tour tour = findById(id);
        updateTourEntity(tour, request);

        // Handle image updates
        List<String> currentImages = new ArrayList<>(tour.getTourImages());

        // Delete requested images
        if (request.getImagesToDelete() != null) {
            for (String image : request.getImagesToDelete()) {
                if (currentImages.remove(image)) {
                    fileStorageService.deleteFile(image);
                }
            }
        }

        // Add new images
        if (request.getMainImage() != null && !request.getMainImage().isEmpty()) {
            if (!currentImages.isEmpty()) {
                fileStorageService.deleteFile(currentImages.get(0));
                currentImages.remove(0);
            }
            currentImages.add(0, fileStorageService.storeFile(request.getMainImage()));
        }

        if (request.getAdditionalImages() != null) {
            for (MultipartFile image : request.getAdditionalImages()) {
                if (!image.isEmpty()) {
                    currentImages.add(fileStorageService.storeFile(image));
                }
            }
        }

        // Preserve existing images
        if (request.getExistingImages() != null) {
            for (String image : request.getExistingImages()) {
                if (!currentImages.contains(image) && fileStorageService.fileExists(image)) {
                    currentImages.add(image);
                }
            }
        }

        tour.setTourImages(currentImages);
        Tour updatedTour = tourRepository.save(tour);
        return mapToResponse(updatedTour);
    }

    @Transactional
    public void deleteTour(Long id) throws IOException {
        Tour tour = findById(id);

        // Delete associated images
        if (tour.getTourImages() != null) {
            for (String image : tour.getTourImages()) {
                fileStorageService.deleteFile(image);
            }
        }

        tourRepository.delete(tour); // Hard delete for simplicity
        log.info("Tour deleted with id: {}", id);
    }

    @Transactional(readOnly = true)
    public List<TourResponse> getAllActiveTours() {
        return tourRepository.findByIsActiveTrue().stream()
                .map(this::mapToResponseWithStatus)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<TourResponse> getAllTours() {
        return tourRepository.findAll().stream()
                .map(this::mapToResponseWithStatus)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<TourResponse> getToursByStatus(String status) {
        LocalDate now = LocalDate.now();
        List<Tour> tours = tourRepository.findByIsActiveTrue();

        return tours.stream()
                .filter(tour -> {
                    if ("UPCOMING".equals(status)) {
                        return tour.getTourStartingDate().isAfter(now);
                    } else if ("ONGOING".equals(status)) {
                        return !tour.getTourStartingDate().isAfter(now) &&
                                !tour.getTourEndingDate().isBefore(now);
                    } else if ("COMPLETED".equals(status)) {
                        return tour.getTourEndingDate().isBefore(now);
                    }
                    return false;
                })
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public TourResponse getTourById(Long id) {
        return mapToResponseWithStatus(findById(id));
    }

    @Transactional(readOnly = true)
    public List<TourResponse> searchTours(String destination, Double minPrice, Double maxPrice,
                                          LocalDate startDate, LocalDate endDate) {
        return tourRepository.findByIsActiveTrue().stream()
                .filter(tour -> destination == null ||
                        tour.getTourDestination().toLowerCase().contains(destination.toLowerCase()))
                .filter(tour -> minPrice == null || tour.getTourPrice() >= minPrice)
                .filter(tour -> maxPrice == null || tour.getTourPrice() <= maxPrice)
                .filter(tour -> startDate == null || !tour.getTourStartingDate().isBefore(startDate))
                .filter(tour -> endDate == null || !tour.getTourEndingDate().isAfter(endDate))
                .map(this::mapToResponseWithStatus)
                .collect(Collectors.toList());
    }

    private Tour findById(Long id) {
        return tourRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tour not found with id: " + id));
    }

    private Tour mapToEntity(TourRequest request) {
        Tour tour = new Tour();
        tour.setTourName(request.getTourName());
        tour.setTourPrice(request.getTourPrice());
        tour.setTourDestination(request.getTourDestination());
        tour.setTourLocation(request.getTourLocation());
        tour.setTourDays(request.getTourDays());
        tour.setTourNights(request.getTourNights());
        tour.setTourInclusions(request.getTourInclusions());
        tour.setTourExclusions(request.getTourExclusions());
        tour.setTourServices(request.getTourServices());
        tour.setTourType(request.getTourType());
        tour.setTourStartingDate(request.getTourStartingDate());
        tour.setTourEndingDate(request.getTourEndingDate());
        tour.setTourDescription(request.getTourDescription());
        tour.setTourHelplineNumber(request.getTourHelplineNumber());
        tour.setTourMapEmbedUrl(request.getTourMapEmbedUrl());
        return tour;
    }

    private void updateTourEntity(Tour tour, TourRequest request) {
        tour.setTourName(request.getTourName());
        tour.setTourPrice(request.getTourPrice());
        tour.setTourDestination(request.getTourDestination());
        tour.setTourLocation(request.getTourLocation());
        tour.setTourDays(request.getTourDays());
        tour.setTourNights(request.getTourNights());
        tour.setTourInclusions(request.getTourInclusions());
        tour.setTourExclusions(request.getTourExclusions());
        tour.setTourServices(request.getTourServices());
        tour.setTourType(request.getTourType());
        tour.setTourStartingDate(request.getTourStartingDate());
        tour.setTourEndingDate(request.getTourEndingDate());
        tour.setTourDescription(request.getTourDescription());
        tour.setTourHelplineNumber(request.getTourHelplineNumber());
        tour.setTourMapEmbedUrl(request.getTourMapEmbedUrl());
    }

    private TourResponse mapToResponse(Tour tour) {
        TourResponse response = new TourResponse();
        response.setId(tour.getId());
        response.setTourName(tour.getTourName());
        response.setTourPrice(tour.getTourPrice());
        response.setTourDestination(tour.getTourDestination());
        response.setTourLocation(tour.getTourLocation());
        response.setTourDays(tour.getTourDays());
        response.setTourNights(tour.getTourNights());
        response.setTourInclusions(tour.getTourInclusions());
        response.setTourExclusions(tour.getTourExclusions());
        response.setTourServices(tour.getTourServices());
        response.setTourImages(tour.getTourImages());
        response.setTourDescription(tour.getTourDescription());
        response.setTourType(tour.getTourType());
        response.setTourStartingDate(tour.getTourStartingDate());
        response.setTourEndingDate(tour.getTourEndingDate());
        response.setTourHelplineNumber(tour.getTourHelplineNumber());
        response.setTourMapEmbedUrl(tour.getTourMapEmbedUrl());
        response.setIsActive(tour.getIsActive());
        return response;
    }

    private TourResponse mapToResponseWithStatus(Tour tour) {
        TourResponse response = mapToResponse(tour);
        LocalDate now = LocalDate.now();

        if (tour.getTourStartingDate().isAfter(now)) {
            response.setStatus("UPCOMING");
        } else if (tour.getTourEndingDate().isBefore(now)) {
            response.setStatus("COMPLETED");
        } else {
            response.setStatus("ONGOING");
        }

        return response;
    }
}