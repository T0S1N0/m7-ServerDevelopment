<%-- 
    Document   : guessWord
    Created on : 04-oct-2018, 11:33:27
    Author     : mmartin
--%>
<%-- To use core JSTL, make sure the following code is included--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- Make sure the JSP is allow access session.--%>
<%@ page session="true"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ahorcado</title>
    </head>
    <body>
        <h1>Adivina la palabra intorducida</h1>
        <h2>Intentos = ${sessionScope.intentos}</h2>
        <h1>${sessionScope.hiddenWordString}</h1>
        <form action="${pageContext.request.contextPath}/GuessWord" method="post">
            Introduce una letra: <input name="userLetter" maxlength="1" required style="width: 1em"> <input type="submit" value="Adivinar">
        </form>
    </body>
</html>
