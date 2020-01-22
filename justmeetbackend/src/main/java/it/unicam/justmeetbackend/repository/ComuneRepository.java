package it.unicam.justmeetbackend.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.justmeetbackend.classi.Comune;

public interface ComuneRepository extends MongoRepository<Comune, String>{

List<Comune> findAll();
List<Comune> findByNome(String nome);
List<Comune> findBySiglaProvincia(String provincia);

}