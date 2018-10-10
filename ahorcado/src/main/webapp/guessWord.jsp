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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="customStyles/Styles.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ahorcado</title>
    </head>
    <body>
        <h1><ins>Adivina la palabra intorducida</ins></h1>
        <h2>Intentos = ${sessionScope.intentos}</h2>
        <h1>${sessionScope.hiddenWordString}</h1>
        <form action="${pageContext.request.contextPath}/GuessWord" method="post" class="row">
            <p>Introduce una letra:</p>    <input name="userLetter" maxlength="1" required class="form-control" style="width: 3em;">
            <input type="submit" value="Adivinar" class="btn btn-primary">
        </form>
            
        <c:set var = "tries" scope = "session" value = "${sessionScope.intentos}"/>
        <c:if test = "${tries != 0 && tries < 12}">
            <div style="float: right;"><img src="<c:url value="images/hang${tries}.png"/>"/></div>
        </c:if>

   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
