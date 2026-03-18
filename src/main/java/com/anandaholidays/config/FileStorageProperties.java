// FileStorageProperties.java (keep as is)
package com.anandaholidays.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "file.storage")
public class FileStorageProperties {
    private String uploadDir = "uploads/tours";

    public String getUploadDir() { return uploadDir; }
    public void setUploadDir(String uploadDir) { this.uploadDir = uploadDir; }
}