package com.exemplu.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.exemplu.dao.DatabaseConnection;
import java.sql.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AlimenteServlet")
public class AlimenteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AlimenteServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> alimente = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT nume FROM alimente"; 
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                alimente.add(rs.getString("nume")); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("alimente", alimente);

        request.getRequestDispatcher("/test.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
