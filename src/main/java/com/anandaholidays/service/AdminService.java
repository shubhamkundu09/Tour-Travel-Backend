package com.anandaholidays.service;

import com.anandaholidays.entity.Admin;
import com.anandaholidays.repository.AdminRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import jakarta.annotation.PostConstruct;

@Service
@RequiredArgsConstructor
@Slf4j
public class AdminService {  // Removed UserDetailsService implementation

    private final AdminRepository adminRepository;
    private final PasswordEncoder passwordEncoder;  // Now this is properly injected

    @PostConstruct
    @Transactional
    public void initAdmin() {
        try {
            // Create default admin if not exists
            if (!adminRepository.existsByUsername("admin")) {
                Admin admin = new Admin();
                admin.setUsername("admin");
                admin.setPassword(passwordEncoder.encode("admin123"));
                admin.setEmail("admin@anandaholidays.com");
                admin.setRole("ADMIN");
                adminRepository.save(admin);
                log.info("Default admin created - Username: admin, Password: admin123");
            } else {
                log.info("Admin already exists");
            }
        } catch (Exception e) {
            log.error("Error creating default admin: {}", e.getMessage());
        }
    }
}