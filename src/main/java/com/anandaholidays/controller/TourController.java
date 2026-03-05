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
@RequestMapping("/api/tours")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class TourController {

    private final TourService tourService;

    @GetMapping
    public ResponseEntity<List<TourResponse>> getAllTours() {
        return ResponseEntity.ok(tourService.getAllTours());
    }

    @GetMapping("/upcoming")
    public ResponseEntity<List<TourResponse>> getUpcomingTours() {
        return ResponseEntity.ok(tourService.getUpcomingTours());
    }

    @GetMapping("/ongoing")
    public ResponseEntity<List<TourResponse>> getOngoingTours() {
        return ResponseEntity.ok(tourService.getOngoingTours());
    }

    @GetMapping("/completed")
    public ResponseEntity<List<TourResponse>> getCompletedTours() {
        return ResponseEntity.ok(tourService.getCompletedTours());
    }

    @GetMapping("/{id}")
    public ResponseEntity<TourResponse> getTourById(@PathVariable Long id) {
        return ResponseEntity.ok(tourService.getTourById(id));
    }
}