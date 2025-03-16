<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
	<%
  HttpSession sessionUser = request.getSession(false);
  if (sessionUser != null) {
    sessionUser.invalidate();
  }
  response.sendRedirect("login.jsp");
%>
</body>
</html>