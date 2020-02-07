package it.unicam.justmeetbackend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.classi.Topic;
import it.unicam.justmeetbackend.repository.TopicRepository;

import java.util.List;

@RestController
public class TopicController {
  
    @Autowired
    private TopicRepository repository;
  
  @RequestMapping(value = "/topics", method = RequestMethod.GET)
  public List<Topic> getAllTopics() {
    return repository.findAll();
  }

  @RequestMapping(value = "/topic/id/{_id}", method = RequestMethod.GET)
  public Topic getTopicById(@PathVariable("_id") int _id) {
    return repository.findBy_id(_id);
  }

  @RequestMapping(value = "/topic/argomento/{argomento}", method = RequestMethod.GET)
  public Topic getTopicByArgomento(@PathVariable("argomento") String argomento) {
    return repository.findByArgomento(argomento);
  }

}