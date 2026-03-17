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

    @GetMapping("/tours/{fileName}")
    public ResponseEntity<byte[]> getTourImage(@PathVariable String fileName) {
        try {
            byte[] imageData = fileStorageService.loadFile(fileName);

            // Determine content type based on file extension
            MediaType mediaType = getMediaType(fileName);

            return ResponseEntity.ok()
                    .contentType(mediaType)
                    .body(imageData);
        } catch (IOException e) {
            return ResponseEntity.notFound().build();
        }
    }

    private MediaType getMediaType(String fileName) {
        if (fileName.endsWith(".png")) {
            return MediaType.IMAGE_PNG;
        } else if (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg")) {
            return MediaType.IMAGE_JPEG;
        } else if (fileName.endsWith(".gif")) {
            return MediaType.IMAGE_GIF;
        } else {
            return MediaType.APPLICATION_OCTET_STREAM;
        }
    }
}