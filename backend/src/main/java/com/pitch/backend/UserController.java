package com.pitch.backend;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.postgresql.util.PSQLException;

@RestController
public class UserController {

    @Autowired
    private UserDbService userService;
    
    @GetMapping("/")
    public String hello() {
        try {
            userService.createUser("Kevin", "Lam", "mvk2uy@virginia.edu", "5408151796");
            return "User created";
        } 
        catch (RuntimeException e) {
            return "User not created";
        }
    }
}
