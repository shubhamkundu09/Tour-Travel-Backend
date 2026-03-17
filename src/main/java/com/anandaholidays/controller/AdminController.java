package com.anandaholidays.controller;

import com.anandaholidays.dto.BookingResponse;
import com.anandaholidays.dto.TourRequest;
import com.anandaholidays.dto.TourRequestWithImage;
import com.anandaholidays.dto.TourResponse;
import com.anandaholidays.service.BookingService;
import com.anandaholidays.service.TourService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/admin")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class AdminController {

    private final TourService tourService;
    private final BookingService bookingService;

    // Tour Management
    @PostMapping(value = "/tours", consumes = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<TourResponse> createTourJson(@Valid @RequestBody TourRequest request) {
        return new ResponseEntity<>(tourService.createTour(request), HttpStatus.CREATED);
    }

    @PostMapping(value = "/tours", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<TourResponse> createTourWithImages(
            @Valid @RequestPart("tour") TourRequestWithImage request,
            @RequestPart(value = "tourImage", required = false) MultipartFile tourImage,
            @RequestPart(value = "additionalImages", required = false) List<MultipartFile> additionalImages) throws IOException {

        request.setTourImage(tourImage);
        request.setAdditionalImages(additionalImages);
        return new ResponseEntity<>(tourService.createTourWithImages(request), HttpStatus.CREATED);
    }

    @PutMapping(value = "/tours/{id}", consumes = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<TourResponse> updateTourJson(@PathVariable Long id, @Valid @RequestBody TourRequest request) {
        return ResponseEntity.ok(tourService.updateTour(id, request));
    }

    @PutMapping(value = "/tours/{id}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<TourResponse> updateTourWithImages(
            @PathVariable Long id,
            @Valid @RequestPart("tour") TourRequestWithImage request,
            @RequestPart(value = "tourImage", required = false) MultipartFile tourImage,
            @RequestPart(value = "additionalImages", required = false) List<MultipartFile> additionalImages) throws IOException {

        request.setTourImage(tourImage);
        request.setAdditionalImages(additionalImages);
        return ResponseEntity.ok(tourService.updateTourWithImages(id, request));
    }

    @DeleteMapping("/tours/{id}")
    public ResponseEntity<Void> deleteTour(@PathVariable Long id) throws IOException {
        tourService.deleteTourWithImages(id);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/tours/{id}/permanent")
    public ResponseEntity<Void> permanentlyDeleteTour(@PathVariable Long id) throws IOException {
        tourService.permanentlyDeleteTour(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/tours/all")
    public ResponseEntity<List<TourResponse>> getAllTours() {
        return ResponseEntity.ok(tourService.getAllTours());
    }

    @GetMapping("/tours/upcoming")
    public ResponseEntity<List<TourResponse>> getUpcomingTours() {
        return ResponseEntity.ok(tourService.getUpcomingTours());
    }

    @GetMapping("/tours/ongoing")
    public ResponseEntity<List<TourResponse>> getOngoingTours() {
        return ResponseEntity.ok(tourService.getOngoingTours());
    }

    @GetMapping("/tours/completed")
    public ResponseEntity<List<TourResponse>> getCompletedTours() {
        return ResponseEntity.ok(tourService.getCompletedTours());
    }

    // Booking Management for Admin
    @GetMapping("/bookings")
    public ResponseEntity<List<BookingResponse>> getAllBookings() {
        return ResponseEntity.ok(bookingService.getAllBookings());
    }

    @GetMapping("/bookings/{id}")
    public ResponseEntity<BookingResponse> getBookingById(@PathVariable Long id) {
        return ResponseEntity.ok(bookingService.getBookingById(id));
    }

    @GetMapping("/bookings/tour/{tourId}")
    public ResponseEntity<List<BookingResponse>> getBookingsByTour(@PathVariable Long tourId) {
        return ResponseEntity.ok(bookingService.getBookingsByTourId(tourId));
    }

    @GetMapping("/bookings/email/{email}")
    public ResponseEntity<List<BookingResponse>> getBookingsByEmail(@PathVariable String email) {
        return ResponseEntity.ok(bookingService.getBookingsByCustomerEmail(email));
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