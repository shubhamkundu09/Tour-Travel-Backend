package com.anandaholidays.repository;

import com.anandaholidays.entity.Tour;
import com.anandaholidays.entity.TourType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface TourRepository extends JpaRepository<Tour, Long> {

    List<Tour> findByIsActiveTrue();

    @Query("SELECT t FROM Tour t WHERE t.tourStartingDate > :currentDate AND t.isActive = true")
    List<Tour> findUpcomingTours(@Param("currentDate") LocalDate currentDate);

    @Query("SELECT t FROM Tour t WHERE t.tourStartingDate <= :currentDate AND t.tourEndingDate >= :currentDate AND t.isActive = true")
    List<Tour> findOngoingTours(@Param("currentDate") LocalDate currentDate);

    @Query("SELECT t FROM Tour t WHERE t.tourEndingDate < :currentDate AND t.isActive = true")
    List<Tour> findCompletedTours(@Param("currentDate") LocalDate currentDate);

    List<Tour> findByTourType(TourType tourType);

    List<Tour> findByTourDestinationContainingIgnoreCase(String destination);
}