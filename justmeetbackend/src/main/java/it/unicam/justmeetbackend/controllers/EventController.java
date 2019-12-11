package it.unicam.justmeetbackend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import it.unicam.justmeetbackend.databasefake.Evento;
import it.unicam.justmeetbackend.services.EventService;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
public class EventController {

    @Autowired
    private EventService eventService;

    @GetMapping("/eventi")
    public List<Evento> getAllEvent() {
        return eventService.getAllEvents();
    }

    @RequestMapping(method = RequestMethod.POST, value="/eventi")
    public void postMethodName(@RequestBody Evento e) {
        eventService.addEvent(e);
    }

}