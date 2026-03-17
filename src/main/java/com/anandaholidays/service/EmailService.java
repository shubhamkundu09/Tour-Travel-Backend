package com.anandaholidays.service;

import com.anandaholidays.entity.Booking;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailService {

    private final JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    @Value("${admin.email}")
    private String adminEmail;

    @Async
    public void sendBookingConfirmationToCustomer(Booking booking) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(booking.getCustomerEmail());
            message.setSubject("Booking Confirmation - AnandaHolidays");

            String emailBody = String.format(
                    "Dear %s,\n\n" +
                            "Thank you for booking with AnandaHolidays! Your booking has been confirmed.\n\n" +
                            "═══════════════════════════════════════\n" +
                            "           BOOKING DETAILS\n" +
                            "═══════════════════════════════════════\n\n" +
                            "Booking ID: %d\n" +
                            "Booking Date: %s\n\n" +
                            "Tour Details:\n" +
                            "─────────────\n" +
                            "Tour: %s\n" +
                            "Destination: %s\n" +
                            "Location: %s\n" +
                            "Duration: %d Days / %d Nights\n" +
                            "Date: %s to %s\n\n" +
                            "Guest Details:\n" +
                            "──────────────\n" +
                            "Adults: %d\n" +
                            "Children: %d\n" +
                            "Total Amount: ₹%.2f\n\n" +
                            "Special Requests: %s\n\n" +
                            "═══════════════════════════════════════\n\n" +
                            "We will contact you shortly with more details about your tour.\n\n" +
                            "For any queries, please contact our helpline: %s\n\n" +
                            "Thank you for choosing AnandaHolidays!\n" +
                            "Team AnandaHolidays",
                    booking.getCustomerName(),
                    booking.getId(),
                    booking.getBookingDate().toString(),
                    booking.getTour().getTourName(),
                    booking.getTour().getTourDestination(),
                    booking.getTour().getTourLocation(),
                    booking.getTour().getTourDays(),
                    booking.getTour().getTourNights(),
                    booking.getTour().getTourStartingDate(),
                    booking.getTour().getTourEndingDate(),
                    booking.getNumberOfAdults(),
                    booking.getNumberOfChildren(),
                    booking.getTotalAmount(),
                    booking.getSpecialRequests() != null ? booking.getSpecialRequests() : "None",
                    booking.getTour().getTourHelplineNumber() != null ?
                            booking.getTour().getTourHelplineNumber() : "Not provided"
            );

            message.setText(emailBody);
            mailSender.send(message);
            log.info("Booking confirmation email sent to: {}", booking.getCustomerEmail());

        } catch (Exception e) {
            log.error("Failed to send confirmation email to customer {}: {}",
                    booking.getCustomerEmail(), e.getMessage());
        }
    }

    @Async
    public void sendBookingNotificationToAdmin(Booking booking) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(adminEmail);
            message.setSubject("New Booking Alert - AnandaHolidays");

            String emailBody = String.format(
                    "New booking has been made:\n\n" +
                            "═══════════════════════════════════════\n" +
                            "           NEW BOOKING ALERT\n" +
                            "═══════════════════════════════════════\n\n" +
                            "Booking ID: %d\n" +
                            "Booking Date: %s\n\n" +
                            "Customer Information:\n" +
                            "────────────────────\n" +
                            "Name: %s\n" +
                            "Email: %s\n" +
                            "Phone: %s\n\n" +
                            "Tour Information:\n" +
                            "─────────────────\n" +
                            "Tour: %s\n" +
                            "Destination: %s\n" +
                            "Date: %s to %s\n" +
                            "Adults: %d\n" +
                            "Children: %d\n" +
                            "Total Amount: ₹%.2f\n\n" +
                            "Special Requests: %s\n\n" +
                            "Please check the admin dashboard for more details.",
                    booking.getId(),
                    booking.getBookingDate().toString(),
                    booking.getCustomerName(),
                    booking.getCustomerEmail(),
                    booking.getCustomerPhone(),
                    booking.getTour().getTourName(),
                    booking.getTour().getTourDestination(),
                    booking.getTour().getTourStartingDate(),
                    booking.getTour().getTourEndingDate(),
                    booking.getNumberOfAdults(),
                    booking.getNumberOfChildren(),
                    booking.getTotalAmount(),
                    booking.getSpecialRequests() != null ? booking.getSpecialRequests() : "None"
            );

            message.setText(emailBody);
            mailSender.send(message);
            log.info("Booking notification sent to admin for booking id: {}", booking.getId());

        } catch (Exception e) {
            log.error("Failed to send notification email to admin: {}", e.getMessage());
        }
    }

    @Async
    public void sendBookingStatusUpdateEmail(Booking booking) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(booking.getCustomerEmail());
            message.setSubject("Booking Status Update - AnandaHolidays");

            String emailBody = String.format(
                    "Dear %s,\n\n" +
                            "Your booking status has been updated.\n\n" +
                            "Booking ID: %d\n" +
                            "New Status: %s\n\n" +
                            "Tour: %s\n" +
                            "Destination: %s\n\n" +
                            "If you have any questions, please contact our support team.\n\n" +
                            "Thank you for choosing AnandaHolidays!\n" +
                            "Team AnandaHolidays",
                    booking.getCustomerName(),
                    booking.getId(),
                    booking.getBookingStatus(),
                    booking.getTour().getTourName(),
                    booking.getTour().getTourDestination()
            );

            message.setText(emailBody);
            mailSender.send(message);
            log.info("Status update email sent to: {} for booking id: {}",
                    booking.getCustomerEmail(), booking.getId());

        } catch (Exception e) {
            log.error("Failed to send status update email: {}", e.getMessage());
        }
    }
}