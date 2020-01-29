package it.unicam.justmeetbackend.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.justmeetbackend.classi.Evento;

/**
 * EventoRepository
 */
public interface EventoRepository extends MongoRepository<Evento, String>{
    
    List<Evento> findByTitolo(String titolo);
    List<Evento> findByDescrizione(String descrizione);
    List<Evento> findByIdComune(String idComune);
    default void update(String id, Evento e) {
            e.setId(id);
            save(e);
    };
    List<Evento> findByIsApproved(Boolean isApproved);
    List<Evento> findByPartecipanti(int partecipanti);
    List<Evento> findByPartecipantiGreaterThan(int partecipanti);
    List<Evento> findByPartecipantiLessThan(int partecipanti);
    List<Evento> findByTitoloLike(String titolo);    
    
}