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
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class BookingService {

    private final BookingRepository bookingRepository;
    private final TourRepository tourRepository;
    private final EmailService emailService;
    private final TourService tourService;

    @Transactional
    public BookingResponse createBooking(BookingRequest request) {
        Tour tour = tourRepository.findById(request.getTourId())
                .orElseThrow(() -> new ResourceNotFoundException("Tour not found with id: " + request.getTourId()));

        Booking booking = new Booking();
        booking.setCustomerName(request.getCustomerName());
        booking.setCustomerEmail(request.getCustomerEmail());
        booking.setCustomerPhone(request.getCustomerPhone());
        booking.setNumberOfAdults(request.getNumberOfAdults());
        booking.setNumberOfChildren(request.getNumberOfChildren());
        booking.setTour(tour);
        booking.setSpecialRequests(request.getSpecialRequests());

        // Calculate total amount
        double totalAmount = tour.getTourPrice() * request.getNumberOfAdults();
        booking.setTotalAmount(totalAmount);

        Booking savedBooking = bookingRepository.save(booking);

        // Send emails
        emailService.sendBookingConfirmationToCustomer(savedBooking);
        emailService.sendBookingNotificationToAdmin(savedBooking);

        return mapToResponse(savedBooking);
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