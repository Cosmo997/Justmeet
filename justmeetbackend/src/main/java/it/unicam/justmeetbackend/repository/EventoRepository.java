package it.unicam.justmeetbackend.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.justmeetbackend.classi.Evento;

/**
 * EventoRepository
 */
public interface EventoRepository extends MongoRepository<Evento, String>{
    
    List<Evento> findByTitolo(String titolo);
    List<Evento> findByIdComune(String nome);
    default void update(String id, Evento e) {
            e.setId(id);
            save(e);
    }
    
    
}