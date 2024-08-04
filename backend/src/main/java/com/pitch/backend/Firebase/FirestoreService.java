package com.pitch.backend.Firebase;
import org.springframework.stereotype.Service;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.FirebaseApp;
import com.google.firebase.cloud.FirestoreClient;

@Service
public class FirestoreService {
    private final Firestore firestore;
    public FirestoreService(FirebaseApp firebaseApp) {
        this.firestore =  FirestoreClient.getFirestore(firebaseApp);
    }

    public Firestore getDb() { return firestore; }
}
