// ImageController.java
package com.anandaholidays.controller;

import com.anandaholidays.service.FileStorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;

@RestController
@RequestMapping("/api/images")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class ImageController {

    private final FileStorageService fileStorageService;

    @GetMapping("/{fileName}")
    public ResponseEntity<byte[]> getImage(@PathVariable String fileName) {
        try {
            byte[] imageData = fileStorageService.loadFile(fileName);
            MediaType mediaType = getMediaType(fileName);
            return ResponseEntity.ok().contentType(mediaType).body(imageData);
        } catch (IOException e) {
            return ResponseEntity.notFound().build();
        }
    }

    private MediaType getMediaType(String fileName) {
        String extension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        return switch (extension) {
            case "png" -> MediaType.IMAGE_PNG;
            case "jpg", "jpeg" -> MediaType.IMAGE_JPEG;
            case "gif" -> MediaType.IMAGE_GIF;
            default -> MediaType.APPLICATION_OCTET_STREAM;
        };
    }
}