package com.anandaholidays.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookingResponse {
    private Long id;
    private String customerName;
    private String customerEmail;
    private String customerPhone;
    private Integer numberOfAdults;
    private Integer numberOfChildren;
    private LocalDateTime bookingDate;
    private TourResponse tour;
    private Double totalAmount;
    private String bookingStatus;
}