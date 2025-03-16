<%@ page import="com.exemplu.dao.AlimenteDAO" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

    String nume = request.getParameter("nume");
    String categorie = request.getParameter("categorie");
    if (nume != null) {nume = nume.replaceAll("<", "&lt;").replaceAll(">", "&gt;");}
    if (categorie != null){categorie = categorie.replaceAll("<", "&lt;").replaceAll(">", "&gt;");}

    Integer userId = (Integer) session.getAttribute("userId");

    if (userId != null && nume != null && categorie != null) {
        boolean success = AlimenteDAO.adaugaAliment(nume, categorie, userId);
        
        if (success) {
%>
            <script>
                alert("Aliment adaugat cu succes!");
                window.location.href = "alimente.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Alimentul exista deja in baza de date!");
                window.history.back();
            </script>
<%
        }
    } else {
%>
        <script>
            alert("Eroare: Utilizator neautentificat sau date invalide!");
            window.history.back();
        </script>
<%
    }
%>
