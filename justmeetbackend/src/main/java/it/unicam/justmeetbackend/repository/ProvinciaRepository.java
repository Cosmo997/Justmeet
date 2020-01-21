package it.unicam.justmeetbackend.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import it.unicam.justmeetbackend.databasefake.Provincia;

public interface ProvinciaRepository extends MongoRepository<Provincia, String> {
    
    //Provincia findByid_regione(int id_regione);
    List<Provincia> findAll();
    Provincia findByProvincia(String provincia);
    Provincia findBySigla(String sigla);

}