// BookingService.java
package com.anandaholidays.service;

import com.anandaholidays.dto.BookingRequest;
import com.anandaholidays.dto.BookingResponse;
import com.anandaholidays.dto.TourResponse;
import com.anandaholidays.entity.Booking;
import com.anandaholidays.entity.Tour;
import com.anandaholidays.exception.ResourceNotFoundException;
import com.anandaholidays.repository.BookingRepository;
import com.anandaholidays.repository.TourRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class BookingService {

    private final BookingRepository bookingRepository;
    private final TourRepository tourRepository;
    private final EmailService emailService;
    private final TourService tourService;

    @Transactional
    public BookingResponse createBooking(BookingRequest request) {
        Tour tour = tourRepository.findById(request.getTourId())
                .orElseThrow(() -> new ResourceNotFoundException("Tour not found"));

        // Validate tour availability
        if (!tour.getIsActive() || tour.getTourEndingDate().isBefore(LocalDate.now())) {
            throw new IllegalStateException("Tour is not available for booking");
        }

        Booking booking = new Booking();
        booking.setCustomerName(request.getCustomerName());
        booking.setCustomerEmail(request.getCustomerEmail());
        booking.setCustomerPhone(request.getCustomerPhone());
        booking.setNumberOfAdults(request.getNumberOfAdults());
        booking.setNumberOfChildren(request.getNumberOfChildren() != null ? request.getNumberOfChildren() : 0);
        booking.setTour(tour);
        booking.setSpecialRequests(request.getSpecialRequests());
        booking.setTotalAmount(tour.getTourPrice() * request.getNumberOfAdults());
        booking.setBookingStatus(Booking.STATUS_CONFIRMED);

        Booking savedBooking = bookingRepository.save(booking);
        log.info("Booking created with id: {}", savedBooking.getId());

        // Send emails asynchronously
        emailService.sendBookingEmails(savedBooking);

        return mapToResponse(savedBooking);
    }

    @Transactional(readOnly = true)
    public List<BookingResponse> getAllBookings() {
        return bookingRepository.findAll().stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public BookingResponse getBookingById(Long id) {
        return mapToResponse(findById(id));
    }

    @Transactional
    public BookingResponse updateBookingStatus(Long id, String status) {
        Booking booking = findById(id);
        booking.setBookingStatus(status);
        Booking updatedBooking = bookingRepository.save(booking);

        emailService.sendBookingStatusUpdateEmail(updatedBooking);
        log.info("Booking {} status updated to {}", id, status);

        return mapToResponse(updatedBooking);
    }

    @Transactional
    public void deleteBooking(Long id) {
        Booking booking = findById(id);
        bookingRepository.delete(booking);
        log.info("Booking deleted with id: {}", id);
    }

    private Booking findById(Long id) {
        return bookingRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Booking not found with id: " + id));
    }

    private BookingResponse mapToResponse(Booking booking) {
        BookingResponse response = new BookingResponse();
        response.setId(booking.getId());
        response.setCustomerName(booking.getCustomerName());
        response.setCustomerEmail(booking.getCustomerEmail());
        response.setCustomerPhone(booking.getCustomerPhone());
        response.setNumberOfAdults(booking.getNumberOfAdults());
        response.setNumberOfChildren(booking.getNumberOfChildren());
        response.setBookingDate(booking.getBookingDate());
        response.setTour(tourService.getTourById(booking.getTour().getId()));
        response.setTotalAmount(booking.getTotalAmount());
        response.setBookingStatus(booking.getBookingStatus());
        return response;
    }
}