package it.unicam.justmeetbackend.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.justmeetbackend.classi.Evento;

/**
 * EventoRepository
 */
public interface EventoRepository extends MongoRepository<Evento, String> {

    Optional<Evento> findById(String id);
    List<Evento> findByTitolo(String titolo);
    List<Evento> findByDescrizione(String descrizione);
    List<Evento> findByIdComune(String idComune);
    default void update(String id, Evento e) {
            e.setId(id);
            save(e);
    };
    
    default void updateIscrizioni(String idEvento, String idUser) {
        Optional<Evento> evento = findById(idEvento);
        Evento e;
        ArrayList<String> app;
        if(evento.isPresent()){
            e = evento.get();
            app = e.getIscrizioni();
            if(!app.contains(idUser))
            app.add(idUser);
            e.setIscrizioni(app);
        }
        else{
            e = null;
        }
        save(e);
    }
    List<Evento> findByIsApproved(Boolean isApproved);
    List<Evento> findByPartecipanti(int partecipanti);
    List<Evento> findByPartecipantiGreaterThan(int partecipanti);
    List<Evento> findByPartecipantiLessThan(int partecipanti);
    List<Evento> findByTitoloLike(String titolo);    
    List<Evento> findByIdCreatore(String id);
    
}