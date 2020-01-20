package it.unicam.justmeetbackend.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import it.unicam.justmeetbackend.databasefake.Provincia;

public interface ProvinciaRepository extends MongoRepository<Provincia, String> {
    List<Provincia> findAll();
    Provincia findByProvincia(String provincia);
    Provincia findBySigla(String sigla);

}