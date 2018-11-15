<%-- 
    Document   : welcomePage
    Created on : 07-nov-2018, 19:37:17
    Author     : mmartin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- To use core JSTL, make sure the included--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
        <form method="POST" action="${pageContext.request.contextPath}/WriteNewMessageServlet">  
            
            <input type="button" value="Write New" onclick="displayTextArea()">
            
            <select name="userSelected">
                <option value="Dani">Dani</option>
                <option value="Marta">Marta</option>
                <option value="Miguel">Miguel</option>
            </select>
            
            <textarea id="showthis" class="hide" style="display:none" placeholder="Redacta aqui tu mensaje" name="content" maxlength="250" rows="10" cols="100"></textarea>
            
            <input type="submit" id="showthis2" class="hide" style="display:none" value="Send">
        </form>
                
        <h3>Inbox</h3>
        
        <h4>
            <c:forEach var="receivedMSG" items="${sessionScope.receivedMSG}">
                
                <c:set var = "date" value = "${fn:substring(receivedMSG, 0, 19)}" scope="request" />
                
                    <form name="submitForm" method="POST" action="${pageContext.request.contextPath}/DeleteMessageServlet" >
<!--                        montar una url con parametros-->
                        <c:url value = "${pageContext.request.contextPath}/GetMessageServlet" var = "msgUrl">
                            <c:param name = "selectedMsg" value = "${receivedMSG}"/>
                            <c:param name = "folder" value = "Received"/>
                            <%--<c:param name = "user" value = "${sessionScope.user}"/>--%>
                            <%--<c:param name = "date" value = "${date}"/>--%>
                        </c:url>
                        <a href="${msgUrl}"><c:out value = "${receivedMSG}"/></a>
                        
                        <input type="text" name="folder" style="display:none" value="Received"/>
                        <input type="text" name="msg" style="display:none" value="${receivedMSG}"/>
                        
                        
                        <input type="image" src="https://cdn0.iconfinder.com/data/icons/classic-icons/512/058.png" alt="delete" height="22" width="22" onclick="return confirm('Are you sure you want to delete this message?')">
                    </form>    
            </c:forEach>
        </h4>
        
        <h3>Sent</h3>
        <h4>
            <c:forEach var="sentMSG" items="${sessionScope.sentMSG}">
                <form name="submitForm" method="POST" action="${pageContext.request.contextPath}/DeleteMessageServlet" >
                        <a href="showMsg.jsp?msg=${sentMSG}"><c:out value = "${sentMSG}"/></a>
                        
                        <input type="text" name="folder" style="display:none" value="Sent"/>
                        <input type="text" name="msg" style="display:none" value="${sentMSG}"/>
                        
                        
                        <input type="image" src="https://cdn0.iconfinder.com/data/icons/classic-icons/512/058.png" alt="delete" height="22" width="22" onclick="return confirm('Are you sure you want to delete this message?')">
                    </form>
            </c:forEach>
        </h4>
        <script>
            function displayTextArea() {
                var selectedobj = document.getElementById('showthis');
                var selectedobj2 = document.getElementById('showthis2');

                if (selectedobj.className == 'hide') {  //check if classname is hide 
                    selectedobj.style.display = "block";
                    selectedobj2.style.display = "block";

                    selectedobj.className = 'show';
                    selectedobj2.className = 'show';
                } else {
                    selectedobj.style.display = "none";
                    selectedobj2.style.display = "none";

                    selectedobj.className = 'hide';
                    selectedobj2.className = 'hide';
                }
            }
        </script>
    </body>
</html>
