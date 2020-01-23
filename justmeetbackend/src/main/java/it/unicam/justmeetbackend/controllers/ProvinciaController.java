package it.unicam.justmeetbackend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.classi.Provincia;
import it.unicam.justmeetbackend.repository.ProvinciaRepository;

import java.util.List;



@RestController
public class ProvinciaController {

@Autowired
private ProvinciaRepository repository;
  
@RequestMapping(value = "/province", method = RequestMethod.GET)
public List<Provincia> getAllProvince() {
  return repository.findAll();
}

@RequestMapping(value = "/provincia/nome/{nome}", method = RequestMethod.GET)
public List<Provincia> getProvinciaByName(@PathVariable String nome) {
  return repository.findByNome(nome);
}

@RequestMapping(value = "/provincia/sigla/{sigla}", method = RequestMethod.GET)
public List<Provincia> getProvinciaBySigla(@PathVariable String sigla) {
return repository.findBySigla(sigla);
}

@RequestMapping(value = "/provincia/regione/{regione}", method = RequestMethod.GET)
public List<Provincia> getProvinciaByRegione(@PathVariable String regione){
  return repository.findByRegione(regione);
}



//  * POST METHOD
//  * @param provinice
//  * @return Liste di provincie aggiunte
//  */

// @RequestMapping(value = "/provincia", method = RequestMethod.POST)
// public String createProvincia(@Valid @RequestBody List<Provincia> provinice) {
//   repository.saveAll(provinice);
//   return "Provinicie aggiunte: " +provinice.size();
// }

}