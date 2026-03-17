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
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
                .orElseThrow(() -> new ResourceNotFoundException("Tour not found with id: " + request.getTourId()));

        // Check if tour is active and available
        if (!tour.getIsActive()) {
            throw new IllegalStateException("Tour is not available for booking");
        }

        // Check if tour dates are valid
        if (tour.getTourEndingDate().isBefore(java.time.LocalDate.now())) {
            throw new IllegalStateException("Cannot book a tour that has already ended");
        }

        Booking booking = new Booking();
        booking.setCustomerName(request.getCustomerName());
        booking.setCustomerEmail(request.getCustomerEmail());
        booking.setCustomerPhone(request.getCustomerPhone());
        booking.setNumberOfAdults(request.getNumberOfAdults());
        booking.setNumberOfChildren(request.getNumberOfChildren() != null ? request.getNumberOfChildren() : 0);
        booking.setTour(tour);
        booking.setSpecialRequests(request.getSpecialRequests());

        // Calculate total amount
        double totalAmount = tour.getTourPrice() * booking.getNumberOfAdults();
        booking.setTotalAmount(totalAmount);
        booking.setBookingStatus(Booking.STATUS_CONFIRMED);

        Booking savedBooking = bookingRepository.save(booking);
        log.info("Booking created successfully with id: {}", savedBooking.getId());

        // Send emails asynchronously
        sendBookingEmails(savedBooking);

        return mapToResponse(savedBooking);
    }

    @Async
    protected void sendBookingEmails(Booking booking) {
        try {
            emailService.sendBookingConfirmationToCustomer(booking);
            emailService.sendBookingNotificationToAdmin(booking);
            log.info("Booking emails sent for booking id: {}", booking.getId());
        } catch (Exception e) {
            log.error("Failed to send booking emails for id {}: {}", booking.getId(), e.getMessage());
        }
    }

    @Transactional(readOnly = true)
    public List<BookingResponse> getAllBookings() {
        return bookingRepository.findAll().stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public BookingResponse getBookingById(Long id) {
        Booking booking = bookingRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Booking not found with id: " + id));
        return mapToResponse(booking);
    }

    @Transactional(readOnly = true)
    public List<BookingResponse> getBookingsByTourId(Long tourId) {
        return bookingRepository.findByTourId(tourId).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<BookingResponse> getBookingsByCustomerEmail(String email) {
        return bookingRepository.findByCustomerEmail(email).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<BookingResponse> getBookingsByCustomerPhone(String phone) {
        return bookingRepository.findByCustomerPhone(phone).stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    @Transactional
    public BookingResponse updateBookingStatus(Long id, String status) {
        Booking booking = bookingRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Booking not found with id: " + id));

        booking.setBookingStatus(status);
        Booking updatedBooking = bookingRepository.save(booking);
        log.info("Booking status updated for id: {} to {}", id, status);

        // Send status update email to customer
        try {
            emailService.sendBookingStatusUpdateEmail(updatedBooking);
        } catch (Exception e) {
            log.error("Failed to send status update email: {}", e.getMessage());
        }

        return mapToResponse(updatedBooking);
    }

    @Transactional
    public void deleteBooking(Long id) {
        Booking booking = bookingRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Booking not found with id: " + id));

        bookingRepository.delete(booking);
        log.info("Booking deleted with id: {}", id);
    }

    private BookingResponse mapToResponse(Booking booking) {
        TourResponse tourResponse = tourService.getTourById(booking.getTour().getId());

        return new BookingResponse(
                booking.getId(),
                booking.getCustomerName(),
                booking.getCustomerEmail(),
                booking.getCustomerPhone(),
                booking.getNumberOfAdults(),
                booking.getNumberOfChildren(),
                booking.getBookingDate(),
                tourResponse,
                booking.getTotalAmount(),
                booking.getBookingStatus()
        );
    }
}