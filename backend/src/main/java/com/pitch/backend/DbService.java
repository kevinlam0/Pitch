package com.pitch.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.postgresql.util.PSQLException;

@Service
class DbService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public boolean createUser(String firstName, String lastName, String email, String phone) throws RuntimeException {
        String sql = "INSERT INTO base_user (first_name, last_name, email, phone) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, firstName, lastName, email, phone) == 1;
    }
}
