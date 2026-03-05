package com.anandaholidays.repository;

import com.anandaholidays.entity.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {

    List<Booking> findByTourId(Long tourId);

    List<Booking> findByCustomerEmail(String email);

    List<Booking> findByCustomerPhone(String phone);
}