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
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Welcome</title>
        <form method="link" action="${pageContext.request.contextPath}/logOut">
            <input type="submit" value="Logout"/>
        </form>
    </head>
    
    <body>
        <h1>Messages</h1>
        
        <form method="POST" action="${pageContext.request.contextPath}/WriteNewMessageServlet">  
            
            <input type="button" value="Write New" onclick="displayTextArea()">
            
            <input id="showthis" class="hide" style="display:none" type="text" name="userSelected" placeholder="Destinatary" required/>
            
            <textarea id="showthis2" class="hide" style="display:none" placeholder="Write here your message" name="content" maxlength="250" rows="10" cols="100" required></textarea>
            
            <input type="submit" id="showthis3" class="hide" style="display:none" value="Send">
        </form>
                
        <h3>Inbox</h3>
        
        <h4>
            <c:forEach var="receivedMSG" items="${sessionScope.receivedMSG}">
                
                    <form name="submitForm" method="POST" action="${pageContext.request.contextPath}/DeleteMessageServlet" >
                        
                        <input type="text" name="folder" style="display:none" value="Received"/>
                        <input type="text" name="msg" style="display:none" value="${receivedMSG}"/>
                        
                    <!--montar una url con parametros-->
                        <c:url value = "/GetMessageServlet" var = "msgUrl">
                            <c:param name = "selectedMsg" value = "${receivedMSG}"/>
                            <c:param name = "folder" value = "Received"/>
                        </c:url>

                        <a href="${msgUrl}"><c:out value = "${receivedMSG}"/></a>

                        <input type="image" src="https://cdn0.iconfinder.com/data/icons/classic-icons/512/058.png" alt="delete" height="22" width="22" onclick="return confirm('Are you sure you want to delete this message?')">
                    </form>    
            </c:forEach>
        </h4>
        
        <h3>Sent</h3>
        <h4>
            <c:forEach var="sentMSG" items="${sessionScope.sentMSG}">
                <form name="submitForm" method="POST" action="${pageContext.request.contextPath}/DeleteMessageServlet" >
                        
                        <input type="text" name="folder" style="display:none" value="Sent"/>
                        <input type="text" name="msg" style="display:none" value="${sentMSG}"/>
                        
                                            <!--montar una url con parametros-->
                        <c:url value = "/GetMessageServlet" var = "msgUrl">
                            <c:param name = "selectedMsg" value = "${sentMSG}"/>
                            <c:param name = "folder" value = "Sent"/>
                        </c:url>

                        <a href="${msgUrl}"><c:out value = "${sentMSG}"/></a>
                        
                        <input type="image" src="https://cdn0.iconfinder.com/data/icons/classic-icons/512/058.png" alt="delete" height="22" width="22" onclick="return confirm('Are you sure you want to delete this message?')">
                    </form>
            </c:forEach>
        </h4>
        <script>
            function displayTextArea() {
                var selectedobj = document.getElementById('showthis');
                var selectedobj2 = document.getElementById('showthis2');
                var selectedobj3 = document.getElementById('showthis3');

                if (selectedobj.className == 'hide') {  //check if classname is hide 
                    selectedobj.style.display = "block";
                    selectedobj2.style.display = "block";
                    selectedobj3.style.display = "block";

                    selectedobj.className = 'show';
                    selectedobj2.className = 'show';
                    selectedobj3.className = 'show';
                } else {
                    selectedobj.style.display = "none";
                    selectedobj2.style.display = "none";
                    selectedobj3.style.display = "none";

                    selectedobj.className = 'hide';
                    selectedobj2.className = 'hide';
                    selectedobj3.className = 'hide';
                }
            }
        </script>
    </body>
</html>
