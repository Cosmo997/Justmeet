package it.unicam.justmeetbackend.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.justmeetbackend.classi.User;

public interface UserRepository extends MongoRepository<User, String> {
    
    
    List<User> findAll();
    Optional<User> findById(String id);
    List<User> findByEmail(String email);
    List<User> findByNome(String nome);
    default void updatePreferiti(String idUser, String idEvento){
        Optional<User> user = findById(idUser);
        User u;
        ArrayList<String> app;
        if(user.isPresent()){
            u = user.get();
            app = u.getPreferiti();
            if(!app.contains(idEvento))
            app.add(idEvento);
            u.setPreferiti(app);
        }
        else{
            u = null;
        }
        save(u);
    }

    default void deletePreferito(String idUser, String idEvento){
        Optional<User> user = findById(idUser);
        User u;
        ArrayList<String> app;
        if(user.isPresent()){
            u = user.get();
            app = u.getPreferiti();
            if(app.contains(idEvento))
            app.remove(idEvento);
            u.setPreferiti(app);
        }
        else{
            u = null;
        }
        save(u);
    }
    
}