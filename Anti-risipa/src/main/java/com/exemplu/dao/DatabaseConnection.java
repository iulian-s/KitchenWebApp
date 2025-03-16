package com.exemplu.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseConnection {

    public static Connection getConnection() throws SQLException {
        String jdbcURL = "jdbc:mysql://localhost:3306/anti_risipa";
        String dbUsername = "root";  
        String dbPassword = "Parola1234";  
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Eroare la încărcarea driverului MySQL", e);
        }
    
        return DriverManager.getConnection(jdbcURL, dbUsername, dbPassword);
    }
}