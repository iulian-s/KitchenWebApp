<%@ page import="com.exemplu.dao.DatabaseConnection"%>
<%@ page import="com.exemplu.dao.AlimenteUserDAO"%>
<%@ page import="com.exemplu.dao.AlimenteUser"%>
<%@ page import="com.exemplu.dao.Aliment"%>
<%@ page import="com.exemplu.dao.UnitateDeMasura"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Frigider</title>
<style>
    .container {
        display: flex;
        height: 100vh;
        width: 100%;
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
<h2>Alimentele tale</h2>

<div class="container">
	<div class="table-container">
		<table class="sortable"border="1">
		        <thead>
		            <tr>
		                <th>Nume Aliment</th>
		                <th>Cantitate</th>
		                <th>UM</th>
		                <th>Data expirarii</th>
		                <th>pret</th>
		                <th>Actiuni</th>
		                
		            </tr>
		        </thead>
		        <tbody>
		           <%
		           		List<AlimenteUser> alimenteUser = AlimenteUserDAO.getAlimenteUser(session);
			           
		           		for(AlimenteUser aliment : alimenteUser){
		           %>
		           		<tr>
		           			<td><%= aliment.getNume_aliment() %></td>
		           			<td><%= aliment.getCantitate() %></td>
		           			<td><%= aliment.getUnitate_de_masura() %></td>
		           			<td><%= aliment.getData_expirare() %></td>
		           			<td><%= aliment.getPret() %></td>
		           			
		           			<td>
                
                <form action="sterge_aliment_user.jsp" method="post">
            <input type="hidden" name="id_aliment_utilizator" value="<%= aliment.getId() %>">
            <button type="submit">Șterge</button>
        </form>
                <button type="button" onclick="populeazaFormular(
    '<%= aliment.getId_aliment() %>', 
    '<%= aliment.getCantitate() %>', 
    '<%= aliment.getId_unitate_de_masura() %>', 
    '<%= aliment.getData_expirare() %>', 
    '<%= aliment.getPret() %>')">
    Editare
</button>
            </td>
		           		</tr>
		           	<%
		           		}
		           	%>	
		                  
		        </tbody>
		    </table>
		   </div>
		   <div class="form-container">
    <h3>Adaugă / Editează Aliment</h3>
    <form id="formAliment" action="adauga_aliment_user.jsp" method="post">
        <input type="hidden" id="id_aliment_utilizator" name="id_aliment_utilizator">
        
        <label for="aliment">Aliment:</label>
        <select id="aliment" name="aliment" required>
            <%
                List<Aliment> alimente = AlimenteUserDAO.getListaAlimente();
                for (Aliment aliment : alimente) {
                	
            %>
                <option value="<%= aliment.getId() %>"><%= aliment.getNume() %></option>
            <%
                }
            %>
        </select><br><br>
        

        <label for="cantitate">Cantitate:</label>
        <input type="number" id="cantitate" name="cantitate" required><br><br>

        <label for="unitate">Unitate de măsură:</label>
        <select id="unitate" name="unitate" required>
            <%
                List<UnitateDeMasura> unitati = AlimenteUserDAO.getListaUnitati();
                for (UnitateDeMasura unitate : unitati) {
            %>
                <option value="<%= unitate.getId_unitate_de_masura() %>"><%= unitate.getUnitate_de_masura() %></option>
            <%
                }
            %>
        </select><br><br>

        <label for="data_expirare">Data Expirării:</label>
        <input type="date" id="data_expirare" name="data_expirare" required><br><br>

        <label for="pret">Preț:</label>
        <input type="number" id="pret" name="pret" required><br><br>

        <input type="submit" id="submitButton" value="Adaugă Aliment">
    </form>
</div>

</div>


<script>
function populeazaFormular(id, cantitate, unitate, dataExpirare, pret) {
    document.getElementById("id_aliment_utilizator").value = id;
    document.getElementById("cantitate").value = cantitate;
    document.getElementById("data_expirare").value = dataExpirare;
    document.getElementById("pret").value = pret;

    var unitateSelect = document.getElementById("unitate");
    for (var i = 0; i < unitateSelect.options.length; i++) {
        if (unitateSelect.options[i].value == unitate) {
            unitateSelect.selectedIndex = i; 
            break;
        }
    }


    var alimentSelect = document.getElementById("aliment");
    for (var i = 0; i < alimentSelect.options.length; i++) {
        if (alimentSelect.options[i].value == id) {
            alimentSelect.selectedIndex = i; 
            break;
        }
    }


    document.getElementById("submitButton").value = "Salvează modificările";
    document.getElementById("formAliment").action = "actualizeaza_aliment_user.jsp";
}

</script>

</body>
</html>