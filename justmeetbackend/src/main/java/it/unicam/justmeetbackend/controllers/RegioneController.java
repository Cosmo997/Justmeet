package it.unicam.justmeetbackend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.classi.Regione;
import it.unicam.justmeetbackend.repository.RegioneRepository;

import java.util.List;
import java.util.Optional;


@RestController
public class RegioneController {
  
    @Autowired
    private RegioneRepository repository;
  
    @RequestMapping(value = "/regioni", method = RequestMethod.GET)
    public List<Regione> getAllRegioni() {
    return repository.findAll();
  }

  @RequestMapping(value = "/regione/nome/{nome}", method = RequestMethod.GET)
  public Optional<Regione> getRegioniByNome(@PathVariable String nome) {
  return repository.findByNome(nome);
}

}