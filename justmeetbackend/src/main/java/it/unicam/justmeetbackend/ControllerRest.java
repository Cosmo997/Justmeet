package it.unicam.justmeetbackend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@SpringBootApplication
@RestController
public class ControllerRest {

    @GetMapping(value="/")
    public String getMethodName()
    {
        return "hello";
    }


	public static void main(final String[] args) {
		SpringApplication.run(ControllerRest.class, args);
	}

}
