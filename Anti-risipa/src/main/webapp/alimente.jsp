<%@ page import="com.exemplu.dao.AlimenteDAO"%>
<%@ page import="com.exemplu.dao.Aliment"%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alimente prestabilite</title>
<style>
    .container {
        display: flex;
    }
    .table-container {
        flex: 2;
    }
    .form-container {
        flex: 1;
        margin-left: 20px;
        border-left: 2px solid #ccc;
        padding-left: 20px;
    }
    
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

<script src="sorttable.js"></script>

<h2>Lista alimente</h2>
<form action="" method="get">
    <label for="categorieFiltrata">Filtrează după categorie:</label>
    <select name="categorie" id="categorieFiltrata">
        <option value="">Alege o categorie</option>
        <option value="Fructe">Fructe</option>
        <option value="Legume">Legume</option>
        <option value="Lactate">Lactate</option>
        <option value="Carne">Carne</option>
        <option value="De baza">De baza</option>
        <option value="Conserve">Conserve</option>
        <option value="Proaspete">Proaspete</option>
        <option value="Alta">Alta</option>
        
    </select>
    <input type="submit" value="Filtrare">
</form>
<div class="container">
    <div class="table-container">
        <table class="sortable" border="1">
            <thead>
                <tr>
                    <th>ID Aliment</th>
                    <th>Nume</th>
                    <th>Categorie</th>
                    <th>Data Inserării</th>
                </tr>
            </thead>
            <tbody>
               <%
               String categorieFiltrata = request.getParameter("categorie");
                    List<Aliment> alimente;
                    if (categorieFiltrata != null && !categorieFiltrata.isEmpty()) {
                        alimente = AlimenteDAO.getAlimenteByCategorie(categorieFiltrata);  
                    } else {
                        alimente = AlimenteDAO.getAlimente();  
                    }
                    for(Aliment aliment : alimente){
               %>
                    <tr>
                        <td><%= aliment.getId() %></td>
                        <td><%= aliment.getNume() %></td>
                        <td><%= aliment.getCategorie() %></td>
                        <td><%= aliment.getData_inserarii() %></td>
                    </tr>
               <%
                    }	
               %>	
            </tbody>
        </table>
    </div>

    
    <div class="form-container">
        <h3>Adaugă Aliment</h3>
        <form action="adaugaAliment.jsp" method="post">
            <label for="nume">Nume:</label>
            <input type="text" name="nume" required><br><br>

            <label for="categorie">Categorie:</label>
            <input type="text" id="categorie" name="categorie" required><br><br>

            <input type="submit" value="Adaugă Aliment">
        </form>
    </div>
</div>

</body>
</html>
