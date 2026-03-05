package com.anandaholidays.controller;

import com.anandaholidays.dto.TourRequest;
import com.anandaholidays.dto.TourResponse;
import com.anandaholidays.service.TourService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/admin")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class AdminController {

    private final TourService tourService;

    @PostMapping("/tours")
    public ResponseEntity<TourResponse> createTour(@Valid @RequestBody TourRequest request) {
        return new ResponseEntity<>(tourService.createTour(request), HttpStatus.CREATED);
    }

    @PutMapping("/tours/{id}")
    public ResponseEntity<TourResponse> updateTour(@PathVariable Long id, @Valid @RequestBody TourRequest request) {
        return ResponseEntity.ok(tourService.updateTour(id, request));
    }

    @DeleteMapping("/tours/{id}")
    public ResponseEntity<Void> deleteTour(@PathVariable Long id) {
        tourService.deleteTour(id);
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