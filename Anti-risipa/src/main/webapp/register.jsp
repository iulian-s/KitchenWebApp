<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
<%@ page import="com.exemplu.dao.DatabaseConnection, com.exemplu.dao.Register" %>
<%@ page import="com.exemplu.exception.RegistrationException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Înregistrare</title>
  <style>
  	body {
    background: linear-gradient(135deg, #e8f5e9, #c8e6c9); 
    font-family: Arial, sans-serif;
    padding: 20px;
}

h2 {
    color: #2c6f2e;
}

form {
    max-width: 400px;
    max-height:500px;
    margin: 0 auto;
    padding: 20px;
    background: #ffffff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    font-weight: bold;
    margin-bottom: 5px;
    display: block;
}

input[type="text"], input[type="password"], input[type="date"], select {
    
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
}

input[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #4caf50;
    border: none;
    color: white;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

h2 {
    color: #b71c1c;
    background: rgba(239, 68, 68, 0.1);
    padding: 8px;
    border-radius: 5px;
    display: inline-block;
}

input[type="submit"]:focus {
    outline: none;
}

select {
    font-size: 16px;
}
  	
  </style>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script>
    function validateForm() {
      var username = document.getElementById("username").value;
      var password = document.getElementById("password").value;
      var nume = document.getElementById("nume").value;
      var prenume = document.getElementById("prenume").value;
      var data_nasterii = document.getElementById("data_nasterii").value;
      var gen = document.getElementById("gen").value;

      if (username == "" || password == "" || nume == "" || prenume == "" || data_nasterii == "" || gen == "") {
        alert("Toate câmpurile sunt obligatorii!");
        return false;
      }

      return true;
    }
  </script>
</head>
<body>
  <h2>Creare cont nou</h2>
  
  <form action="register.jsp" method="post" onsubmit="return validateForm()">
    <label for="username">Nume utilizator:</label>
    <input type="text" id="username" name="username" required/><br/><br/>

    <label for="password">Parola:</label>
    <input type="password" id="password" name="password" required/><br/><br/>

    <label for="nume">Nume:</label>
    <input type="text" id="nume" name="nume" required/><br/><br/>

    <label for="prenume">Prenume:</label>
    <input type="text" id="prenume" name="prenume" required/><br/><br/>

    <label for="data_nasterii">Data nașterii:</label>
    <input type="date" id="data_nasterii" name="data_nasterii" required/><br/><br/>

    <label for="gen">Gen:</label>
    <select id="gen" name="gen">
      <option value="F">F</option>
      <option value="B">B</option>
      <option value="X">X</option>
    </select><br/><br/>

    <input type="submit" value="Înregistrare"/>
  </form>

  <%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String nume = request.getParameter("nume");
    String prenume = request.getParameter("prenume");
    String data_nasterii = request.getParameter("data_nasterii");
    String gen = request.getParameter("gen");
    String mesajEroare = "";

    if (username != null) {username = username.replaceAll("<", "&lt;").replaceAll(">", "&gt;");}
    if (password != null){password = password.replaceAll("<", "&lt;").replaceAll(">", "&gt;");}
    if (nume != null){nume = nume.replaceAll("<", "&lt;").replaceAll(">", "&gt;");}
    if (prenume != null){ prenume = prenume.replaceAll("<", "&lt;").replaceAll(">", "&gt;");}
   

    if (username != null && password != null) {
        try {
            boolean success = Register.createUser(username, password, nume, prenume, data_nasterii, gen);
            if (success) {
            	
                response.sendRedirect("login.jsp");
            }
        } catch (RegistrationException e) {
            mesajEroare = e.getMessage(); 
        }
    }
    
    if (!mesajEroare.isEmpty()) {
        out.println("<h2>" + mesajEroare + "</h2>");
    }
  %>
</body>
</html>
