<%@ page import="com.exemplu.dao.AlimenteUserDAO"%>
<%@ page import="com.exemplu.dao.AlimenteUser"%>
<%@ page import="com.exemplu.dao.Aliment"%>
<%@ page import="com.exemplu.dao.UnitateDeMasura"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    
        int userId = (Integer) session.getAttribute("userId");
        int idAliment = Integer.parseInt(request.getParameter("aliment"));
        int cantitate = Integer.parseInt(request.getParameter("cantitate"));
        int idUM = Integer.parseInt(request.getParameter("unitate"));
        Date dataExpirare = Date.valueOf(request.getParameter("data_expirare"));
        int pret = Integer.parseInt(request.getParameter("pret"));

        boolean success = AlimenteUserDAO.adaugaAlimentUser(userId, idAliment, cantitate, idUM, dataExpirare, pret);

        if (success) {
        	%>
            <script>
                alert("Aliment adaugat cu succes!");
                window.location.href = "alimente_user.jsp";
            </script>
<%
        } else {
        	%>
            <script>
                alert("Eroare la adaugare!");
                window.history.back();
            </script>
<%
        }
%>

