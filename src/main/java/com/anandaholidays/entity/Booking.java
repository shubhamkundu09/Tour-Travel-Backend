// Booking.java
package com.anandaholidays.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Table(name = "bookings")
@Data
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

    private LocalDateTime bookingDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "tour_id", nullable = false)
    private Tour tour;

    private String specialRequests;

    private Double totalAmount;

    private String bookingStatus = STATUS_CONFIRMED;

    @PrePersist
    protected void onCreate() {
        bookingDate = LocalDateTime.now();
    }
}