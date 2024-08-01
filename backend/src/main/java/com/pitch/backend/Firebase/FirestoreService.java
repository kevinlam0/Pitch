package com.pitch.backend.Firebase;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.cloud.FirestoreClient;

public class FirestoreService {
    private final Firestore db;
    public FirestoreService() {
        this.db = FirestoreClient.getFirestore();
    }

    public Firestore getDb() { return db; }
}
