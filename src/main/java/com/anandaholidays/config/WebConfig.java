package com.anandaholidays.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${file.storage.upload-dir}")
    private String uploadDir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Serve static resources
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/static/", "classpath:/public/")
                .setCachePeriod(0);

        // Serve uploaded images - note the file: prefix for external directory
        registry.addResourceHandler("/uploads/tours/**")
                .addResourceLocations("file:" + uploadDir + "/");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        // Map root path to index.html
        registry.addViewController("/").setViewName("forward:/index.html");
    }
}