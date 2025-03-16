<%@ page import="com.exemplu.dao.AlimenteUserDAO" %>
<%@ page import="com.exemplu.dao.AlimenteUser" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
try {
    int idAlimentUser = Integer.parseInt(request.getParameter("id_aliment_utilizator"));
    int userId = (Integer) session.getAttribute("userId");
    int idAliment = Integer.parseInt(request.getParameter("aliment"));
    int cantitate = Integer.parseInt(request.getParameter("cantitate"));
    int unitate = Integer.parseInt(request.getParameter("unitate"));
    Date dataExpirare = Date.valueOf(request.getParameter("data_expirare"));
    int pret = Integer.parseInt(request.getParameter("pret"));

    boolean success = AlimenteUserDAO.actualizeazaAlimentUser(
        userId, 
        idAliment,  
        cantitate, 
        unitate, 
        dataExpirare, 
        pret, 
        idAlimentUser
    );

    if (success) {
%>
    <script>
        alert("Aliment actualizat cu succes!");
        window.location.href = "alimente_user.jsp";
    </script>
<%
    } else {
%>
    <script>
        alert("Eroare la actualizare! Verificati datele introduse.");
        window.history.back();
    </script>
<%
    }
} catch (IllegalArgumentException e) {
%>
    <script>
        alert("<%= e.getMessage() %>");
        window.history.back();
    </script>
<%
} catch (SQLException e) {
%>
    <script>
        alert("Eroare de baza de date: Actualizarea a esuat.");
        window.history.back();
    </script>
<%
} catch (Exception e) {
%>
    <script>
        alert("A aparut o eroare neasteptata.");
        window.history.back();
    </script>
<%
}
%>