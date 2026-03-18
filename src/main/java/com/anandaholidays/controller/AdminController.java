package com.anandaholidays.controller;

import com.anandaholidays.dto.BookingResponse;
import com.anandaholidays.dto.TourRequest;
import com.anandaholidays.dto.TourResponse;
import com.anandaholidays.service.BookingService;
import com.anandaholidays.service.TourService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/admin")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class AdminController {

    private final TourService tourService;
    private final BookingService bookingService;
    private final ObjectMapper objectMapper;

    // Tour Management
    @PostMapping(value = "/tours", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<TourResponse> createTour(
            @RequestPart("tour") String tourJson,
            @RequestPart(value = "mainImage", required = false) MultipartFile mainImage,
            @RequestPart(value = "additionalImages", required = false) List<MultipartFile> additionalImages) throws IOException {

        TourRequest request = objectMapper.readValue(tourJson, TourRequest.class);
        request.setMainImage(mainImage);
        request.setAdditionalImages(additionalImages != null ? additionalImages : new ArrayList<>());

        return new ResponseEntity<>(tourService.createTour(request), HttpStatus.CREATED);
    }

    @PutMapping(value = "/tours/{id}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<TourResponse> updateTour(
            @PathVariable Long id,
            @RequestPart("tour") String tourJson,
            @RequestPart(value = "mainImage", required = false) MultipartFile mainImage,
            @RequestPart(value = "additionalImages", required = false) List<MultipartFile> additionalImages,
            @RequestParam(value = "existingImages", required = false) List<String> existingImages,
            @RequestParam(value = "imagesToDelete", required = false) List<String> imagesToDelete) throws IOException {

        TourRequest request = objectMapper.readValue(tourJson, TourRequest.class);
        request.setMainImage(mainImage);
        request.setAdditionalImages(additionalImages != null ? additionalImages : new ArrayList<>());
        request.setExistingImages(existingImages != null ? existingImages : new ArrayList<>());
        request.setImagesToDelete(imagesToDelete != null ? imagesToDelete : new ArrayList<>());

        return ResponseEntity.ok(tourService.updateTour(id, request));
    }

    @DeleteMapping("/tours/{id}")
    public ResponseEntity<Void> deleteTour(@PathVariable Long id) throws IOException {
        tourService.deleteTour(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/tours")
    public ResponseEntity<List<TourResponse>> getAllTours() {
        return ResponseEntity.ok(tourService.getAllTours());
    }

    @GetMapping("/tours/{id}")
    public ResponseEntity<TourResponse> getTourById(@PathVariable Long id) {
        return ResponseEntity.ok(tourService.getTourById(id));
    }

    // Booking Management
    @GetMapping("/bookings")
    public ResponseEntity<List<BookingResponse>> getAllBookings() {
        return ResponseEntity.ok(bookingService.getAllBookings());
    }

    @GetMapping("/bookings/{id}")
    public ResponseEntity<BookingResponse> getBookingById(@PathVariable Long id) {
        return ResponseEntity.ok(bookingService.getBookingById(id));
    }

    @PutMapping("/bookings/{id}/status")
    public ResponseEntity<BookingResponse> updateBookingStatus(
            @PathVariable Long id,
            @RequestParam String status) {
        return ResponseEntity.ok(bookingService.updateBookingStatus(id, status));
    }

    @DeleteMapping("/bookings/{id}")
    public ResponseEntity<Void> deleteBooking(@PathVariable Long id) {
        bookingService.deleteBooking(id);
        return ResponseEntity.noContent().build();
    }
}