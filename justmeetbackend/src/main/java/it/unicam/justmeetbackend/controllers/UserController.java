package it.unicam.justmeetbackend.controllers;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.databasefake.User;
import it.unicam.justmeetbackend.repository.UserRepository;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RestController
public class UserController {

    @Autowired
    private UserRepository repository;

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public List<User> getUser() {
        return repository.findAll();
    }

    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
    public Optional<User> getUserById(@PathVariable String id) {
    return repository.findById(id);
  }

  @RequestMapping(value = "/user/{nome}", method = RequestMethod.GET)
    public List<User> getUserByNome(@PathVariable String nome) {
    return repository.findByNome(nome);
  }

  @RequestMapping(value = "/user/{email}", method = RequestMethod.GET)
    public List<User> getUserByEmail(@PathVariable String email) {
    return repository.findByEmail(email);
  }

  
  @RequestMapping(value = "/useradd", method = RequestMethod.POST)
  public String createUser(@Valid @RequestBody List<User> user) {
    repository.saveAll(user);
    return "User"+user+"Aggiunto";
  }
  
  @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
  public void deleteUser(@PathVariable String id) {
    repository.deleteById(id);
  }
    
    
}