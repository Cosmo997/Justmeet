package it.unicam.justmeetbackend;

import java.io.IOException;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.io.ClassPathResource;


@SpringBootApplication 
public class Main{
	public static void main(final String[] args) {
		SpringApplication.run(Main.class, args);

		try {
            FirebaseOptions options = new FirebaseOptions.Builder().setCredentials(GoogleCredentials.fromStream(
                    new ClassPathResource("/justmeet-c8d6f-firebase-adminsdk-5295x-382e05be1e.json").getInputStream()))
                    .setStorageBucket("justmeet-ea052.appspot.com")
                    .setDatabaseUrl("https://justmeet-c8d6f.firebaseio.com").build();
            FirebaseApp.initializeApp(options);
        } catch (IOException e) {
            e.printStackTrace();
        }

	}

}

