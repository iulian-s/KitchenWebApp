<%@ page import="com.exemplu.dao.ReteteDAO" %>
<%@ page import="com.exemplu.dao.Reteta" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
	
</style>
    <meta charset="UTF-8">
    <title>Retete</title>
    <script src="sorttable.js"></script>
    <script>
    function searchRetete() {
        var searchQuery = document.getElementById("search").value.toLowerCase();  
        var rows = document.querySelectorAll("#reteteTabel tbody tr");  

        rows.forEach(function(row) {
            var titlu = row.querySelector("td:nth-child(2)").textContent.toLowerCase(); 
            if (titlu.includes(searchQuery)) {
                row.style.display = "";  
            } else {
                row.style.display = "none";  
            }
        });
    }
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <h2>Lista cu retete</h2>

    
    <form>
        <label for="search">Căutare după titlu:</label>
        <input type="text" id="search" name="search" placeholder="Căutare..." onkeyup="searchRetete()">
    </form>

   
    <table class="sortable" border="1" id="reteteTabel">
        <thead>
            <tr>
                <!-- <th>ID Aliment</th> -->
                <th>Titlu</th>
                <th>Ingrediente</th>
                <th>Instructiuni</th>
            </tr>
        </thead>
        <tbody>
            <%
                
                List<Reteta> retete = ReteteDAO.getRetete();
                for (Reteta r : retete) {
            %>
                <tr>
                    <td style="display:none;"><%= r.getId() %></td>
                    <td><%= r.getTitlu() %></td>
                    <td><%= r.getIngrediente() %></td>
                    <td><%= r.getInstructiuni() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <br>
    <a href="adauga_reteta.jsp">
        <button>Adaugă o rețetă</button>
    </a>
</body>
</html>
