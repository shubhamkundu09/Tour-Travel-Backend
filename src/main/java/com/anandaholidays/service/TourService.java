package com.anandaholidays.service;

import com.anandaholidays.dto.TourRequest;
import com.anandaholidays.dto.TourRequestWithImage;
import com.anandaholidays.dto.TourResponse;
import com.anandaholidays.entity.Tour;
import com.anandaholidays.entity.TourType;
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
    public TourResponse createTour(TourRequest request) {
        Tour tour = mapToEntity(request);
        tour.setIsActive(true);
        Tour savedTour = tourRepository.save(tour);
        log.info("Tour created successfully with id: {}", savedTour.getId());
        return mapToResponse(savedTour);
    }

    @Transactional
    public TourResponse createTourWithImages(TourRequestWithImage request) throws IOException {
        Tour tour = mapToEntityFromImageRequest(request);

        // Handle tour images
        List<String> imageNames = new ArrayList<>();

        // Handle main tour image
        if (request.getTourImage() != null && !request.getTourImage().isEmpty()) {
            String mainImageName = fileStorageService.storeFile(request.getTourImage());
            imageNames.add(mainImageName);

            // Handle additional images
            if (request.getAdditionalImages() != null && !request.getAdditionalImages().isEmpty()) {
                for (MultipartFile image : request.getAdditionalImages()) {
                    if (!image.isEmpty()) {
                        String imageName = fileStorageService.storeFile(image);
                        imageNames.add(imageName);
                    }
                }
            }
        }

        tour.setTourImages(imageNames);
        tour.setIsActive(true);

        Tour savedTour = tourRepository.save(tour);
        log.info("Tour with images created successfully with id: {}", savedTour.getId());
        return mapToResponse(savedTour);
    }

    @Transactional
    public TourResponse updateTour(Long id, TourRequest request) {
        Tour tour = findTourById(id);
        updateTourEntity(tour, request);
        Tour updatedTour = tourRepository.save(tour);
        log.info("Tour updated successfully with id: {}", id);
        return mapToResponse(updatedTour);
    }

    @Transactional
    public TourResponse updateTourWithImages(Long id, TourRequestWithImage request) throws IOException {
        Tour tour = findTourById(id);

        // Update basic fields
        updateTourEntityFromImageRequest(tour, request);

        // Get current images
        List<String> currentImages = new ArrayList<>(tour.getTourImages() != null ?
                tour.getTourImages() : new ArrayList<>());

        // Handle images to delete (if any)
        if (request.getImagesToDelete() != null && !request.getImagesToDelete().isEmpty()) {
            for (String imageToDelete : request.getImagesToDelete()) {
                if (currentImages.contains(imageToDelete)) {
                    fileStorageService.deleteFile(imageToDelete);
                    currentImages.remove(imageToDelete);
                    log.debug("Deleted image: {}", imageToDelete);
                }
            }
        }

        // Handle new main image
        if (request.getTourImage() != null && !request.getTourImage().isEmpty()) {
            // If there's an existing main image and it's not in the preserved list, delete it
            if (!currentImages.isEmpty() &&
                    (request.getExistingImages() == null || !request.getExistingImages().contains(currentImages.get(0)))) {
                fileStorageService.deleteFile(currentImages.get(0));
                currentImages.remove(0);
            }
            // Add new main image
            String newMainImage = fileStorageService.storeFile(request.getTourImage());
            currentImages.add(0, newMainImage);
            log.debug("Added new main image: {}", newMainImage);
        }

        // Handle additional images
        if (request.getAdditionalImages() != null && !request.getAdditionalImages().isEmpty()) {
            for (MultipartFile image : request.getAdditionalImages()) {
                if (!image.isEmpty()) {
                    String imageName = fileStorageService.storeFile(image);
                    currentImages.add(imageName);
                    log.debug("Added additional image: {}", imageName);
                }
            }
        }

        // Preserve existing images from the request
        if (request.getExistingImages() != null) {
            // Merge with current images, avoiding duplicates
            for (String existingImage : request.getExistingImages()) {
                if (!currentImages.contains(existingImage) && fileStorageService.fileExists(existingImage)) {
                    currentImages.add(existingImage);
                    log.debug("Preserved existing image: {}", existingImage);
                }
            }
        }

        tour.setTourImages(currentImages);
        Tour updatedTour = tourRepository.save(tour);
        log.info("Tour with images updated successfully with id: {}", id);
        return mapToResponse(updatedTour);
    }

    @Transactional
    public void deleteTourWithImages(Long id) throws IOException {
        Tour tour = findTourById(id);

        // Delete all associated images
        if (tour.getTourImages() != null && !tour.getTourImages().isEmpty()) {
            for (String imageName : tour.getTourImages()) {
                fileStorageService.deleteFile(imageName);
            }
            log.info("Deleted {} images for tour id: {}", tour.getTourImages().size(), id);
        }

        tour.setIsActive(false);
        tourRepository.save(tour);
        log.info("Tour soft deleted with id: {}", id);
    }

    @Transactional
    public void deleteTour(Long id) {
        Tour tour = findTourById(id);
        tour.setIsActive(false);
        tourRepository.save(tour);
        log.info("Tour soft deleted with id: {}", id);
    }

    @Transactional
    public void permanentlyDeleteTour(Long id) throws IOException {
        Tour tour = findTourById(id);

        // Delete all associated images
        if (tour.getTourImages() != null && !tour.getTourImages().isEmpty()) {
            for (String imageName : tour.getTourImages()) {
                fileStorageService.deleteFile(imageName);
            }
            log.info("Deleted {} images for tour id: {}", tour.getTourImages().size(), id);
        }

        tourRepository.delete(tour);
        log.info("Tour permanently deleted with id: {}", id);
    }

    @Transactional(readOnly = true)
    public List<TourResponse> getAllTours() {
        return tourRepository.findByIsActiveTrue().stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<TourResponse> getUpcomingTours() {
        return tourRepository.findUpcomingTours(LocalDate.now()).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<TourResponse> getOngoingTours() {
        return tourRepository.findOngoingTours(LocalDate.now()).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<TourResponse> getCompletedTours() {
        return tourRepository.findCompletedTours(LocalDate.now()).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public TourResponse getTourById(Long id) {
        return mapToResponse(findTourById(id));
    }

    @Transactional(readOnly = true)
    public List<TourResponse> searchTours(String keyword) {
        return tourRepository.findByIsActiveTrue().stream()
                .filter(tour -> tour.getTourName().toLowerCase().contains(keyword.toLowerCase()) ||
                        tour.getTourDestination().toLowerCase().contains(keyword.toLowerCase()) ||
                        tour.getTourLocation().toLowerCase().contains(keyword.toLowerCase()))
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<TourResponse> filterByDestination(String destination) {
        return tourRepository.findByTourDestinationContainingIgnoreCase(destination).stream()
                .filter(Tour::getIsActive)
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<TourResponse> filterByType(TourType tourType) {
        return tourRepository.findByTourType(tourType).stream()
                .filter(Tour::getIsActive)
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<TourResponse> filterByPriceRange(Double minPrice, Double maxPrice) {
        return tourRepository.findByIsActiveTrue().stream()
                .filter(tour -> tour.getTourPrice() >= minPrice && tour.getTourPrice() <= maxPrice)
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<TourResponse> filterByDateRange(LocalDate startDate, LocalDate endDate) {
        return tourRepository.findByIsActiveTrue().stream()
                .filter(tour -> !tour.getTourStartingDate().isBefore(startDate) &&
                        !tour.getTourEndingDate().isAfter(endDate))
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    private Tour findTourById(Long id) {
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
        tour.setTourInclusions(request.getTourInclusions() != null ? request.getTourInclusions() : new ArrayList<>());
        tour.setTourExclusions(request.getTourExclusions() != null ? request.getTourExclusions() : new ArrayList<>());
        tour.setTourImages(request.getTourImages() != null ? request.getTourImages() : new ArrayList<>());
        tour.setTourDescription(request.getTourDescription());
        tour.setTourServices(request.getTourServices() != null ? request.getTourServices() : new ArrayList<>());
        tour.setTourType(request.getTourType());
        tour.setTourStartingDate(request.getTourStartingDate());
        tour.setTourEndingDate(request.getTourEndingDate());
        tour.setTourHelplineNumber(request.getTourHelplineNumber());
        tour.setTourMapEmbedUrl(request.getTourMapEmbedUrl());
        return tour;
    }

    private Tour mapToEntityFromImageRequest(TourRequestWithImage request) {
        Tour tour = new Tour();
        tour.setTourName(request.getTourName());
        tour.setTourPrice(request.getTourPrice());
        tour.setTourDestination(request.getTourDestination());
        tour.setTourLocation(request.getTourLocation());
        tour.setTourDays(request.getTourDays());
        tour.setTourNights(request.getTourNights());
        tour.setTourInclusions(request.getTourInclusions() != null ? request.getTourInclusions() : new ArrayList<>());
        tour.setTourExclusions(request.getTourExclusions() != null ? request.getTourExclusions() : new ArrayList<>());
        tour.setTourDescription(request.getTourDescription());
        tour.setTourServices(request.getTourServices() != null ? request.getTourServices() : new ArrayList<>());
        tour.setTourType(request.getTourType());
        tour.setTourStartingDate(request.getTourStartingDate());
        tour.setTourEndingDate(request.getTourEndingDate());
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
        tour.setTourInclusions(request.getTourInclusions() != null ? request.getTourInclusions() : new ArrayList<>());
        tour.setTourExclusions(request.getTourExclusions() != null ? request.getTourExclusions() : new ArrayList<>());
        tour.setTourImages(request.getTourImages() != null ? request.getTourImages() : new ArrayList<>());
        tour.setTourDescription(request.getTourDescription());
        tour.setTourServices(request.getTourServices() != null ? request.getTourServices() : new ArrayList<>());
        tour.setTourType(request.getTourType());
        tour.setTourStartingDate(request.getTourStartingDate());
        tour.setTourEndingDate(request.getTourEndingDate());
        tour.setTourHelplineNumber(request.getTourHelplineNumber());
        tour.setTourMapEmbedUrl(request.getTourMapEmbedUrl());
    }

    private void updateTourEntityFromImageRequest(Tour tour, TourRequestWithImage request) {
        tour.setTourName(request.getTourName());
        tour.setTourPrice(request.getTourPrice());
        tour.setTourDestination(request.getTourDestination());
        tour.setTourLocation(request.getTourLocation());
        tour.setTourDays(request.getTourDays());
        tour.setTourNights(request.getTourNights());
        tour.setTourInclusions(request.getTourInclusions() != null ? request.getTourInclusions() : new ArrayList<>());
        tour.setTourExclusions(request.getTourExclusions() != null ? request.getTourExclusions() : new ArrayList<>());
        tour.setTourDescription(request.getTourDescription());
        tour.setTourServices(request.getTourServices() != null ? request.getTourServices() : new ArrayList<>());
        tour.setTourType(request.getTourType());
        tour.setTourStartingDate(request.getTourStartingDate());
        tour.setTourEndingDate(request.getTourEndingDate());
        tour.setTourHelplineNumber(request.getTourHelplineNumber());
        tour.setTourMapEmbedUrl(request.getTourMapEmbedUrl());
    }

    private TourResponse mapToResponse(Tour tour) {
        return new TourResponse(
                tour.getId(),
                tour.getTourName(),
                tour.getTourPrice(),
                tour.getTourDestination(),
                tour.getTourLocation(),
                tour.getTourDays(),
                tour.getTourNights(),
                tour.getTourInclusions(),
                tour.getTourExclusions(),
                tour.getTourImages(),
                tour.getTourDescription(),
                tour.getTourServices(),
                tour.getTourType(),
                tour.getTourStartingDate(),
                tour.getTourEndingDate(),
                tour.getTourHelplineNumber(),
                tour.getTourMapEmbedUrl(),
                tour.getIsActive()
        );
    }
}