<%@ page import="com.exemplu.dao.AlimenteUserDAO" %>
<%@ page import="java.io.IOException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int idAlimentUtilizator = Integer.parseInt(request.getParameter("id_aliment_utilizator"));
    boolean success = AlimenteUserDAO.stergeAlimentUser(idAlimentUtilizator);
    
    if (success) {
        %>
        <script>
            alert("Aliment șters cu succes!");
            window.location.href = "alimente_user.jsp";
        </script>
        <%
    } else {
        %>
        <script>
            alert("Eroare la ștergere!");
            window.history.back();
        </script>
        <%
    }
%>
