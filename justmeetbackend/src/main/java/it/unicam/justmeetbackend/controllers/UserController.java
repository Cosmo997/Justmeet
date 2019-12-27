package it.unicam.justmeetbackend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.databasefake.User;
import it.unicam.justmeetbackend.services.UserService;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RestController
public class UserController {

    @Autowired
    private UserService userService;
    
    @RequestMapping(value="/user/{id}", method=RequestMethod.GET)
    public User getUser(@PathVariable String id) {
        return userService.getUserById(id);
    }
    
    
}