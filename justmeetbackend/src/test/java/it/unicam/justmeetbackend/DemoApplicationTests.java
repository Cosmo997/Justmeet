package it.unicam.justmeetbackend;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import it.unicam.justmeetbackend.controllers.EventoController;

@SpringBootTest
public class DemoApplicationTests {

	@Autowired
	private EventoController controller;

	@Test
	public void contexLoads() throws Exception {
		assertThat(controller).isNotNull();
	}
}
