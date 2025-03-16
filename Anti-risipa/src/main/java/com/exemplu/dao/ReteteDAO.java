package com.exemplu.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReteteDAO {
	public static List<Reteta> getRetete(){
		List<Reteta> retete = new ArrayList<>();
		
		String sql = "SELECT r.id_retete, \r\n"
				+ "       r.titlu, \r\n"
				+ "       GROUP_CONCAT(CONCAT(a.nume, ' ',c.cantitate, ' ', u.unitate_de_masura) SEPARATOR ', ') AS ingrediente, \r\n"
				+ "       r.instructiuni\r\n"
				+ "FROM retete r\r\n"
				+ "JOIN continut_retete c ON r.id_retete = c.id_retete\r\n"
				+ "JOIN unitate_de_masura u ON c.id_unitati_de_masura = u.id_unitate_de_masura\r\n"
				+ "JOIN alimente a ON a.id_alimente = c.id_alimente\r\n"
				+ "GROUP BY r.id_retete, r.titlu, r.instructiuni;";
		try (Connection conn = DatabaseConnection.getConnection();
			 Statement stmt = conn.createStatement();
			 ResultSet rs = stmt.executeQuery(sql)){
			
			while(rs.next()) {
				retete.add(new Reteta(
						rs.getInt("id_retete"),
						rs.getString("titlu"),
						rs.getString("instructiuni"),
						rs.getString("ingrediente")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			return retete;	
	}
	
	
	public static int adaugaReteta(Reteta reteta) {
        String sql = "INSERT INTO retete (titlu, instructiuni, id_utilizator_care_a_adaugat, data_adaugarii) "
                   + "VALUES (?, ?, ?, ?)";
        int idReteta = -1;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, reteta.getTitlu());
            stmt.setString(2, reteta.getInstructiuni());
            stmt.setInt(3, reteta.getIdUtilizator());
            stmt.setDate(4, Date.valueOf(reteta.getDataAdaugarii()));
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                idReteta = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idReteta;
    }
	
	
	public static void adaugaIngrediente(int idReteta, List<ContinutReteta> ingrediente) {
        String sql = "INSERT INTO continut_retete (id_retete, id_alimente, cantitate, id_unitati_de_masura) "
                   + "VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            for (ContinutReteta ingredient : ingrediente) {
                stmt.setInt(1, idReteta);
                stmt.setInt(2, ingredient.getIdAliment());
                stmt.setInt(3, ingredient.getCantitate());
                stmt.setInt(4, ingredient.getIdUnitateMasura());
                stmt.addBatch();
            }
            stmt.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	
	public static List<Reteta> getReteteByTitlu(String titlu) {
	    List<Reteta> retete = new ArrayList<>();
	
	    String sql = "SELECT r.id_retete, "
	               + "       r.titlu, "
	               + "       GROUP_CONCAT(CONCAT(a.nume, ' ',c.cantitate, ' ', u.unitate_de_masura) SEPARATOR ', ') AS ingrediente, "
	               + "       r.instructiuni "
	               + "FROM retete r "
	               + "JOIN continut_retete c ON r.id_retete = c.id_retete "
	               + "JOIN unitate_de_masura u ON c.id_unitati_de_masura = u.id_unitate_de_masura "
	               + "JOIN alimente a ON a.id_alimente = c.id_alimente "
	               + "WHERE r.titlu LIKE ? "
	               + "GROUP BY r.id_retete, r.titlu, r.instructiuni;";
	    
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        
	        stmt.setString(1, "%" + titlu + "%");
	        
	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                retete.add(new Reteta(
	                        rs.getInt("id_retete"),
	                        rs.getString("titlu"),
	                        rs.getString("instructiuni"),
	                        rs.getString("ingrediente")
	                ));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return retete;
	}

	
}
