package com.anandaholidays.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Entity
@Table(name = "bookings")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Booking {

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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tour_id", nullable = false)
    private Tour tour;

    private String specialRequests;

    @Column(nullable = false)
    private Double totalAmount;

    private String bookingStatus = "CONFIRMED";

    @PrePersist
    protected void onCreate() {
        bookingDate = LocalDateTime.now();
    }
}