package com.example.springbootkeyvault;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Value("${secret_sauce:undefined}")
    String secret;

    @GetMapping("/")
    String hello() {
        return "hello, the secret is: " + secret;
    }
}
