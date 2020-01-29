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

    /**
     * Get eventi by titolo
     */
    @RequestMapping(value="/eventi/{titolo}", method=RequestMethod.GET)
    public List<Evento> getEventsByTitolo(@PathVariable String titolo) {
        return repository.findByTitolo(titolo);
    }

    /**
     * Get eventi che contengono $titolo nel Titolo
     * @param titolo
     * @return
     */
    @RequestMapping(value="/eventi/like/{titolo}", method=RequestMethod.GET)
    public List<Evento> getEventsByTitoloLike(@PathVariable String titolo) {
        return repository.findByTitoloLike(titolo);
    }

    /**
     * Get eventi by Nome del Comune
     * @param nome
     * @return
     */
    @GetMapping(value="/eventi/comune/{idComune}")
    public List<Evento> getEventByComune(@PathVariable String idComune) {
        return repository.findByIdComune(idComune);
    } 
    
    /**
     * Get eventi where isApproved = true/false
     * @param isApproved
     * @return
     */
    @RequestMapping(value = "/eventi/approvati/{isApproved}")
    public List<Evento> getEventiApprovati(@PathVariable Boolean isApproved) {
        return repository.findByIsApproved(isApproved);
    }
    
    /**
     * Get eventi by Numero Partecipanti
     * @param partecipanti
     * @return
     */
    @RequestMapping(value = "/eventi/partecipanti/{partecipanti}")
    public List<Evento> getEventiByPartecipanti(@PathVariable int partecipanti) {
        return repository.findByPartecipanti(partecipanti);
    }
    
    /**
     * Get eventi where partecipanti > $partecipanti
     * @param partecipanti
     * @return
     */
    @RequestMapping(value = "/eventi/sopra/{partecipanti}")
    public List<Evento> getEventiByPartecipantiGreater(@PathVariable int partecipanti) {
        return repository.findByPartecipantiGreaterThan(partecipanti);
    }

    /**
     * get eventi where partecipanti < $partecipanti
     * @param partecipanti
     * @return
     */
    @RequestMapping(value = "/eventi/sotto/{partecipanti}")
    public List<Evento> getEventiByPartecipantiLess(@PathVariable int partecipanti) {
        return repository.findByPartecipantiLessThan(partecipanti);
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

}