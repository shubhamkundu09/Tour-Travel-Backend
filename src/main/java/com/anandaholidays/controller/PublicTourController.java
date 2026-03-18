// PublicTourController.java
package com.anandaholidays.controller;

import com.anandaholidays.dto.TourResponse;
import com.anandaholidays.service.TourService;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/tours")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class PublicTourController {

    private final TourService tourService;

    @GetMapping
    public ResponseEntity<List<TourResponse>> getAllTours() {
        return ResponseEntity.ok(tourService.getAllActiveTours());
    }

    @GetMapping("/upcoming")
    public ResponseEntity<List<TourResponse>> getUpcomingTours() {
        return ResponseEntity.ok(tourService.getToursByStatus("UPCOMING"));
    }

    @GetMapping("/ongoing")
    public ResponseEntity<List<TourResponse>> getOngoingTours() {
        return ResponseEntity.ok(tourService.getToursByStatus("ONGOING"));
    }

    @GetMapping("/completed")
    public ResponseEntity<List<TourResponse>> getCompletedTours() {
        return ResponseEntity.ok(tourService.getToursByStatus("COMPLETED"));
    }

    @GetMapping("/{id}")
    public ResponseEntity<TourResponse> getTourById(@PathVariable Long id) {
        return ResponseEntity.ok(tourService.getTourById(id));
    }

    @GetMapping("/search")
    public ResponseEntity<List<TourResponse>> searchTours(
            @RequestParam(required = false) String destination,
            @RequestParam(required = false) Double minPrice,
            @RequestParam(required = false) Double maxPrice,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {

        return ResponseEntity.ok(tourService.searchTours(destination, minPrice, maxPrice, startDate, endDate));
    }
}