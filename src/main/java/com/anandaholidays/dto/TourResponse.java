// TourResponse.java
package com.anandaholidays.dto;

import com.anandaholidays.entity.TourType;
import lombok.Data;
import java.time.LocalDate;
import java.util.List;

@Data
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
    private List<String> tourServices;
    private List<String> tourImages;
    private String tourDescription;
    private TourType tourType;
    private LocalDate tourStartingDate;
    private LocalDate tourEndingDate;
    private String tourHelplineNumber;
    private String tourMapEmbedUrl;
    private Boolean isActive;
    private String status; // UPCOMING, ONGOING, COMPLETED
}