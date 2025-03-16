package com.exemplu.dao;

import java.sql.Connection;
import java.sql.SQLException;

public class TestDatabaseConnection {
    public static void main(String[] args) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            if (connection != null) {
                System.out.println("Conexiune reusita la baza de date!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
