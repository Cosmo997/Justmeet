package it.unicam.justmeetbackend.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.justmeetbackend.classi.Regione;

public interface RegioneRepository extends MongoRepository<Regione, String>{

    List<Regione> findAll();
    Optional<Regione> findByNome(String nome);
}