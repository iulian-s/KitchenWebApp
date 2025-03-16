<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
<%@ page import="com.exemplu.dao.DatabaseConnection"%>
<%@ page import="com.exemplu.dao.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
  <title>Autentificare</title>
  <style>
    body {
    background: linear-gradient(135deg, #e3f2fd, #bbdefb); 
    font-family: Arial, sans-serif;
}

.form-buttons input {
    padding: 8px 16px;
    border: none;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    transition: 0.3s ease-in-out;
}

input[type="submit"] {
    background-color: #42a5f5;
    color: white;
}

input[type="submit"]:hover {
    background-color: #1e88e5;
}

h2 {
    color: #1e3a5f;
}

h2[style*="color: red"] {
    background: rgba(239, 68, 68, 0.1);
    padding: 8px;
    border-radius: 5px;
    display: inline-block;
}

    }
  </style>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
  <h2>Conecteaza-te pentru a incepe sa folosesti aplicatia!</h2>
  <form action="login.jsp" method="post">
    <label for="username">Nume utilizator:</label>
    <input type="text" id="username" name="username" required/><br/><br/>
    <label for="password">Parola:</label>
    <input type="password" id="password" name="password" required/><br/><br/>
    <div class="form-buttons">
      <input type="submit" value="Autentificare"/>
      <input type="submit" value="Inregistrare" formaction="register.jsp"/>
    </div>
  </form>

  <%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String mesajEroare = "";

    if (username != null && password != null) {
        int userId = Login.authenticate(username, password);
        
        if (userId != -1) {
            
            HttpSession sessionUser = request.getSession();
            sessionUser.setAttribute("userId", userId);
            sessionUser.setAttribute("username", username);

            response.sendRedirect("taburi.jsp");
            return;
        } else {
            mesajEroare = "Username sau parola incorecte!";
        }
    }
  %>

  <% if (!mesajEroare.isEmpty()) { %>
    <h2 style="color: red;"><%= mesajEroare %></h2>
  <% } %>
  
  
 
  
</body>
</html>
