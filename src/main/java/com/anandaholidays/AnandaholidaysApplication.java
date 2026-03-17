package com.anandaholidays;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class AnandaholidaysApplication {
    public static void main(String[] args) {
        SpringApplication.run(AnandaholidaysApplication.class, args);
    }
}