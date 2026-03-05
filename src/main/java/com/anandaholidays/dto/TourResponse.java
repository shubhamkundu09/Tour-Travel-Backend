package com.anandaholidays.dto;

import com.anandaholidays.entity.TourType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TourResponse {
    private Long id;
    private String tourName;
    private Double tourPrice;
    private String tourDestination;
    private String tourLocation;
    private Integer tourDays;
    private Integer tourNights;
    private List<String> tourInclusions;
    private List<String> tourExclusions;
    private List<String> tourImages;
    private String tourDescription;
    private List<String> tourServices;
    private TourType tourType;
    private LocalDate tourStartingDate;
    private LocalDate tourEndingDate;
    private String tourHelplineNumber;
    private String tourMapEmbedUrl;
    private Boolean isActive;
}