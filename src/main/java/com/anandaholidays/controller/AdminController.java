package com.anandaholidays.controller;

import com.anandaholidays.dto.TourRequestWithImage;
import com.anandaholidays.dto.TourResponse;
import com.anandaholidays.service.TourService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
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

    @PostMapping(value = "/tours", consumes = {"multipart/form-data"})
    public ResponseEntity<TourResponse> createTour(
            @Valid @RequestPart("tour") TourRequestWithImage request,
            @RequestPart(value = "tourImage", required = false) MultipartFile tourImage,
            @RequestPart(value = "additionalImages", required = false) List<MultipartFile> additionalImages) throws IOException {

        request.setTourImage(tourImage);
        request.setAdditionalImages(additionalImages);
        return new ResponseEntity<>(tourService.createTourWithImages(request), HttpStatus.CREATED);
    }

    @PutMapping(value = "/tours/{id}", consumes = {"multipart/form-data"})
    public ResponseEntity<TourResponse> updateTour(
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
}