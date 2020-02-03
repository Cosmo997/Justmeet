package it.unicam.justmeetbackend.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import it.unicam.justmeetbackend.classi.Evento;
import it.unicam.justmeetbackend.repository.EventoRepository;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
    @RequestMapping(value = "/eventi/{titolo}", method = RequestMethod.GET)
    public List<Evento> getEventsByTitolo(@PathVariable String titolo) {
        return repository.findByTitolo(titolo);
    }

    /**
     * 
     * @param id dell'evento
     * @return
     */
    @RequestMapping(value = "/evento/id/{id}", method = RequestMethod.GET)
    public Optional<Evento> getEventsById(@PathVariable String id) {
        return repository.findById(id);
    }

    /**
     * Get eventi che contengono $titolo nel Titolo
     * 
     * @param titolo
     * @return
     */
    @RequestMapping(value = "/eventi/like/{titolo}", method = RequestMethod.GET)
    public List<Evento> getEventsByTitoloLike(@PathVariable String titolo) {
        return repository.findByTitoloLike(titolo);
    }

    /**
     * 
     * @param idCreatore
     * @return Eventi con idCreatore passato come parametro
     */
    @RequestMapping(value = "/eventi/idcreatore/{idCreatore}", method = RequestMethod.GET)
    public List<Evento> getEventiByIdCreatore(@PathVariable String idCreatore) {
        return repository.findByIdCreatore(idCreatore);
    }

    /**
     * 
     * @param _id Dell'utente
     * @return
     */
    @RequestMapping(value = "/eventi/usersub/{_id}", method = RequestMethod.GET)
    public List<Evento> getEventiWhereUserSubscribe(@PathVariable String _id) {
        List<Evento> eventi = repository.findAll();
        List<Evento> e = new ArrayList<Evento>();
        for (Evento evento : eventi) {
            if (evento.getIscrizioni().contains(_id)) {
                e.add(evento);
            }
        }
        return e;
    }

    /**
     * Get eventi by Nome del Comune
     * 
     * @param nome
     * @return
     */
    @GetMapping(value = "/eventi/comune/{idComune}")
    public List<Evento> getEventByComune(@PathVariable String idComune) {
        return repository.findByIdComune(idComune);
    }

    /**
     * Get eventi where isApproved = true/false
     * 
     * @param isApproved
     * @return
     */
    @RequestMapping(value = "/eventi/approvati/{isApproved}")
    public List<Evento> getEventiApprovati(@PathVariable Boolean isApproved) {
        return repository.findByIsApproved(isApproved);
    }

    /**
     * Get eventi by Numero Partecipanti
     * 
     * @param partecipanti
     * @return
     */
    @RequestMapping(value = "/eventi/partecipanti/{partecipanti}")
    public List<Evento> getEventiByPartecipanti(@PathVariable int partecipanti) {
        return repository.findByPartecipanti(partecipanti);
    }

    /**
     * Get eventi where partecipanti > $partecipanti
     * 
     * @param partecipanti
     * @return
     */
    @RequestMapping(value = "/eventi/sopra/{partecipanti}")
    public List<Evento> getEventiByPartecipantiGreater(@PathVariable int partecipanti) {
        return repository.findByPartecipantiGreaterThan(partecipanti);
    }

    /**
     * get eventi where partecipanti < $partecipanti
     * 
     * @param partecipanti
     * @return
     */
    @RequestMapping(value = "/eventi/sotto/{partecipanti}")
    public List<Evento> getEventiByPartecipantiLess(@PathVariable int partecipanti) {
        return repository.findByPartecipantiLessThan(partecipanti);
    }

    /**
     * Creare Evento (POST)
     * 
     * @param e
     */
    @RequestMapping(method = RequestMethod.POST, value = "/evento")
    public boolean postEvent(@RequestBody Evento e) {
        ArrayList<String> app = new ArrayList<>();
        if (e == null)
            return false;
        else
            e.setApproved(false);
            e.setIscrizioni(app);
        repository.save(e);
        return true;
    }

    /**
     * Aggiornare evento byId
     * 
     * @param e
     * @param id
     */
    @RequestMapping(value = "/evento/{id}", method = RequestMethod.PUT)
    public void updateEventById(@RequestBody Evento e, @PathVariable String id) {
        repository.update(id, e);
    }

    @RequestMapping(value = "evento/update", method = RequestMethod.PUT)
    public void updateIscrizioni(@RequestParam String idEvento, @RequestParam String idUser){
        repository.updateIscrizioni(idEvento, idUser);
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