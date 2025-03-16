package com.exemplu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

import com.exemplu.exception.RegistrationException;

public class Register {

	public static boolean createUser(String username, String password, String nume, String prenume, String dataNasterii,
			String gen) throws RegistrationException {

		if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()
				|| nume == null || nume.trim().isEmpty() || prenume == null || prenume.trim().isEmpty()
				|| dataNasterii == null || dataNasterii.trim().isEmpty() || gen == null || gen.trim().isEmpty()) {
			throw new RegistrationException("Toate câmpurile sunt obligatorii!");
		}
		LocalDate birthDate;
		try {
			birthDate = LocalDate.parse(dataNasterii);
		} catch (Exception e) {
			throw new RegistrationException("Format invalid pentru data nașterii! Folosește YYYY-MM-DD.");
		}

		if (birthDate.isAfter(LocalDate.now())) {
			throw new RegistrationException("Data nașterii nu poate fi în viitor!");
		}

		try (Connection con = DatabaseConnection.getConnection()) {
			String checkUser = "SELECT id_utilizatori FROM utilizatori WHERE nume_utilizator = ?";
			try (PreparedStatement checkStmt = con.prepareStatement(checkUser)) {
				checkStmt.setString(1, username);
				ResultSet rs = checkStmt.executeQuery();
				if (rs.next()) {
					throw new RegistrationException("Utilizatorul există deja!");
				}
			}

			String insertUser = "INSERT INTO utilizatori (nume_utilizator, nume, prenume, data_nasterii, gen, rol) VALUES (?, ?, ?, ?, ?, 'user')";
			try (PreparedStatement stmt = con.prepareStatement(insertUser, Statement.RETURN_GENERATED_KEYS)) {
				stmt.setString(1, username);
				stmt.setString(2, nume);
				stmt.setString(3, prenume);
				stmt.setDate(4, Date.valueOf(dataNasterii));
				stmt.setString(5, gen);
				stmt.executeUpdate();

				ResultSet generatedKeys = stmt.getGeneratedKeys();
				if (generatedKeys.next()) {
					int userId = generatedKeys.getInt(1);

					String insertPassword = "INSERT INTO parole (id_utilizatori, parola) VALUES (?, ?)";
					try (PreparedStatement passStmt = con.prepareStatement(insertPassword,
							Statement.RETURN_GENERATED_KEYS)) {
						passStmt.setInt(1, userId);
						passStmt.setString(2, password);
						passStmt.executeUpdate();

						ResultSet passKeys = passStmt.getGeneratedKeys();
						if (passKeys.next()) {
							int passwordId = passKeys.getInt(1);

							String updateUser = "UPDATE utilizatori SET id_parola = ? WHERE id_utilizatori = ?";
							try (PreparedStatement updateStmt = con.prepareStatement(updateUser)) {
								updateStmt.setInt(1, passwordId);
								updateStmt.setInt(2, userId);
								updateStmt.executeUpdate();
							}
						}
					}
					return true;
				}
			}
		} catch (SQLException e) {
			throw new RegistrationException("Eroare la accesarea bazei de date: " + e.getMessage());
		} catch (Exception e) {
			throw new RegistrationException("A apărut o eroare neașteptată: " + e.getMessage());
		}
		return false;
	}
}
