package com.anandaholidays.service;

import com.anandaholidays.dto.TourRequest;
import com.anandaholidays.dto.TourResponse;
import com.anandaholidays.entity.Tour;
import com.anandaholidays.exception.ResourceNotFoundException;
import com.anandaholidays.repository.TourRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TourService {

    private final TourRepository tourRepository;

    @Transactional
    public TourResponse createTour(TourRequest request) {
        Tour tour = mapToEntity(request);
        tour.setIsActive(true);
        Tour savedTour = tourRepository.save(tour);
        return mapToResponse(savedTour);
    }

    @Transactional
    public TourResponse updateTour(Long id, TourRequest request) {
        Tour tour = tourRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tour not found with id: " + id));

        updateTourEntity(tour, request);
        Tour updatedTour = tourRepository.save(tour);
        return mapToResponse(updatedTour);
    }

    @Transactional
    public void deleteTour(Long id) {
        Tour tour = tourRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tour not found with id: " + id));
        tour.setIsActive(false);
        tourRepository.save(tour);
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
        tour.setTourImages(request.getTourImages());
        tour.setTourDescription(request.getTourDescription());
        tour.setTourServices(request.getTourServices());
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
        tour.setTourInclusions(request.getTourInclusions());
        tour.setTourExclusions(request.getTourExclusions());
        tour.setTourImages(request.getTourImages());
        tour.setTourDescription(request.getTourDescription());
        tour.setTourServices(request.getTourServices());
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