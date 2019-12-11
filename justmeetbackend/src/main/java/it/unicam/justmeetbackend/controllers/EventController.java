package it.unicam.justmeetbackend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import it.unicam.justmeetbackend.databasefake.Evento;
import it.unicam.justmeetbackend.services.EventService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class EventController {

    @Autowired
    private EventService eventService;

    @GetMapping("/eventi")
    public List<Evento> getAllEvent() {
        return eventService.getAllEvents();
    }

    @RequestMapping(method = RequestMethod.POST, value="/eventi")
    public void postMethod(@RequestBody Evento e) {
        eventService.addEvent(e);
    }

    @RequestMapping(value="/eventi/{id}", method=RequestMethod.PUT)
    public void updateMethod(@RequestBody Evento e, @PathVariable int id) {
        eventService.updateEvento(id, e);
    }

    @RequestMapping(value="/eventi/{id}", method=RequestMethod.DELETE)
    public void deleteMethod(@PathVariable int i) {
            eventService.deleteEvento(i);
    }

}