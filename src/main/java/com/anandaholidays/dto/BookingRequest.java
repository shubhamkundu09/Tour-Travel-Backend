// BookingRequest.java
package com.anandaholidays.dto;

import jakarta.validation.constraints.*;
import lombok.Data;

@Data
public class BookingRequest {
    @NotBlank(message = "Customer name is required")
    private String customerName;

    @NotBlank(message = "Customer email is required")
    @Email(message = "Invalid email format")
    private String customerEmail;

    @NotBlank(message = "Customer phone is required")
    private String customerPhone;

    @NotNull(message = "Number of adults is required")
    @Positive
    private Integer numberOfAdults;

    private Integer numberOfChildren = 0;

    @NotNull(message = "Tour ID is required")
    private Long tourId;

    private String specialRequests;
}