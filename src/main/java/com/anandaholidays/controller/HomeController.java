package com.anandaholidays.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @GetMapping("/destination")
    public String destination() {
        return "destination";
    }

    @GetMapping("/tours")
    public String test() {
        return "tours";
    }

    @GetMapping("/admin")
    public String admin() {
        return "admin";
    }
}