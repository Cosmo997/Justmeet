package it.unicam.justmeetbackend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.databasefake.Regione;
import it.unicam.justmeetbackend.repository.RegioniRepository;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;


@RestController
public class RegioniController {
  
    @Autowired
    private RegioniRepository repository;
  
    @RequestMapping(value = "/regioni", method = RequestMethod.GET)
    public List<Regione> getAllRegioni() {
    return repository.findAll();
  }

  @RequestMapping(value = "/regione/nome/{nome}", method = RequestMethod.GET)
  public Optional<Regione> getRegioniByNome(@PathVariable String nome) {
  return repository.findByNome(nome);
}

@RequestMapping(value = "/regione/id/{id}", method = RequestMethod.GET)
public Optional<Regione> getRegioneById(@PathVariable int id) {
return repository.findById(id);
}

@RequestMapping(value = "/regioniadd", method = RequestMethod.POST)
public List<Regione> createRegione(@Valid @RequestBody List<Regione> regioni) {
  repository.saveAll(regioni);
  return regioni;
}

@RequestMapping(value = "/regioneadd", method = RequestMethod.POST)
public Regione createRegione(@Valid @RequestBody Regione regione) {
  repository.save(regione);
  return regione;
}
  
}