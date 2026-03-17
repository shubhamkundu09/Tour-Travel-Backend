package com.anandaholidays.service;

import com.anandaholidays.dto.TourRequestWithImage;
import com.anandaholidays.dto.TourResponse;
import com.anandaholidays.entity.Tour;
import com.anandaholidays.exception.ResourceNotFoundException;
import com.anandaholidays.repository.TourRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
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
public class TourService {

    private final TourRepository tourRepository;
    private final FileStorageService fileStorageService;

    @Value("${file.storage.base-url}")
    private String baseUrl;

    @Transactional
    public TourResponse createTourWithImages(TourRequestWithImage request) throws IOException {
        Tour tour = mapToEntity(request);

        // Handle main image upload
        if (request.getTourImage() != null && !request.getTourImage().isEmpty()) {
            String imageName = fileStorageService.storeFile(request.getTourImage());
            tour.setTourImage(imageName);
        }

        // Handle additional images upload
        if (request.getAdditionalImages() != null && !request.getAdditionalImages().isEmpty()) {
            List<String> additionalImageNames = new ArrayList<>();
            for (MultipartFile image : request.getAdditionalImages()) {
                if (!image.isEmpty()) {
                    String imageName = fileStorageService.storeFile(image);
                    additionalImageNames.add(imageName);
                }
            }
            tour.setAdditionalImages(additionalImageNames);
        }

        tour.setIsActive(true);
        Tour savedTour = tourRepository.save(tour);
        return mapToResponse(savedTour);
    }

    @Transactional
    public TourResponse updateTourWithImages(Long id, TourRequestWithImage request) throws IOException {
        Tour tour = tourRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tour not found with id: " + id));

        // Handle main image update
        if (request.getTourImage() != null && !request.getTourImage().isEmpty()) {
            // Delete old image if exists
            if (tour.getTourImage() != null) {
                fileStorageService.deleteFile(tour.getTourImage());
            }
            String imageName = fileStorageService.storeFile(request.getTourImage());
            tour.setTourImage(imageName);
        }

        // Handle additional images update
        if (request.getAdditionalImages() != null && !request.getAdditionalImages().isEmpty()) {
            // Delete old additional images
            if (tour.getAdditionalImages() != null) {
                for (String oldImage : tour.getAdditionalImages()) {
                    fileStorageService.deleteFile(oldImage);
                }
            }

            List<String> additionalImageNames = new ArrayList<>();
            for (MultipartFile image : request.getAdditionalImages()) {
                if (!image.isEmpty()) {
                    String imageName = fileStorageService.storeFile(image);
                    additionalImageNames.add(imageName);
                }
            }
            tour.setAdditionalImages(additionalImageNames);
        }

        updateTourEntity(tour, request);
        Tour updatedTour = tourRepository.save(tour);
        return mapToResponse(updatedTour);
    }

    @Transactional
    public void deleteTourWithImages(Long id) throws IOException {
        Tour tour = tourRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tour not found with id: " + id));

        // Soft delete - just mark as inactive
        tour.setIsActive(false);
        tourRepository.save(tour);

        // Note: You might want to keep the images or delete them based on your requirements
        // If you want to delete images permanently, uncomment the code below:
        /*
        // Delete main image
        if (tour.getTourImage() != null) {
            fileStorageService.deleteFile(tour.getTourImage());
        }

        // Delete additional images
        if (tour.getAdditionalImages() != null) {
            for (String image : tour.getAdditionalImages()) {
                fileStorageService.deleteFile(image);
            }
        }
        */
    }

    public List<TourResponse> getAllTours() {
        return tourRepository.findByIsActiveTrue().stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    public List<TourResponse> getUpcomingTours() {
        return tourRepository.findUpcomingTours(LocalDate.now()).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    public List<TourResponse> getOngoingTours() {
        return tourRepository.findOngoingTours(LocalDate.now()).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    public List<TourResponse> getCompletedTours() {
        return tourRepository.findCompletedTours(LocalDate.now()).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    public TourResponse getTourById(Long id) {
        Tour tour = tourRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tour not found with id: " + id));
        return mapToResponse(tour);
    }

    private Tour mapToEntity(TourRequestWithImage request) {
        Tour tour = new Tour();
        tour.setTourName(request.getTourName());
        tour.setTourPrice(request.getTourPrice());
        tour.setTourDestination(request.getTourDestination());
        tour.setTourLocation(request.getTourLocation());
        tour.setTourDays(request.getTourDays());
        tour.setTourNights(request.getTourNights());
        tour.setTourInclusions(request.getTourInclusions());
        tour.setTourExclusions(request.getTourExclusions());
        tour.setTourDescription(request.getTourDescription());
        tour.setTourServices(request.getTourServices());
        tour.setTourType(request.getTourType());
        tour.setTourStartingDate(request.getTourStartingDate());
        tour.setTourEndingDate(request.getTourEndingDate());
        tour.setTourHelplineNumber(request.getTourHelplineNumber());
        tour.setTourMapEmbedUrl(request.getTourMapEmbedUrl());
        return tour;
    }

    private void updateTourEntity(Tour tour, TourRequestWithImage request) {
        tour.setTourName(request.getTourName());
        tour.setTourPrice(request.getTourPrice());
        tour.setTourDestination(request.getTourDestination());
        tour.setTourLocation(request.getTourLocation());
        tour.setTourDays(request.getTourDays());
        tour.setTourNights(request.getTourNights());
        tour.setTourInclusions(request.getTourInclusions());
        tour.setTourExclusions(request.getTourExclusions());
        tour.setTourDescription(request.getTourDescription());
        tour.setTourServices(request.getTourServices());
        tour.setTourType(request.getTourType());
        tour.setTourStartingDate(request.getTourStartingDate());
        tour.setTourEndingDate(request.getTourEndingDate());
        tour.setTourHelplineNumber(request.getTourHelplineNumber());
        tour.setTourMapEmbedUrl(request.getTourMapEmbedUrl());
    }

    private TourResponse mapToResponse(Tour tour) {
        TourResponse response = new TourResponse(
                tour.getId(),
                tour.getTourName(),
                tour.getTourPrice(),
                tour.getTourDestination(),
                tour.getTourLocation(),
                tour.getTourDays(),
                tour.getTourNights(),
                tour.getTourInclusions(),
                tour.getTourExclusions(),
                new ArrayList<>(), // tourImages will be built with full URLs
                tour.getTourDescription(),
                tour.getTourServices(),
                tour.getTourType(),
                tour.getTourStartingDate(),
                tour.getTourEndingDate(),
                tour.getTourHelplineNumber(),
                tour.getTourMapEmbedUrl(),
                tour.getIsActive()
        );

        // Build full URLs for images
        List<String> imageUrls = new ArrayList<>();
        if (tour.getTourImage() != null) {
            imageUrls.add(baseUrl + "/" + tour.getTourImage());
        }
        if (tour.getAdditionalImages() != null) {
            for (String image : tour.getAdditionalImages()) {
                imageUrls.add(baseUrl + "/" + image);
            }
        }
        response.setTourImages(imageUrls);

        return response;
    }
}