package com.anandaholidays.dto;

import com.anandaholidays.entity.TourType;
import jakarta.validation.constraints.*;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
public class TourRequest {
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
    @Min(1)
    private Integer tourDays;

    @NotNull(message = "Tour nights are required")
    @Min(0)
    private Integer tourNights;

    private List<String> tourInclusions = new ArrayList<>();
    private List<String> tourExclusions = new ArrayList<>();
    private List<String> tourServices = new ArrayList<>();

    @NotNull(message = "Tour type is required")
    private TourType tourType;

    @NotNull(message = "Tour starting date is required")
    @Future(message = "Tour starting date must be in the future")
    private LocalDate tourStartingDate;

    @NotNull(message = "Tour ending date is required")
    @Future(message = "Tour ending date must be in the future")
    private LocalDate tourEndingDate;

    private String tourDescription;
    private String tourHelplineNumber;
    private String tourMapEmbedUrl;

    // For file uploads
    private MultipartFile mainImage;
    private List<MultipartFile> additionalImages = new ArrayList<>();

    // For updates
    private List<String> existingImages = new ArrayList<>();
    private List<String> imagesToDelete = new ArrayList<>();
}