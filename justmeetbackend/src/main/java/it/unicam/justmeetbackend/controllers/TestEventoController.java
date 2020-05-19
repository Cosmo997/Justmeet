package it.unicam.justmeetbackend.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.google.firebase.auth.FirebaseAuthException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import it.unicam.justmeetbackend.classi.Evento;
import it.unicam.justmeetbackend.classi.User;
import it.unicam.justmeetbackend.repository.EventoRepository;
import it.unicam.justmeetbackend.repository.UserRepository;
import it.unicam.justmeetbackend.secure.SecureToken;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

@RestController
public class TestEventoController {

    @Autowired
    private EventoRepository repository;

    @Autowired
    private UserRepository userRepo;

    /**
     * Restituisce gli eventi creati da idCreatore
     * @param idCreatore
     * @param token
     * @return
     * @throws FirebaseAuthException
     */
    @RequestMapping(value = "/eventi/myevent", method = RequestMethod.GET)
    public List<Evento> getEventiByIdCreatoreWithToken(
        @RequestParam String idCreatore, @RequestHeader("Authorization") String token)
            throws FirebaseAuthException {
        if (idCreatore != null && token != null) {
            String idUserByToken = SecureToken.getInstance().getUid(token);
            if (idCreatore.equals(idUserByToken)) {
                return repository.findByIdCreatore(idCreatore);
            }
            return null;
        }
        return null;
    }

    /**
     * Restituisce gli eventi al quale l'utente è sottoscritto
     * @param idUser
     * @param token
     * @return
     * @throws FirebaseAuthException
     */
    @RequestMapping(value = "/eventi/mysub", method = RequestMethod.GET)
    public List<Evento> getEventiWhereUserSubscribeWithToken(
        @RequestParam String idUser, @RequestHeader("Authorization") String token) throws FirebaseAuthException {
        if (idUser != null && token != null) {
            String idUserByToken = SecureToken.getInstance().getUid(token);
            if (idUser.equals(idUserByToken)) {
                List<Evento> eventi = repository.findAll();
                List<Evento> e = new ArrayList<Evento>();
                for (Evento evento : eventi) {
                    if (evento.getIscrizioni().contains(idUser)) {
                        e.add(evento);
                    }
                }
                return e;
            }
            return null;
        }
        return null;
    }

    /**
     * Restituisce gli eventi approvati
     * @return
     */
    @GetMapping(value = "/eventi/isapproved")
    public List<Evento> getEventiByIsApproved() {
        return repository.findByIsApproved(true);
    }

    /**
     * Restituisce gli eventi da approvare solo se si è moderatori
     * @param token
     * @return
     * @throws FirebaseAuthException
     */
    @GetMapping(value = "/eventi/isnotapproved")
    public List<Evento> getEventiByIsApproved(@RequestHeader("Authorization") String token) throws FirebaseAuthException {
        String idUSerByToken = SecureToken.getInstance().getUid(token);
        Optional<User> user = userRepo.findById(idUSerByToken);
        if (user.get().getIsMod()) {
            return repository.findByIsApproved(false);
        }
        return null;
    }

    /**
     * Creao Evento con il mio token
     * @param e
     * @param token
     * @return
     * @throws FirebaseAuthException
     */
    @RequestMapping(method = RequestMethod.POST, value = "/eventowithtoken")
    public String postEvent(@RequestBody Evento e, @RequestHeader("Authorization") String token) throws FirebaseAuthException {
        String idUserByToken = SecureToken.getInstance().getUid(token);
        if (idUserByToken.equals(e.getIdCreatore()) && e != null) {
            ArrayList<String> app = new ArrayList<>();
            e.setApproved(false);
            e.setIscrizioni(app);
            repository.save(e);
            return e.getId();
        }
        return null;
    }


    /**
     * Aggiungo il mio id alle iscrizioni di un evento
     * @param idEvento
     * @param idUser
     * @param token
     * @return
     * @throws FirebaseAuthException
     */
    @RequestMapping(value = "/evento/iscrizione/add", method = RequestMethod.PUT)
    public boolean addIscrizione(@RequestParam String idEvento, @RequestParam String idUser,
            @RequestHeader("Authorization") String token) throws FirebaseAuthException {
        if (idEvento != null && idUser != null && token != null) {
            String idUserByToken = SecureToken.getInstance().getUid(token);
            if (idUserByToken.equals(idUser)) {
                repository.updateIscrizioni(idEvento, idUser);
                return true;
            }
            return false;
        }
        return false;
    }

    /**
     * Rimuovo il mio id dalle iscrizioni di un'evento
     * @param idEvento
     * @param idUser
     * @param token
     * @return
     * @throws FirebaseAuthException
     */
    @RequestMapping(value = "/evento/iscrizione/remove", method = RequestMethod.PUT)
    public boolean deleteIscrizione(@RequestParam String idEvento, @RequestParam String idUser,
            @RequestHeader("Authorization") String token) throws FirebaseAuthException {
        if(idEvento != null && idUser != null && token != null){
            String idUserByToken = SecureToken.getInstance().getUid(token);
            if(idUserByToken.equals(idUser)){
                repository.deleteIscrizione(idEvento, idUser);
                return true;
            }
            return false;
        }
        return false;
    }

    /**
     * Approva Evento by Moderatore
     * @param idEvento
     * @param token
     * @return
     * @throws FirebaseAuthException
     */
    @RequestMapping(value = "/evento/approvabymod", method = RequestMethod.PUT)
    public boolean updateApproved(@RequestParam String idEvento, @RequestHeader("Authorization") String token)
            throws FirebaseAuthException {
        if (idEvento != null && token != null) {
            String idUserByToken = SecureToken.getInstance().getUid(token);
            Optional<User> app = userRepo.findById(idUserByToken);
            if(app.get().get_id().equals(idUserByToken) && app.get().getIsMod() == true){
                repository.updateApproved(idEvento);
                return true;
            }
            return false;
        }
        return false;
    }

    /**
     * Cancellare Evento By Id, solo il creatore o il moderatore.
     * 
     * @param id
     * @param token
     * @return
     * @throws FirebaseAuthException
     */
    @RequestMapping(value = "/evento", method = RequestMethod.DELETE)
    public boolean deleteEvent(@RequestParam String idEvento, @RequestHeader("Authorization") String token) throws FirebaseAuthException {
        if(idEvento != null && token != null) {
            String idUserByToken = SecureToken.getInstance().getUid(token);
            Optional<User> user = userRepo.findById(idUserByToken);
            Optional<Evento> evento = repository.findById(idEvento);
            if(user.get().get_id().equals(evento.get().getIdCreatore()) || user.get().getIsMod() == true){
                repository.deleteById(idEvento);
                return true;
            }
            return false;
        }
        return false;
    }

}