package com.pitch.backend.controllers;

import org.springframework.web.bind.annotation.RestController;

import com.pitch.backend.Firebase.FirebaseAuthService;
import com.pitch.backend.Firebase.FirestoreService;

@RestController
public class FirebaseController {
    private final FirestoreService firestoreService;
    private final FirebaseAuthService firebaseAuthService;

    public FirebaseController(FirebaseAuthService firebaseAuthService, FirestoreService firestoreService) {
        this.firestoreService = firestoreService;
        this.firebaseAuthService = firebaseAuthService;
    }
}
