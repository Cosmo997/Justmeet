package it.unicam.justmeetbackend.controllers;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class ControllerRest {

    @GetMapping("/")
    public String getMethodName()
    {
        return "hello";
    }
}
