package it.unicam.justmeetbackend.services;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.stereotype.Service;

import it.unicam.justmeetbackend.databasefake.Topic;

/**
 * TopicService
 */
@Service
public class TopicService {

    Topic topic1 = new Topic("1", "Calcetto");
    Topic topic2 = new Topic("2", "Par");
    Topic topic3 = new Topic("3", "studio");
    Topic topic4 = new Topic("4", "festa");

    ArrayList<Topic> topicList = new ArrayList<>(Arrays.asList(topic1,topic2,topic3,topic4));

	public ArrayList<Topic> getTopicList() {
		return topicList;
	}

	public Topic getTopicById(String id) {
        for (Topic topic : topicList) {
            if(topic.getId().equals(id))
            return topic;
        }
        return null;
	}

	public Topic getTopicByArgomento(String argomento) {
		for (Topic topic : topicList) {
            if(topic.getArgomento().equals(argomento))
            return topic;
        }
        return null;
	}

}