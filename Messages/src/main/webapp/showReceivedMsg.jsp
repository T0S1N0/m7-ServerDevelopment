<%-- 
    Document   : showMsg
    Created on : 13-nov-2018, 18:47:21
    Author     : mmartin
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MessageReceived</title>
    </head>
    <body>
        <h1>INBOX</h1>
        <h3>From:   </h3>${requestScope.user}
        <h3>At:     </h3>${requestScope.date}
        <h3>Content:</h3>
        <textarea rows="20" cols="100">${requestScope.msgContent}</textarea>
    </body>
    <c:url value = "/welcomePage.jsp" var = "back"></c:url>
    <a href="${back}">Go Back</a>
</html>
