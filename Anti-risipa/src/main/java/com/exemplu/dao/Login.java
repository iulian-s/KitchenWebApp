package com.exemplu.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class Login {
	public static int authenticate(String username, String password) {
        String query = "SELECT u.id_utilizatori FROM utilizatori u " +
                       "JOIN parole p ON u.id_parola = p.id_parole " +
                       "WHERE u.nume_utilizator = ? AND p.parola = ?";
        
        try (
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)
        ) {
            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("id_utilizatori"); 
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; 
    }
}
