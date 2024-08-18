package com.pitch.backend;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    @Autowired
    private DbService dbService;
    
    @GetMapping("/")
    public String hello() {
        if (dbService.createUser("Kevin", "Lam", "mvk2uy@virginia.edu", "5408151796")) {
            return "User created";
        }
        else {
            return "User not created";
        }
    }
}
