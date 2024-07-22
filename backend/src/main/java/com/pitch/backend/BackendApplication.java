package com.pitch.backend;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Objects;

import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.io.ClassPathResource;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

@SpringBootApplication
public class BackendApplication {
	@SuppressWarnings("deprecation")
	public static void main(String[] args) throws IOException {
		// ClassPathResource resource = new ClassPathResource("serviceAccountKey.json");

		// try (InputStream serviceAccountStream = resource.getInputStream()) {
			
		// 	FirebaseOptions options = new FirebaseOptions.Builder()
		// 		.setCredentials(GoogleCredentials.fromStream(serviceAccountStream))
		// 		.build();
		// 	FirebaseApp.initializeApp(options);
		// } 
		// catch (IOException e) {
		// 	// Handle IOException appropriately (e.g., log the error and exit)
		// 	e.printStackTrace();
		// 	System.exit(-1);
		// }
		SpringApplication.run(BackendApplication.class, args);
	}

}
