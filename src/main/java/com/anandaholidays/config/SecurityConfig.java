package com.anandaholidays.config;

import com.anandaholidays.security.JwtAuthenticationEntryPoint;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
public class SecurityConfig {

    private final JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;
    private final JwtAuthenticationFilter jwtAuthenticationFilter;
    private final UserDetailsService userDetailsService;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        log.info("Configuring Security Filter Chain");

        http
                .csrf(csrf -> csrf.disable())
                .exceptionHandling(exception -> exception
                        .authenticationEntryPoint(jwtAuthenticationEntryPoint)
                )
                .authorizeHttpRequests(auth -> auth

                        // ── Public JSP pages ──
                        .requestMatchers(new AntPathRequestMatcher("/")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/index")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/home")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/admin")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/error")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/test")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/tours")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/tour-detail")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/destination")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/destinations")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/admin")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/about")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/gallery")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/WEB-INF/jsp/**")).permitAll()

                        // ── Static resource directories ──
                        .requestMatchers(new AntPathRequestMatcher("/static/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/css/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/js/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/images/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/uploads/**")).permitAll()

                        // ── Image file extensions ──
                        .requestMatchers(new AntPathRequestMatcher("/**/*.css")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.js")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.png")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.jpg")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.jpeg")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.gif")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.svg")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.ico")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.webp")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.avif")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/favicon.ico")).permitAll()

                        // ── Font file extensions — required for Tabler Icons ──
                        .requestMatchers(new AntPathRequestMatcher("/**/*.woff")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.woff2")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.ttf")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.eot")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/**/*.otf")).permitAll()

                        // ── Public API endpoints ──
                        .requestMatchers(new AntPathRequestMatcher("/api/auth/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/api/tours/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/api/images/**")).permitAll()
                        .requestMatchers(new AntPathRequestMatcher("/api/bookings/**")).permitAll()

                        // ── Protected endpoints ──
                        .requestMatchers(new AntPathRequestMatcher("/api/admin/**")).hasRole("ADMIN")

                        // ── Everything else requires authentication ──
                        .anyRequest().authenticated()
                )
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                );

        log.info("Adding JWT Authentication Filter");
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