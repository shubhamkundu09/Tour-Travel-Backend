package com.anandaholidays.config;

import com.anandaholidays.security.JwtUtil;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.security.SignatureException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Component
@RequiredArgsConstructor
@Slf4j
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtUtil jwtUtil;
    private final UserDetailsService userDetailsService;

    private final List<String> publicPaths = Arrays.asList(
            // Public JSP pages
            "/", "/index", "/home", "/admin", "/error", "/test",
            "/tours", "/tour-detail", "/destination", "/destinations", "/contact",

            // Public API endpoints
            "/api/auth/",
            "/api/tours/",
            "/api/images/",
            "/api/bookings/",

            // Static resource directories
            "/css/", "/js/", "/images/", "/static/", "/uploads/",
            "/WEB-INF/jsp/",

            // Image extensions
            ".css", ".js", ".png", ".jpg", ".jpeg", ".gif", ".svg", ".ico", ".webp", ".avif",

            // Font extensions - required for Tabler Icons
            ".woff", ".woff2", ".ttf", ".eot", ".otf",

            // Other
            ".map"
    );

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        String path = request.getRequestURI();

        // Strip query string from path before matching extensions
        // e.g. /static/assets/font.woff2?v3.34.0 -> check .woff2
        String pathForExtCheck = path.contains("?") ? path.substring(0, path.indexOf("?")) : path;

        // Never skip filtering for admin endpoints
        if (path.startsWith("/api/admin/")) {
            log.debug("Admin endpoint detected, must apply filter: {}", path);
            return false;
        }

        // Check prefix match (directories and page paths)
        boolean prefixMatch = publicPaths.stream()
                .filter(p -> !p.startsWith("."))
                .anyMatch(path::startsWith);

        // Check extension match (file types)
        boolean extensionMatch = publicPaths.stream()
                .filter(p -> p.startsWith("."))
                .anyMatch(pathForExtCheck::endsWith);

        boolean shouldNotFilter = prefixMatch || extensionMatch;
        log.debug("Path: {}, shouldNotFilter: {}", path, shouldNotFilter);
        return shouldNotFilter;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {

        final String requestTokenHeader = request.getHeader("Authorization");

        log.debug("Request URI: {}, Method: {}", request.getRequestURI(), request.getMethod());
        log.debug("Authorization Header: {}", requestTokenHeader != null ? "Present" : "Not present");

        String username = null;
        String jwtToken = null;

        if (requestTokenHeader != null && requestTokenHeader.startsWith("Bearer ")) {
            jwtToken = requestTokenHeader.substring(7);
            log.debug("JWT Token extracted: {}...", jwtToken.substring(0, Math.min(20, jwtToken.length())));

            try {
                username = jwtUtil.extractUsername(jwtToken);
                log.debug("Extracted username from token: {}", username);
            } catch (IllegalArgumentException e) {
                log.error("Unable to get JWT Token: {}", e.getMessage());
            } catch (ExpiredJwtException e) {
                log.error("JWT Token has expired for user: {}", e.getClaims().getSubject());
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.setContentType("application/json");
                response.getWriter().write("{\"error\": \"Token expired. Please login again.\"}");
                return;
            } catch (MalformedJwtException e) {
                log.error("Invalid JWT Token: {}", e.getMessage());
            } catch (io.jsonwebtoken.security.SignatureException e) {
                log.error("JWT signature does not match: {}", e.getMessage());
            } catch (Exception e) {
                log.error("Error processing JWT Token: {}", e.getMessage());
            }
        } else {
            log.debug("JWT Token does not begin with Bearer String or is null");
        }

        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
            log.debug("Attempting to authenticate user: {}", username);

            try {
                UserDetails userDetails = this.userDetailsService.loadUserByUsername(username);
                log.debug("User details loaded: {}, authorities: {}", userDetails.getUsername(), userDetails.getAuthorities());

                if (jwtUtil.validateToken(jwtToken, userDetails)) {
                    log.debug("Token validated successfully for user: {}", username);

                    UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken =
                            new UsernamePasswordAuthenticationToken(
                                    userDetails, null, userDetails.getAuthorities());
                    usernamePasswordAuthenticationToken
                            .setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

                    SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
                    log.debug("Authentication set in security context for user: {}", username);
                } else {
                    log.warn("Token validation failed for user: {}", username);
                }
            } catch (Exception e) {
                log.error("Error loading user details: {}", e.getMessage());
            }
        } else {
            if (username == null) {
                log.debug("Username is null, skipping authentication");
            } else {
                log.debug("Authentication already exists in context for user: {}", username);
            }
        }

        chain.doFilter(request, response);
    }
}