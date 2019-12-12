package it.unicam.justmeetbackend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    /**
     * Restituisce l'evento dato il titolo (GET)
     * @param titolo
     * @return
     */
    @RequestMapping(value="/eventi/{titolo}", method=RequestMethod.GET)
    public List<Evento> getEventsByTitolo(@PathVariable String titolo) {
        return eventService.getEventsByName(titolo);
    }
    
    /**
     * Restituisce gli eventi di una determinata regione
     * @param regione
     * @return
     */
    @RequestMapping(value="/eventi/regione/{regione}", method=RequestMethod.GET)
    public List<Evento> getEventsByRegion(@PathVariable String regione) {
        return eventService.getEventsByRegion(regione);
    }

    /**
     * Restituisce gli eventi di una determinata provincia
     * @param provincia
     * @return
     */
    @RequestMapping(value="/eventi/provincia/{provincia}", method=RequestMethod.GET)
    public List<Evento> getEventsByProvincia(@PathVariable String provincia) {
        return eventService.getEventsByProvincia(provincia);
    }
    

    /**
     * Creare Evento (POST)
     * @param e
     */
    @RequestMapping(method = RequestMethod.POST, value="/eventi")
    public void postMethod(@RequestBody Evento e) {
        eventService.addEvent(e);
    }

    /**
     * Aggiornare evento byId
     * @param e
     * @param id
     */
    @RequestMapping(value="/eventi/{id}", method=RequestMethod.PUT)
    public void updateMethod(@RequestBody Evento e, @PathVariable String id) {
        eventService.updateEvento(id, e);
    }

    /**
     * Cancellare evento byId
     * @param id
     * @return
     */
    @RequestMapping(value="/eventi/{id}", method=RequestMethod.DELETE)
    public String deleteMethod(@PathVariable String id) {
            return eventService.deleteEvento(id);
    }
    
    

}