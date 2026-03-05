package com.anandaholidays.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tours")
@Data
@NoArgsConstructor
@AllArgsConstructor
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

    @ElementCollection
    @CollectionTable(name = "tour_inclusions", joinColumns = @JoinColumn(name = "tour_id"))
    @Column(name = "inclusion")
    private List<String> tourInclusions = new ArrayList<>();

    @ElementCollection
    @CollectionTable(name = "tour_exclusions", joinColumns = @JoinColumn(name = "tour_id"))
    @Column(name = "exclusion")
    private List<String> tourExclusions = new ArrayList<>();

    @ElementCollection
    @CollectionTable(name = "tour_images", joinColumns = @JoinColumn(name = "tour_id"))
    @Column(name = "image_url", length = 500)
    private List<String> tourImages = new ArrayList<>();

    @Column(length = 2000)
    private String tourDescription;

    @ElementCollection
    @CollectionTable(name = "tour_services", joinColumns = @JoinColumn(name = "tour_id"))
    @Column(name = "service")
    private List<String> tourServices = new ArrayList<>();

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

    @Column(nullable = false)
    private LocalDate createdAt;

    private LocalDate updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDate.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDate.now();
    }
}