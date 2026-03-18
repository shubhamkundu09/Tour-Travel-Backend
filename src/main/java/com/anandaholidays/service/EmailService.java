// EmailService.java
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
    public void sendBookingEmails(Booking booking) {
        sendCustomerConfirmation(booking);
        sendAdminNotification(booking);
    }

    @Async
    public void sendBookingStatusUpdateEmail(Booking booking) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(booking.getCustomerEmail());
            message.setSubject("Booking Status Update - AnandaHolidays");
            message.setText(String.format(
                    "Dear %s,\n\nYour booking status has been updated to: %s\n\nBooking ID: %d\nTour: %s\n\nThank you for choosing AnandaHolidays!",
                    booking.getCustomerName(), booking.getBookingStatus(), booking.getId(), booking.getTour().getTourName()
            ));
            mailSender.send(message);
            log.info("Status update email sent to: {}", booking.getCustomerEmail());
        } catch (Exception e) {
            log.error("Failed to send status update email: {}", e.getMessage());
        }
    }

    @Async
    protected void sendCustomerConfirmation(Booking booking) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(booking.getCustomerEmail());
            message.setSubject("Booking Confirmation - AnandaHolidays");
            message.setText(String.format(
                    "Dear %s,\n\nYour booking has been confirmed!\n\nBooking ID: %d\nTour: %s\nDestination: %s\nDate: %s to %s\nAdults: %d\nChildren: %d\nTotal: ₹%.2f\n\nThank you for choosing AnandaHolidays!",
                    booking.getCustomerName(), booking.getId(), booking.getTour().getTourName(),
                    booking.getTour().getTourDestination(), booking.getTour().getTourStartingDate(),
                    booking.getTour().getTourEndingDate(), booking.getNumberOfAdults(),
                    booking.getNumberOfChildren(), booking.getTotalAmount()
            ));
            mailSender.send(message);
            log.info("Confirmation email sent to: {}", booking.getCustomerEmail());
        } catch (Exception e) {
            log.error("Failed to send confirmation email: {}", e.getMessage());
        }
    }

    @Async
    protected void sendAdminNotification(Booking booking) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(adminEmail);
            message.setSubject("New Booking Alert - AnandaHolidays");
            message.setText(String.format(
                    "New booking received!\n\nBooking ID: %d\nCustomer: %s\nEmail: %s\nPhone: %s\nTour: %s\nAdults: %d\nChildren: %d\nTotal: ₹%.2f",
                    booking.getId(), booking.getCustomerName(), booking.getCustomerEmail(),
                    booking.getCustomerPhone(), booking.getTour().getTourName(),
                    booking.getNumberOfAdults(), booking.getNumberOfChildren(), booking.getTotalAmount()
            ));
            mailSender.send(message);
            log.info("Admin notification sent for booking: {}", booking.getId());
        } catch (Exception e) {
            log.error("Failed to send admin notification: {}", e.getMessage());
        }
    }
}