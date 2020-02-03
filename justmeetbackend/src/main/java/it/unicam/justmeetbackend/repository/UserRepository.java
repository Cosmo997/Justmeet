package it.unicam.justmeetbackend.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.justmeetbackend.classi.User;

public interface UserRepository extends MongoRepository<User, String> {
    
    
    List<User> findAll();
    Optional<User> findById(String id);
    List<User> findByEmail(String email);
    List<User> findByNome(String nome);
    
    
}