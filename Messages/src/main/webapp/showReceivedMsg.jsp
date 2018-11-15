<%-- 
    Document   : showMsg
    Created on : 13-nov-2018, 18:47:21
    Author     : mmartin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message</title>
    </head>
    <body>
        <h1>INBOX</h1>
        <h3>From:   ${requestScope.userName}</h3>
        <h3>At: ${requestScope.date}</h3>
        <h3>Content:</h3>
        <textarea value="${requestScope.msgContent}" />
    </body>
</html>
