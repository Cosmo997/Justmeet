package it.unicam.justmeetbackend.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.databasefake.Topic;
import it.unicam.justmeetbackend.services.TopicService;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * TopicController
 */
@RestController
public class TopicController {

/*

    @Autowired
    TopicService topicService;

    @RequestMapping(value="/topics", method=RequestMethod.GET)
    public ArrayList<Topic> getTopics() {
        return topicService.getTopicList();
    }

    @RequestMapping(value="/topic/id/{id}", method=RequestMethod.GET)
    public Topic getTopicById(@PathVariable String id) {
        return topicService.getTopicById(id);
    }

    @RequestMapping(value="/topic/argomento/{argomento}", method=RequestMethod.GET)
    public Topic getTopicByArgomento(@PathVariable String argomento) {
        return topicService.getTopicByArgomento(argomento);
    }
     
    */

    
}