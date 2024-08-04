package com.pitch.backend.Firebase;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.context.annotation.Bean;
import java.io.InputStream;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import java.io.IOException;

@Configuration
public class FirebaseConfig {

    private String serviceAccountPath = "serviceAccountKey.json";

    @Bean
    public FirebaseApp firebaseApp() {
        if (FirebaseApp.getApps().isEmpty()) {
            ClassPathResource resource = new ClassPathResource(serviceAccountPath);
            try (InputStream serviceAccountStream = resource.getInputStream()) {
                FirebaseOptions options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccountStream))
                    .build();
                return FirebaseApp.initializeApp(options);
            } 
            catch (IOException e) {
                // Handle IOException appropriately (e.g., log the error and exit)
                e.printStackTrace();
                System.exit(-1);
            }
            return null;
        }
        return FirebaseApp.getInstance();
    }
}
