<%@ page import="com.exemplu.dao.AlimenteDAO"%>
<%@ page import="com.exemplu.dao.Aliment"%>
<%@ page import="com.exemplu.dao.AlimenteUserDAO"%>
<%@ page import="com.exemplu.dao.UnitateDeMasura"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Adaugă Rețetă</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <h2>Adaugă o Rețetă Nouă</h2>
    <form action="procesare_adaugare_retete.jsp" method="post">
        <label for="titlu">Titlu:</label><br>
        <input type="text" name="titlu" required><br>

        <label for="instructiuni">Instrucțiuni:</label><br>
        <textarea name="instructiuni" required></textarea><br>

        <!-- <label for="id_utilizator">ID Utilizator:</label><br>
        <input type="number" name="id_utilizator" required><br> -->

        <!-- <label for="data_adaugarii">Data Adăugării:</label><br>
        <input type="date" name="data_adaugarii" required><br> -->

        <h3>Ingrediente</h3>
        <div id="ingrediente">
            <div>
                <label for="aliment">Aliment:</label>
    <select name="id_alimente[]" required>
        <%
            List<Aliment> alimente = AlimenteDAO.getAlimente();
            for (Aliment aliment : alimente) {
        %>
            <option value="<%= aliment.getId() %>"><%= aliment.getNume() %></option>
        <%
            }
        %>
    </select>
    <br><br>

                <label>Cantitate:</label>
                <input type="number" name="cantitate[]" required>

                <label for="unitate">Unitate de măsură:</label>
    <select name="id_unitati[]" required>
         <%
                List<UnitateDeMasura> unitati = AlimenteUserDAO.getListaUnitati();
                for (UnitateDeMasura unitate : unitati) {
            %>
            <option value="<%= unitate.getId_unitate_de_masura() %>"><%= unitate.getUnitate_de_masura() %></option>
            <%
                }
            %>
    </select>
    <br><br>
            </div>
        </div>
        <button type="button" onclick="adaugaIngredient()">Adaugă Ingredient</button><br><br>

        <input type="submit" value="Adaugă Rețetă">
        <button type="button" onclick="location.href='retete.jsp'" class="btn btn-secondary">Anulează</button>
        
        
    </form>

    <script>
    function adaugaIngredient() {
        let container = document.getElementById("ingrediente");
        let div = document.createElement("div");
        div.innerHTML = `
            <label>Aliment:</label>
            <select name="id_alimente[]" required>
                <%
                    List<Aliment> alimente2 = AlimenteDAO.getAlimente();
                    for (Aliment aliment : alimente) {
                %>
                    <option value="<%= aliment.getId() %>"><%= aliment.getNume() %></option>
                <%
                    }
                %>
            </select><br><br>

            <label>Cantitate:</label>
            <input type="number" name="cantitate[]" required>

            <label>Unitate de măsură:</label>
            <select name="id_unitati[]" required>
                <%
                    List<UnitateDeMasura> unitati2 = AlimenteUserDAO.getListaUnitati();
                    for (UnitateDeMasura unitate : unitati) {
                %>
                    <option value="<%= unitate.getId_unitate_de_masura() %>"><%= unitate.getUnitate_de_masura() %></option>
                <%
                    }
                %>
            </select><br><br>
        `;
        container.appendChild(div);
    }



    </script>
</body>
</html>
