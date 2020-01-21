package it.unicam.justmeetbackend.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.justmeetbackend.databasefake.Regione;

public interface RegioniRepository extends MongoRepository<Regione, String>{

    List<Regione> findAll();
    Optional<Regione> findById(int id);
    Optional<Regione> findByNome(String nome);
}