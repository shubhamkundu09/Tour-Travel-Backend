// AuthController.java
package com.anandaholidays.controller;

import com.anandaholidays.dto.LoginRequest;
import com.anandaholidays.dto.AuthResponse;
import com.anandaholidays.entity.Admin;
import com.anandaholidays.security.JwtUtil;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody LoginRequest request) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword())
        );

        Admin admin = (Admin) authentication.getPrincipal();
        String token = jwtUtil.generateToken(admin);

        return ResponseEntity.ok(new AuthResponse(
                token, "Bearer", admin.getId(), admin.getUsername(), admin.getEmail(), admin.getRole()
        ));
    }
}