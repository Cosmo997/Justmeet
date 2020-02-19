package it.unicam.justmeetbackend;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import it.unicam.justmeetbackend.controllers.EventoController;
import it.unicam.justmeetbackend.controllers.TopicController;
import it.unicam.justmeetbackend.controllers.UserController;

@SpringBootTest
public class DemoApplicationTests{
	
	@Autowired
	UserController user;

	@Autowired
	EventoController evento;

	@Autowired
	TopicController topic;

	@Test
	public void userControllerNotNull() throws Exception {
		assertThat(user).isNotNull();
	}

	@Test
	public void eventoControllerNotNUll() throws Exception {
		assertThat(evento).isNotNull();
	}

	@Test
	public void topicControllerNotNull() throws Exception {
		assertThat(topic).isNotNull();
	}

}
