package com.exemplu.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

public class AlimenteDAO {

    public static List<Aliment> getAlimente() {
        List<Aliment> alimente = new ArrayList<>();
        String sql = "SELECT a.id_alimente, a.nume, c.nume AS categorie, a.id_categorii, " +
                     "a.id_utilizator_care_a_adaugat, a.data_inserarii " +
                     "FROM alimente a " +
                     "JOIN categorii c ON a.id_categorii = c.id_categorii " +
                     "JOIN utilizatori u ON a.id_utilizator_care_a_adaugat = u.id_utilizatori";

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                alimente.add(new Aliment(
                        rs.getInt("id_alimente"),
                        rs.getString("nume"),
                        rs.getString("categorie"),
                        rs.getInt("id_categorii"),
                        rs.getInt("id_utilizator_care_a_adaugat"),
                        rs.getDate("data_inserarii").toLocalDate()
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return alimente;
    }

    public static boolean adaugaAliment(String nume, String categorie, int userId) {
    	if (existaAliment(nume)) {
            
            return false;
        }
        boolean status = false;
        String sql = "INSERT INTO alimente (nume, id_categorii, id_utilizator_care_a_adaugat, data_inserarii) " +
                     "VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            int categorieId = getCategorieId(conn, categorie);
            if (categorieId == -1) {
                categorieId = insertCategorie(conn, categorie);
            }

            ps.setString(1, nume);
            ps.setInt(2, categorieId);
            ps.setInt(3, userId);
            ps.setDate(4, Date.valueOf(LocalDate.now()));

            status = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    private static int getCategorieId(Connection conn, String categorie) {
        String sql = "SELECT id_categorii FROM categorii WHERE nume = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, categorie);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("id_categorii");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    private static int insertCategorie(Connection conn, String categorie) {
        String sql = "INSERT INTO categorii (nume) VALUES (?)";
        try (PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, categorie);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    private static boolean existaAliment(String nume) {
        String sql = "SELECT COUNT(*) FROM alimente WHERE nume = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, nume);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static List<Aliment> getAlimenteByCategorie(String categorie) {
        List<Aliment> alimente = new ArrayList<>();
        String sql = "SELECT a.id_alimente, a.nume, c.nume AS categorie, a.id_categorii, " +
                     "a.id_utilizator_care_a_adaugat, a.data_inserarii " +
                     "FROM alimente a " +
                     "JOIN categorii c ON a.id_categorii = c.id_categorii " +
                     "WHERE c.nume = ?";  

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, categorie);  
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                alimente.add(new Aliment(
                        rs.getInt("id_alimente"),
                        rs.getString("nume"),
                        rs.getString("categorie"),
                        rs.getInt("id_categorii"),
                        rs.getInt("id_utilizator_care_a_adaugat"),
                        rs.getDate("data_inserarii").toLocalDate()
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return alimente;
    }

 

    
    
}
