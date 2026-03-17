package com.anandaholidays.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Entity
@Table(name = "bookings")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Booking {

    public static final String STATUS_CONFIRMED = "CONFIRMED";
    public static final String STATUS_CANCELLED = "CANCELLED";
    public static final String STATUS_COMPLETED = "COMPLETED";
    public static final String STATUS_PENDING = "PENDING";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String customerName;

    @Column(nullable = false)
    private String customerEmail;

    @Column(nullable = false)
    private String customerPhone;

    private Integer numberOfAdults;
    private Integer numberOfChildren;

    @Column(nullable = false)
    private LocalDateTime bookingDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "tour_id", nullable = false)
    private Tour tour;

    private String specialRequests;

    @Column(nullable = false)
    private Double totalAmount;

    private String bookingStatus = STATUS_CONFIRMED;

    @PrePersist
    protected void onCreate() {
        bookingDate = LocalDateTime.now();
    }

    public void setBookingStatus(String status) {
        List<String> validStatuses = Arrays.asList(
                STATUS_CONFIRMED, STATUS_CANCELLED, STATUS_COMPLETED, STATUS_PENDING
        );
        if (!validStatuses.contains(status)) {
            throw new IllegalArgumentException("Invalid booking status: " + status);
        }
        this.bookingStatus = status;
    }
}