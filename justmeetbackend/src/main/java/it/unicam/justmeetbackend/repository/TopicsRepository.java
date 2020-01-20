package it.unicam.justmeetbackend.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.justmeetbackend.databasefake.Topic;

public interface TopicsRepository extends MongoRepository<Topic, String> {
  Topic findBy_id(int _id);
  Topic findByArgomento(String argomento);
}