package it.unicam.justmeetbackend.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.classi.User;
import it.unicam.justmeetbackend.repository.UserRepository;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class UserController {

    @Autowired
    private UserRepository repository;

/**
 * Get all Users
 * @return tutti gli utenti
 */
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public List<User> getUsers() {
        return repository.findAll();
    }

    /**
     * Get userBy id
     */
    @RequestMapping(value = "/user/id/{id}", method = RequestMethod.GET)
    public Optional<User> getUserById(@PathVariable String id) {
    return repository.findById(id);
  }

  /**
   * Get user byNome
   * @param nome dell'utente
   * @return l'utente con il determinato nome
   */
  @RequestMapping(value = "/user/nome/{nome}", method = RequestMethod.GET)
    public List<User> getUserByNome(@PathVariable String nome) {
    return repository.findByNome(nome);
  }

  /**
   * Get user byEmail
   * @param email dell'user
   * @return l'utente con determinata mail
   */
  @RequestMapping(value = "/user/email/{email}", method = RequestMethod.GET)
    public List<User> getUserByEmail(@PathVariable String email) {
    return repository.findByEmail(email);
  }

  /**
   * POST un nuovo user con isMod = false e Lista preferiti vuota.
   * @param user da creare
   * @return true se andato a buon fine, flase se uno o piu parametri passati sono null
   */
  @RequestMapping(value = "/user", method = RequestMethod.POST)
  public boolean createUser(@Valid @RequestBody User user) {
    if(user != null){
      user.setIsMod(false);
      ArrayList<String> app = new ArrayList<>();
      user.setPreferiti(app);
      repository.save(user);
      return true;
    }else
      return false;
  }

  /**
   * Delete user ByID
   * @param id dell'utente
   * @return true se andato a buon fine, flase se uno o piu parametri passati sono null
   */
  @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
  public boolean deleteUserById(@PathVariable String id) {
    if(id != null){
      repository.deleteById(id);
      return true;
    }else
      return false;
  }

  /**
   * Aggiunge un determinato evento alla lista preferiti dell'utente
   * @param idUser da modificare
   * @param idEvento da aggiungere ai preferiti
   * @return true se andato a buon fine, flase se uno o piu parametri passati sono null
   */
  @RequestMapping(value = "user/addpreferiti", method = RequestMethod.PUT)
  public boolean updatePreferiti(@RequestParam String idUser, @RequestParam String idEvento){
    if(idUser != null && idEvento != null){  
      repository.updatePreferiti(idUser, idEvento);
      return true;
    }else
      return false;
  }

  /**
   * Rimuove un'evento tra quelli preferiti dell'utente
   * @param idUser da modificare
   * @param idEvento da rimuovere tra i preferiti
   * @return true se andato a buon fine, flase se uno o piu parametri passati sono null
   */
  @RequestMapping(value = "user/deletepreferiti", method = RequestMethod.PUT)
  public boolean deleteFromPreferiti(@RequestParam String idUser, @RequestParam String idEvento){
    if(idUser != null && idEvento != null){  
      repository.deletePreferito(idUser, idEvento);
      return true;
    }else
      return false;
  }
  
  /**
   * Get eventi preferiti dell'utente
   * @param _id dell'user
   * @return i preferiti dell'utente
   */
  @RequestMapping(value = "/user/prefeiti/{_id}", method = RequestMethod.GET)
  public ArrayList<String> getPreferidiById(@PathVariable String _id) {
  Optional<User> user = repository.findById(_id);  
  if(user.isPresent()){
    return user.get().getPreferiti();
  }else
    return null;
  }

}
