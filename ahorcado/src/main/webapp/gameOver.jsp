<%-- 
    Document   : gameOver
    Created on : 08-oct-2018, 11:26:20
    Author     : mmartin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game Over</title>
    </head>
    <body>
        <h1>Game Over</h1>
        <h2>Lo siento. Has perdido</h2>
        <h2>La palabra era ${sessionScope.secretWord}</h2>
        <a href="index.jsp">Jugar de nuevo</a>
    </body>
</html>
