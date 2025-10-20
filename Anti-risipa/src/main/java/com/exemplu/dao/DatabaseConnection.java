package com.exemplu.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseConnection {

    public static Connection getConnection() throws SQLException {
        // Read environment variables (with fallback defaults)
        String dbHost = System.getenv("DB_HOST");
        String dbPort = System.getenv("DB_PORT");
        String dbName = System.getenv("DB_NAME");
        String dbUser = System.getenv("DB_USER");
        String dbPassword = System.getenv("DB_PASSWORD");

        if (dbHost == null || dbPort == null || dbName == null || dbUser == null || dbPassword == null) {
            throw new RuntimeException("Missing one or more required DB environment variables.");
        }

        String jdbcURL = String.format("jdbc:mysql://%s:%s/%s?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
                                       dbHost, dbPort, dbName);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error loading MySQL driver", e);
        }

        return DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
    }
}