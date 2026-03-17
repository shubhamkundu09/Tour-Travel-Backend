package com.anandaholidays.dto;

import com.anandaholidays.entity.TourType;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
public class TourSearchResponse {
    private List<TourResponse> tours;
    private long totalCount;
    private int page;
    private int size;
    private FilterCriteria filters;

    @Data
    public static class FilterCriteria {
        private String keyword;
        private String destination;
        private TourType type;
        private Double minPrice;
        private Double maxPrice;
        private String status; // upcoming, ongoing, completed, all
        private LocalDate startDate;
        private LocalDate endDate;
    }
}