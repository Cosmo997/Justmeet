package it.unicam.justmeetbackend.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.justmeetbackend.classi.Provincia;

public interface ProvinciaRepository extends MongoRepository<Provincia, String> {
    
    List<Provincia> findAll();
    List<Provincia> findByNome(String nome);
    List<Provincia> findBySigla(String sigla);
    List<Provincia> findByRegione(String regione);
    

}