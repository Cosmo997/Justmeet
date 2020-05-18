package it.unicam.justmeetbackend.controllers;

import java.util.ArrayList;
import java.util.Optional;

import javax.validation.Valid;

import com.google.firebase.auth.FirebaseAuthException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.classi.User;
import it.unicam.justmeetbackend.secure.SecureToken;
import it.unicam.justmeetbackend.repository.UserRepository;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class TestUserController{

    @Autowired
    private UserRepository repository;

    /**
     * GET le mie info
     * @param id dell'utente corrente
     * @param token dell'utente corrente
     * @return info dell'utente corrente
     * @throws FirebaseAuthException
     */
    @GetMapping("/utente/id")
	public Optional<User> getUserByIdWithToken(@RequestParam String idUser, @RequestHeader("Authorization") String token) throws FirebaseAuthException {
        if(idUser != null && token != null){
            String idUserFromToken = SecureToken.getInstance().getUid(token);
            if(idUser.equals(idUserFromToken)){
		    Optional<User> user = repository.findById(idUser);
		    if (user == null) {
		    	return null;
		    }
		        return user;
            }
            return null;
        }
        return null;
    }

    /**
     * GET i miei preferiti
     * @param idUser
     * @param token
     * @return
     * @throws FirebaseAuthException
     */
    @GetMapping("/utente/preferiti")
    public ArrayList<String> getPreferitiById(@RequestParam String idUser, @RequestHeader("Authorization") String token) throws FirebaseAuthException{
        if(idUser != null && token != null){
            String idUserFromToken = SecureToken.getInstance().getUid(token);
            if(idUser.equals(idUserFromToken)){
		    Optional<User> user = repository.findById(idUser);
		    if (user.isPresent()){
		    	return user.get().getPreferiti();
            }
                return null;
            }
            return null;
        }
        return null;
    }

    /**
     * PUT aggiungo un preferito
     * @param idUser
     * @param idEvento
     * @param token
     * @return true se andato a buon fine, null se manca qualche parametro o token errato
     * @throws FirebaseAuthException
     */
    @PutMapping("/utente/addpreferiti")
    public boolean addPreferiti(@RequestParam String idUser, @RequestParam String idEvento, @RequestHeader("Authorization") String token) throws FirebaseAuthException {
        if(idUser != null && idEvento != null && token != null){
            String idUserFromToken = SecureToken.getInstance().getUid(token);
            if(idUser.equals(idUserFromToken)){
                repository.updatePreferiti(idUser, idEvento);
                return true;
            }
            return false;
        }
        return false;
    }

    /**
     * PUT rimuovo un preferito
     * @param idUser
     * @param idEvento
     * @param token
     * @return true se andato a buon fine, null se manca qualche parametro o token errato
     * @throws FirebaseAuthException
     */
    @PutMapping("/utente/deleteprefereriti")
    public boolean deleteFromPreferiti(@RequestParam String idUser, @RequestParam String idEvento, @RequestHeader("Authorization") String token) throws FirebaseAuthException {
        if(idUser != null && idEvento != null && token != null){
            String idUserFromToken = SecureToken.getInstance().getUid(token);
            if(idUser.equals(idUserFromToken)){
                repository.deletePreferito(idUser, idEvento);
                return true;
            }
            return false;
        }
        return false;
    }

    /**
     * DELETE cancello utente
     * @param idUser
     * @param token
     * @return 
     * @throws FirebaseAuthException
     */
    @DeleteMapping("/utente")
    public boolean deleteUserById(@RequestParam String idUser, @RequestHeader("Authorization") String token) throws FirebaseAuthException{
        if(idUser != null && token != null){
            String idUserFromToken = SecureToken.getInstance().getUid(token);
            if(idUser.equals(idUserFromToken)){
                repository.deleteById(idUser);
                return true;
            }
            return false;
        }
        return false;
    }

    /**
     * POST creo nuovo utente
     * @param user
     * @param token
     * @return
     * @throws FirebaseAuthException
     */
    @PostMapping("/utente")
    public boolean creatUser(@Valid @RequestBody User user, @RequestHeader("Authorization") String token) throws FirebaseAuthException{
        if(user != null && token != null){
            String idUserFromToken = SecureToken.getInstance().getUid(token);
            if(user.get_id().equals(idUserFromToken)){
                user.setIsMod(false);
                ArrayList<String> app = new ArrayList<>();
                user.setPreferiti(app);
                repository.save(user);
                return true;
            }
            return false;
        }
        return false;
    }

}
