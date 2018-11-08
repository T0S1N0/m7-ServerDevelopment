<%-- 
    Document   : welcomePage
    Created on : 07-nov-2018, 19:37:17
    Author     : mmartin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- To use core JSTL, make sure the included--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- Make sure the JSP is allow access session.--%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <h1>Messages</h1>
        <button>Write new</button>
        
        <h3>Inbox</h3>
        <h4>
            <c:forEach var="receivedMSG" items="${sessionScope.receivedMSG}">
                <p><c:out value = "${receivedMSG}"/></p>
            </c:forEach>
        </h4>
        
        <h3>Sent</h3>
        <h4>
            <c:forEach var="sentMSG" items="${sessionScope.sentMSG}">
                <p><c:out value = "${sentMSG}"/></p>
            </c:forEach>
        </h4>
    </body>
</html>
