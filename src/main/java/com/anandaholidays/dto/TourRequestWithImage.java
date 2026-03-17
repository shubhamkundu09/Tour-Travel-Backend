package com.anandaholidays.dto;

import com.anandaholidays.entity.TourType;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TourRequestWithImage {

    @NotBlank(message = "Tour name is required")
    private String tourName;

    @NotNull(message = "Tour price is required")
    @Positive(message = "Tour price must be positive")
    private Double tourPrice;

    @NotBlank(message = "Tour destination is required")
    private String tourDestination;

    @NotBlank(message = "Tour location is required")
    private String tourLocation;

    @NotNull(message = "Tour days are required")
    @Min(value = 1, message = "Tour days must be at least 1")
    private Integer tourDays;

    @NotNull(message = "Tour nights are required")
    @Min(value = 0, message = "Tour nights must be non-negative")
    private Integer tourNights;

    private List<String> tourInclusions;
    private List<String> tourExclusions;

    // Main image file
    private MultipartFile tourImage;

    // Additional images
    private List<MultipartFile> additionalImages;

    private String tourDescription;
    private List<String> tourServices;

    @NotNull(message = "Tour type is required")
    private TourType tourType;

    @NotNull(message = "Tour starting date is required")
    @Future(message = "Tour starting date must be in the future")
    private LocalDate tourStartingDate;

    @NotNull(message = "Tour ending date is required")
    @Future(message = "Tour ending date must be in the future")
    private LocalDate tourEndingDate;

    private String tourHelplineNumber;
    private String tourMapEmbedUrl;
}