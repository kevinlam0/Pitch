package com.pitch.backend.Firebase;

import com.google.firebase.FirebaseApp;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import org.springframework.stereotype.Service;

@Service
public class FirebaseAuthService {
    private FirebaseAuth firebaseAuth;

    public FirebaseAuthService(FirebaseApp firebaseApp) {
        this.firebaseAuth = FirebaseAuth.getInstance(firebaseApp);
    }
    public FirebaseToken verifyIdToken(String idToken) throws Exception {
        return this.firebaseAuth.verifyIdToken(idToken);
    }
}