package com.exemplu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.http.HttpSession;
public class AlimenteUserDAO {
	public static List<AlimenteUser> getAlimenteUser(HttpSession session) {
        List<AlimenteUser> alimente_user = new ArrayList<>();
        Integer userId = (Integer) session.getAttribute("userId");
        String sql = "SELECT au.id_alimente_utilizator, au.id_utilizatori, au.id_alimente, au.cantitate, " +
                "au.id_unitati_de_masura, um.unitate_de_masura, au.data_expirare, au.pret, a.nume " +
                "FROM alimente_utilizator au " +
                "JOIN unitate_de_masura um ON au.id_unitati_de_masura = um.id_unitate_de_masura " +
                "JOIN alimente a ON au.id_alimente = a.id_alimente " +
                "WHERE au.id_utilizatori = ?";
        		
        
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

               stmt.setInt(1, userId);

               try (ResultSet rs = stmt.executeQuery()) {
                   while (rs.next()) {
                       alimente_user.add(new AlimenteUser(
                               rs.getInt("id_alimente_utilizator"),
                               rs.getInt("id_utilizatori"),
                               rs.getInt("id_alimente"),
                               rs.getString("nume"),
                               rs.getInt("cantitate"),
                               rs.getInt("id_unitati_de_masura"),
                               rs.getString("unitate_de_masura"),
                               rs.getDate("data_expirare").toLocalDate(),
                               rs.getInt("pret")
                               
                       ));
                   }
               }
           } catch (SQLException e) {
               e.printStackTrace();
           }

           return alimente_user;
    }
	
	
	public static boolean adaugaAlimentUser(int userId, int idAliment, int cantitate, int idUM, Date dataExpirare, int pret) {
        String sql = "INSERT INTO alimente_utilizator (id_utilizatori, id_alimente, cantitate, id_unitati_de_masura, data_expirare, pret) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, idAliment);
            ps.setInt(3, cantitate);
            ps.setInt(4, idUM);
            ps.setDate(5, dataExpirare);
            ps.setInt(6, pret);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<Aliment> getListaAlimente() {
        List<Aliment> lista = new ArrayList<>();
        String sql = "SELECT id_alimente, nume FROM alimente";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(new Aliment(rs.getInt("id_alimente"), rs.getString("nume")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public static List<UnitateDeMasura> getListaUnitati() {
        List<UnitateDeMasura> lista = new ArrayList<>();
        String sql = "SELECT id_unitate_de_masura, unitate_de_masura FROM unitate_de_masura";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(new UnitateDeMasura(rs.getInt("id_unitate_de_masura"), rs.getString("unitate_de_masura")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    
    
    public static boolean stergeAlimentUser(int idAlimentUser) {
        System.out.println("Începerea procesului de ștergere pentru ID: " + idAlimentUser);
        String sql = "DELETE FROM alimente_utilizator WHERE id_alimente_utilizator = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idAlimentUser);
            int rowsAffected = ps.executeUpdate();
            System.out.println("Număr de rânduri afectate: " + rowsAffected);
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Eroare la ștergerea alimentului: " + e.getMessage());
            e.printStackTrace();  
            return false;
        }
    }

    public static AlimenteUser getAlimentUserById(int idAlimentUser) {
        AlimenteUser aliment = null;
        String sql = "SELECT au.*, a.id_alimente as id_aliment, a.nume as nume_aliment " +
                     "FROM alimente_utilizator au " +
                     "JOIN alimente a ON au.id_alimente = a.id_alimente " +
                     "WHERE au.id_alimente_utilizator = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idAlimentUser);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    aliment = new AlimenteUser();
                    aliment.setId(rs.getInt("id_alimente_utilizator"));
                    aliment.setNume_aliment(rs.getString("nume_aliment"));
                    aliment.setId_aliment(rs.getInt("id_aliment")); // Add this line
                    aliment.setCantitate(rs.getInt("cantitate"));
                    aliment.setId_unitate_de_masura(rs.getInt("id_unitati_de_masura"));
                    aliment.setData_expirare(rs.getDate("data_expirare").toLocalDate());
                    aliment.setPret(rs.getInt("pret"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return aliment;
    }

    public static boolean actualizeazaAlimentUser(int userId, int idAliment, int cantitate, int unitate, Date dataExpirare, int pret, int idAlimentUser) throws SQLException, IllegalArgumentException {
        // Validate input parameters
        if (userId <= 0 || idAliment <= 0) {
            throw new IllegalArgumentException("Invalid user ID or food item ID");
        }
        
        if (cantitate < 0 || unitate <= 0 || pret < 0) {
            throw new IllegalArgumentException("Invalid quantity, unit, or price values");
        }
        
        if (dataExpirare == null) {
            throw new IllegalArgumentException("Expiration date cannot be null");
        }

        String sqlCheck = "SELECT * FROM alimente_utilizator WHERE id_utilizatori = ? AND id_alimente = ?";
        String sql = "UPDATE alimente_utilizator SET cantitate = ?, id_unitati_de_masura = ?, data_expirare = ?, pret = ? WHERE id_utilizatori = ? AND id_alimente = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement psCheck = conn.prepareStatement(sqlCheck);
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Check for the record using user ID and food item ID
            psCheck.setInt(1, userId);
            psCheck.setInt(2, idAliment);
            
            try (ResultSet rs = psCheck.executeQuery()) {
                if (!rs.next()) {
                    throw new SQLException("No record found for User ID: " + userId + " and Food Item ID: " + idAliment);
                }
            }

            // Prepare update statement
            ps.setInt(1, cantitate);
            ps.setInt(2, unitate);
            ps.setDate(3, dataExpirare);
            ps.setInt(4, pret);
            ps.setInt(5, userId);
            ps.setInt(6, idAliment);

            // Execute update
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            
            e.printStackTrace();
            
            throw e;
        }
    }

    public static String getNumeAlimentById(int id) {
        String nume = "";
        
        try(Connection con = DatabaseConnection.getConnection();
        		 PreparedStatement ps = con.prepareStatement("SELECT nume FROM alimente WHERE id = ?");
        		) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                nume = rs.getString("nume");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nume;
    }

    public static AlimenteUser getAlimentUserByNume(String numeAliment, int userId) {
        AlimenteUser aliment = null;
        
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM alimente_user WHERE nume_aliment = ? AND user_id = ?")) {
            
            ps.setString(1, numeAliment);  
            ps.setInt(2, userId);  
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                aliment = new AlimenteUser();
                aliment.setId(rs.getInt("id"));
                aliment.setNume_aliment(rs.getString("nume_aliment"));
                aliment.setCantitate(rs.getInt("cantitate"));
                aliment.setId_unitate_de_masura(rs.getInt("unitate_de_masura"));
                aliment.setData_expirare(rs.getDate("data_expirare").toLocalDate());
                aliment.setPret(rs.getInt("pret"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return aliment;
    }

    
}

	

