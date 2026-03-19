package com.anandaholidays.config;

import com.anandaholidays.security.JwtAuthenticationEntryPoint;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;
    private final JwtAuthenticationFilter jwtAuthenticationFilter;
    private final UserDetailsService userDetailsService;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .exceptionHandling(exception -> exception
                        .authenticationEntryPoint(jwtAuthenticationEntryPoint)
                )
                .authorizeHttpRequests(auth -> auth
                        // FIX: Use AntPathRequestMatcher explicitly because both JspServlet
                        // and DispatcherServlet are registered. Spring Security cannot
                        // auto-detect which matcher to use when multiple servlets exist.

                        // Public JSP pages
                        .requestMatchers(new AntPathRequestMatcher("/")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/index")).permitAll()
                        // Add this line in SecurityConfig.java
                        .requestMatchers(new AntPathRequestMatcher("/test")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/tours")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/admin")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/error")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/WEB-INF/jsp/**")).permitAll()

                        // Static resources
                        .requestMatchers(new AntPathRequestMatcher("/static/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/css/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/js/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/images/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/uploads/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/*.css")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/*.js")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/*.png")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/*.jpg")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/*.jpeg")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/*.gif")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/*.svg")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/*.ico")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/favicon.ico")).permitAll()

                        // Public API endpoints
                        .requestMatchers(new AntPathRequestMatcher("/api/auth/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/api/tours/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/api/images/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/api/bookings/**")).permitAll()

                        // Protected endpoints
                        .requestMatchers(new AntPathRequestMatcher("/api/admin/**")).hasRole("ADMIN")

                        // Any other request needs authentication
                        .anyRequest().authenticated()
                )
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                );

        http.addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }
}