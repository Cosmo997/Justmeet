package it.unicam.justmeetbackend.controllers;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.databasefake.Pets;
import it.unicam.justmeetbackend.repository.PetsRepository;

import javax.validation.Valid;
import java.util.List;

@RestController
public class PetsController {
  
    @Autowired
    private PetsRepository repository;
  
  @RequestMapping(value = "/pets", method = RequestMethod.GET)
  public List<Pets> getAllPets() {
    return repository.findAll();
  }

  @RequestMapping(value = "/pets/{id}", method = RequestMethod.GET)
  public Pets getPetById(@PathVariable("id") ObjectId id) {
    return repository.findBy_id(id);
  }
  
  @RequestMapping(value = "/pets/{id}", method = RequestMethod.PUT)
  public void modifyPetById(@PathVariable("id") ObjectId id, @Valid @RequestBody Pets pets) {
    pets.set_id(id);
    repository.save(pets);
  }
  
  @RequestMapping(value = "/pets", method = RequestMethod.POST)
  public Pets createPet(@Valid @RequestBody Pets pets) {
    pets.set_id(ObjectId.get());
    repository.save(pets);
    return pets;
  }
  
  @RequestMapping(value = "/pets/{id}", method = RequestMethod.DELETE)
  public void deletePet(@PathVariable ObjectId id) {
    repository.delete(repository.findBy_id(id));
  }
}