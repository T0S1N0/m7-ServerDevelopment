<%-- 
    Document   : index
    Created on : 04-oct-2018, 9:51:32
    Author     : mmartin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--ServletContext context= getServletContext();
RequestDispatcher rd= context.getRequestDispatcher("/YourServlet");
    rd.forward(request, response);--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ahorcado</title>
    </head>
    <body>
        <h1>Introduce una palabra</h1>
        <form action="${pageContext.request.contextPath}/SaveWord" method="post">
            <label>Introduce una palabra secreta</label> 
            <input type="password" name="secretWord" required>
            <input type="submit" value="Adivinar" name="adivinar"/>
        </form>
    </body>
</html>
