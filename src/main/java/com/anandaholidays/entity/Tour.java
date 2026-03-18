// Tour.java
package com.anandaholidays.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tours")
@Data
public class Tour {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String tourName;

    @Column(nullable = false)
    private Double tourPrice;

    @Column(nullable = false)
    private String tourDestination;

    @Column(nullable = false)
    private String tourLocation;

    @Column(nullable = false)
    private Integer tourDays;

    @Column(nullable = false)
    private Integer tourNights;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "tour_inclusions")
    private List<String> tourInclusions = new ArrayList<>();

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "tour_exclusions")
    private List<String> tourExclusions = new ArrayList<>();

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "tour_services")
    private List<String> tourServices = new ArrayList<>();

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "tour_images")
    @Column(length = 500)
    private List<String> tourImages = new ArrayList<>();

    @Column(length = 2000)
    private String tourDescription;

    @Enumerated(EnumType.STRING)
    private TourType tourType;

    @Column(nullable = false)
    private LocalDate tourStartingDate;

    @Column(nullable = false)
    private LocalDate tourEndingDate;

    private String tourHelplineNumber;

    @Column(length = 1000)
    private String tourMapEmbedUrl;

    @Column(nullable = false)
    private Boolean isActive = true;

    private LocalDate createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDate.now();
    }
}