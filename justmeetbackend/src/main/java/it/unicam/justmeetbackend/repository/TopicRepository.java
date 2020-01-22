package it.unicam.justmeetbackend.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import it.unicam.justmeetbackend.classi.Topic;

public interface TopicRepository extends MongoRepository<Topic, Integer> {
  Topic findBy_id(int _id);
  Topic findByArgomento(String argomento);
}