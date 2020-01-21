package it.unicam.justmeetbackend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.databasefake.Provincia;
import it.unicam.justmeetbackend.repository.ProvinciaRepository;

import javax.validation.Valid;
import java.util.List;


@RestController
public class ProvinciaController {

    @Autowired
    private ProvinciaRepository repository;
  
    @RequestMapping(value = "/provincie", method = RequestMethod.GET)
    public List<Provincia> getAllProvincias() {
    return repository.findAll();
  }

  @RequestMapping(value = "/provincia/{provincia}", method = RequestMethod.GET)
  public Provincia getProvinciaByName(@PathVariable String provincia) {
  return repository.findByProvincia(provincia);
}

@RequestMapping(value = "/provincia/sigla/{sigla}", method = RequestMethod.GET)
public Provincia getProvinciaBySigla(@PathVariable String sigla) {
return repository.findBySigla(sigla);
}

/**
 * POST METHOD
 * @param provinicie
 * @return Liste di provincie aggiunte
 */

@RequestMapping(value = "/provincie", method = RequestMethod.POST)
public String createProvincia(@Valid @RequestBody List<Provincia> provinicie) {
  repository.saveAll(provinicie);
  return "Provinicie aggiunte: " +provinicie.size();
}

/**
 * POST METHOD
 * @param provinicia
 * @return provincia aggiunta
 */

@RequestMapping(value = "/provinciaAdd", method = RequestMethod.POST)
public Provincia createProvincia(@Valid @RequestBody Provincia provinicia) {
  repository.save(provinicia);
  return provinicia;
}

    
  
}