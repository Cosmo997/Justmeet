package it.unicam.justmeetbackend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.databasefake.Topic;
import it.unicam.justmeetbackend.repository.TopicsRepository;

import javax.validation.Valid;
import java.util.List;

@RestController
public class TopicsController {
  
  private static int latestId = 0;

  public static int generateId() {
    return ++latestId;
 }

    @Autowired
    private TopicsRepository repository;
  
  @RequestMapping(value = "/topics", method = RequestMethod.GET)
  public List<Topic> getAllTopics() {
    return repository.findAll();
  }

  @RequestMapping(value = "/topic/{id}", method = RequestMethod.GET)
  public Topic getTopicById(@PathVariable("_id") int _id) {
    return repository.findBy_id(_id);
  }

  
  @RequestMapping(value = "/topic/{argomento}", method = RequestMethod.GET)
  public Topic getTopicById(@PathVariable("argomento") String argomento) {
    return repository.findByArgomento(argomento);
  }
  
  @RequestMapping(value = "/topic", method = RequestMethod.POST)
  public Topic createTopic(@Valid @RequestBody Topic topic) {
    topic.setId(generateId());
    repository.save(topic);
    return topic;
  }
  
  @RequestMapping(value = "/topic/id/{id}", method = RequestMethod.DELETE)
  public void deleteTopic(@PathVariable int _id) {
    repository.delete(repository.findBy_id(_id));
  }

  
}