package it.unicam.justmeetbackend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import it.unicam.justmeetbackend.classi.Evento;
import it.unicam.justmeetbackend.repository.EventoRepository;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
public class EventoController {

    @Autowired
    private EventoRepository repository;

    @GetMapping("/eventi")
    public List<Evento> getAllEvents() {
        return repository.findAll();
    }

    @RequestMapping(value="/evento/{titolo}", method=RequestMethod.GET)
    public List<Evento> getEventsByTitolo(@PathVariable String titolo) {
        return repository.findByTitolo(titolo);
    }
    
    /**
     * Creare Evento (POST)
     * @param e
     */
    @RequestMapping(method = RequestMethod.POST, value="/evento")
    public boolean postEvent(@RequestBody Evento e) {
        if(e == null)
        return false;
        else
        e.setApproved(false);
        repository.save(e);
        return true;
    }

    /**
     * Aggiornare evento byId
     * @param e
     * @param id
     */
    @RequestMapping(value="/evento/{id}", method=RequestMethod.PUT)
    public void updateEvent(@RequestBody Evento e, @PathVariable String id) {
        repository.update(id, e);
    }

    /**
     * Cancellare evento byId
     * @param id
     * @return
     */
    @RequestMapping(value="/evento/{id}", method=RequestMethod.DELETE)
    public void deleteEvent(@PathVariable String id) {
            repository.deleteById(id);
    }

    @GetMapping(value="/evento/comune/{comune}")
    public List<Evento> getEventByComune(@PathVariable String comune) {
        return repository.findByIdComune(comune);
    }
    // @GetMapping(value = "/eventi/preferiti/{idUtente}")
    // public List<Evento> getEventiByUser(@PathVariable String idUser) {
    //     return eventService.
    // }


}