package com.anandaholidays.service;

import com.anandaholidays.entity.Booking;
import com.anandaholidays.entity.Tour;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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

    public void sendBookingConfirmationToCustomer(Booking booking) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(booking.getCustomerEmail());
            message.setSubject("Booking Confirmation - AnandaHolidays");

            String emailBody = String.format(
                    "Dear %s,\n\n" +
                            "Thank you for booking with AnandaHolidays! Your booking has been confirmed.\n\n" +
                            "Booking Details:\n" +
                            "Booking ID: %d\n" +
                            "Tour: %s\n" +
                            "Destination: %s\n" +
                            "Date: %s to %s\n" +
                            "Number of Adults: %d\n" +
                            "Number of Children: %d\n" +
                            "Total Amount: ₹%.2f\n\n" +
                            "We will contact you shortly with more details.\n\n" +
                            "For any queries, please contact our helpline: %s\n\n" +
                            "Thank you for choosing AnandaHolidays!\n" +
                            "Team AnandaHolidays",
                    booking.getCustomerName(),
                    booking.getId(),
                    booking.getTour().getTourName(),
                    booking.getTour().getTourDestination(),
                    booking.getTour().getTourStartingDate(),
                    booking.getTour().getTourEndingDate(),
                    booking.getNumberOfAdults(),
                    booking.getNumberOfChildren(),
                    booking.getTotalAmount(),
                    booking.getTour().getTourHelplineNumber()
            );

            message.setText(emailBody);
            mailSender.send(message);
            log.info("Booking confirmation email sent to: {}", booking.getCustomerEmail());

        } catch (Exception e) {
            log.error("Failed to send email to customer: {}", e.getMessage());
        }
    }

    public void sendBookingNotificationToAdmin(Booking booking) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(adminEmail);
            message.setSubject("New Booking Alert - AnandaHolidays");

            String emailBody = String.format(
                    "New booking has been made:\n\n" +
                            "Booking ID: %d\n" +
                            "Customer Name: %s\n" +
                            "Customer Email: %s\n" +
                            "Customer Phone: %s\n" +
                            "Tour: %s\n" +
                            "Destination: %s\n" +
                            "Date: %s to %s\n" +
                            "Adults: %d, Children: %d\n" +
                            "Total Amount: ₹%.2f\n\n" +
                            "Please check the admin dashboard for more details.",
                    booking.getId(),
                    booking.getCustomerName(),
                    booking.getCustomerEmail(),
                    booking.getCustomerPhone(),
                    booking.getTour().getTourName(),
                    booking.getTour().getTourDestination(),
                    booking.getTour().getTourStartingDate(),
                    booking.getTour().getTourEndingDate(),
                    booking.getNumberOfAdults(),
                    booking.getNumberOfChildren(),
                    booking.getTotalAmount()
            );

            message.setText(emailBody);
            mailSender.send(message);
            log.info("Booking notification sent to admin");

        } catch (Exception e) {
            log.error("Failed to send email to admin: {}", e.getMessage());
        }
    }
}