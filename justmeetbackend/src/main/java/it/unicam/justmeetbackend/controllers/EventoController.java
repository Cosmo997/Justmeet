package it.unicam.justmeetbackend.controllers;

import java.util.ArrayList;
import java.util.HashSet;
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

    /**Restituisce l'evento dato un id.
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
        return repository.findByTitoloLikeIgnoreCase(titolo);
    }

    /**Restituisce gli eventi creati dall'utente.
     * 
     * @param idCreatore
     * @return Eventi con idCreatore passato come parametro
     */
    @RequestMapping(value = "/eventi/idcreatore/{idCreatore}", method = RequestMethod.GET)
    public List<Evento> getEventiByIdCreatore(@PathVariable String idCreatore) {
        return repository.findByIdCreatore(idCreatore);
    }

    /**Restituisce gli eventi al quale l'utente è iscritto
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
    @GetMapping(value = "/eventi/isapproved/{isApproved}")
    public List<Evento> getEventiByIsApproved(@PathVariable boolean isApproved) {
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
     * Get eventi by selected Topic
     * @param topic
     * @return gli eventi dato un deterimnato topic
     */
    @RequestMapping(value = "/eventi/topic/{idTopic}")
    public List<Evento> getEventiByTopic(@PathVariable String idTopic) {
        return repository.findByIdTopic(idTopic);
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
     * @param e Evento completo nel Body
     * @param id Id dell'evento da modificare
     */
    @RequestMapping(value = "/evento/{id}", method = RequestMethod.PUT)
    public void updateEventById(@RequestBody Evento e, @PathVariable String id) {
        repository.update(id, e);
    }

    /**
     * Aggiunge l'id dell'user alla lista Iscritti dell'evento.
     * @param idEvento al quale l'user vuole iscriversi
     * @param idUser che si vuole iscrivere
     */
    @RequestMapping(value = "/evento/iscrizione/update", method = RequestMethod.PUT)
    public void addIscrizione(@RequestParam String idEvento, @RequestParam String idUser){
        repository.updateIscrizioni(idEvento, idUser);
    }

    /**
     * Rimuove l'iscrizione ad un determinato evento
     * @param idEvento dal quali rimuovere l'user
     * @param idUser da cancellare tra gli iscritti
     */
    @RequestMapping(value = "/evento/iscrizione/delete", method = RequestMethod.PUT)
    public void deleteIscrizione(@RequestParam String idEvento, @RequestParam String idUser){
        repository.deleteIscrizione(idEvento, idUser);
    }

    /**
     * Modifica l'evento settando isApproved a True
     * @param idEvento da Approvare
     */
    @RequestMapping(value = "/evento/approva", method = RequestMethod.PUT)
    public void updateApproved(@RequestParam String idEvento){
        repository.updateApproved(idEvento);
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

    /**
     * Restituisce gli eventi che rispettano la ricerca
     * @param titolo
     * @param topic
     * @param idComune
     * @return
     */
    @RequestMapping(value = "eventi/search", method = RequestMethod.GET)
    public List<Evento> getSearchEvents(@RequestParam String titolo, @RequestParam String idTopic, @RequestParam String idComune)
    {
        HashSet<Evento> eventiFiltrati = new HashSet<>();

        if(titolo != null)
        eventiFiltrati.addAll(repository.findByTitoloLikeIgnoreCase(titolo));
        if(idTopic != null)
        eventiFiltrati.addAll(repository.findByIdTopic(idTopic));
        if(idComune != null)
        eventiFiltrati.addAll(repository.findByIdComune(idComune));        

        List<Evento> e = new ArrayList<>();
        e.addAll(eventiFiltrati);

        return e;
    }

}