<%-- 
    Document   : youWin
    Created on : 08-oct-2018, 11:23:06
    Author     : mmartin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Has ganado!!</title>
    </head>
    <body>
        <h1>Has ganado!!</h1>
        <h2>${sessionScope.secretWord}</h2>
        <a href="index.jsp">Jugar de nuevo</a>
    </body>
</html>