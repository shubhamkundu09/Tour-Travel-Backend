package com.anandaholidays;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class AnandaholidaysApplication extends SpringBootServletInitializer {  // ADDED: extends SpringBootServletInitializer

    // ADDED: Required for WAR deployment and JSP to work with embedded Tomcat
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(AnandaholidaysApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(AnandaholidaysApplication.class, args);
    }
}