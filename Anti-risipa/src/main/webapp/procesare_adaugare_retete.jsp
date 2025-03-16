<%@ page import="com.exemplu.dao.ReteteDAO, com.exemplu.dao.Reteta, com.exemplu.dao.ContinutReteta" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("UTF-8");
    String titlu = request.getParameter("titlu");
    String instructiuni = request.getParameter("instructiuni");
    int idUtilizator = (Integer) session.getAttribute("userId");
    LocalDate dataAdaugarii = LocalDate.now();

    Reteta reteta = new Reteta(titlu, instructiuni, idUtilizator, dataAdaugarii);
    int idReteta = ReteteDAO.adaugaReteta(reteta);

    if (idReteta > 0) {
        String[] idAlimente = request.getParameterValues("id_alimente[]");
        String[] cantitati = request.getParameterValues("cantitate[]");
        String[] idUnitati = request.getParameterValues("id_unitati[]");
        

        List<ContinutReteta> ingrediente = new ArrayList<>();
        for (int i = 0; i < idAlimente.length; i++) {
            ingrediente.add(new ContinutReteta(
                Integer.parseInt(idAlimente[i]),
                Integer.parseInt(cantitati[i]),
                Integer.parseInt(idUnitati[i])
            ));
        }

        ReteteDAO.adaugaIngrediente(idReteta, ingrediente);
        out.println("<p style='color:green;'>Rețeta a fost adăugată cu succes!</p>");
        response.sendRedirect("retete.jsp");
    } else {
        out.println("<p style='color:red;'>Eroare la adăugarea rețetei!</p>");
    }
%>