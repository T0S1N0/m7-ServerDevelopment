<%-- 
    Document   : index
    Created on : 04-oct-2018, 9:51:32
    Author     : mmartin
--%>
<%--ServletContext context= getServletContext();
RequestDispatcher rd= context.getRequestDispatcher("/YourServlet");
    rd.forward(request, response);--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Introduce una palabra</title>
    </head>
    <body>
        <label>Introduce una palabra secreta</label>
        <form action="${pageContext.request.contextPath}/SaveWord" method="post">
            <input type="password" value="caracol" name="secretWord">
            <input type="submit" value="Adivinar" name="adivinar"/>
        </form>
    </body>
</html>
