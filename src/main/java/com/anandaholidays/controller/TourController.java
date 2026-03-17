package com.anandaholidays.controller;

import com.anandaholidays.dto.TourResponse;
import com.anandaholidays.entity.TourType;
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

    // New search endpoints for users
    @GetMapping("/search")
    public ResponseEntity<List<TourResponse>> searchTours(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String destination,
            @RequestParam(required = false) TourType type,
            @RequestParam(required = false) Double minPrice,
            @RequestParam(required = false) Double maxPrice,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {

        List<TourResponse> results;

        if (keyword != null && !keyword.isEmpty()) {
            results = tourService.searchTours(keyword);
        } else if (destination != null && !destination.isEmpty()) {
            results = tourService.filterByDestination(destination);
        } else if (type != null) {
            results = tourService.filterByType(type);
        } else if (minPrice != null && maxPrice != null) {
            results = tourService.filterByPriceRange(minPrice, maxPrice);
        } else if (startDate != null && endDate != null) {
            results = tourService.filterByDateRange(startDate, endDate);
        } else {
            results = tourService.getAllTours();
        }

        return ResponseEntity.ok(results);
    }

    @GetMapping("/filter/destination/{destination}")
    public ResponseEntity<List<TourResponse>> filterByDestination(@PathVariable String destination) {
        return ResponseEntity.ok(tourService.filterByDestination(destination));
    }

    @GetMapping("/filter/type/{type}")
    public ResponseEntity<List<TourResponse>> filterByType(@PathVariable TourType type) {
        return ResponseEntity.ok(tourService.filterByType(type));
    }

    @GetMapping("/filter/price")
    public ResponseEntity<List<TourResponse>> filterByPriceRange(
            @RequestParam Double minPrice,
            @RequestParam Double maxPrice) {
        return ResponseEntity.ok(tourService.filterByPriceRange(minPrice, maxPrice));
    }

    @GetMapping("/filter/date")
    public ResponseEntity<List<TourResponse>> filterByDateRange(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        return ResponseEntity.ok(tourService.filterByDateRange(startDate, endDate));
    }
}