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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Welcome Messages</title>

    <form method="link" action="${pageContext.request.contextPath}/logOut">
        <input type="submit" class="btn btn-danger btn-lg" value="Logout"/>
    </form>
</head>

<body>
    <h1>Messages ${sessionScope.user}</h1>


    <div class="btn-group">
  

            <input type="button" class="btn btn-primary btn-lg" value="Write New" onclick="displayTextArea();characterCount();">
                    
            <div id="showthis" class="hide" style="display:none; margin-left: 1em;">
                <form accept-charset="UTF-8" method="POST" action="${pageContext.request.contextPath}/WriteNewMessageServlet" class="form-group">
                    
                <input class="form-control" type="text" name="userSelected" placeholder="Destinatary" required>

                <textarea id="content" class="form-control"  placeholder="Write here your message" name="content" maxlength="250" rows="10" cols="100" required></textarea>
                
                <h6 class="pull-right" id="count_message"></h6>
                
                <input type="submit" class="btn btn-info" value="Send">
                </form>
            </div>

    </div>

    <div class="btn-group">
        <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">INBOX</button>
        <div class="dropdown-menu">
            <c:forEach var="receivedMSG" items="${sessionScope.receivedMSG}">

                <form name="submitForm" method="POST" action="${pageContext.request.contextPath}/DeleteMessageServlet" >

                    <input type="text" name="folder" style="display:none" value="Received"/>
                    <input type="text" name="msg" style="display:none" value="${receivedMSG}"/>

                    <!--montar una url con parametros-->
                    <c:url value = "/GetMessageServlet" var = "msgUrl">
                        <c:param name = "selectedMsg" value = "${receivedMSG}"/>
                        <c:param name = "folder" value = "Received"/>
                    </c:url>

                    <span class="dropdown-item">
                        <a  href="${msgUrl}">${receivedMSG}</a>
                        <input type="image" src="https://cdn0.iconfinder.com/data/icons/classic-icons/512/058.png" alt="delete" height="22" width="22" onclick="return confirm('Are you sure you want to delete this message?')">
                    </span>


                </form>    
            </c:forEach>
        </div>
    </div>



    <div class="btn-group">
        <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SENT</button>
        <div class="dropdown-menu">
            <c:forEach var="sentMSG" items="${sessionScope.sentMSG}">
                <form name="submitForm" method="POST" action="${pageContext.request.contextPath}/DeleteMessageServlet" >

                    <input type="text" name="folder" style="display:none" value="Sent"/>
                    <input type="text" name="msg" style="display:none" value="${sentMSG}"/>

                    <!--montar una url con parametros-->
                    <c:url value = "/GetMessageServlet" var = "msgUrl">
                        <c:param name = "selectedMsg" value = "${sentMSG}"/>
                        <c:param name = "folder" value = "Sent"/>
                    </c:url>


                    <span class="dropdown-item">
                        <a href="${msgUrl}">${sentMSG}</a>
                        <input type="image" src="https://cdn0.iconfinder.com/data/icons/classic-icons/512/058.png" alt="delete" height="22" width="22" onclick="return confirm('Are you sure you want to delete this message?')">
                    </span>
                </form>
            </c:forEach>
        </div>
    </div>

    <script>
        function displayTextArea() {
            var selectedobj = document.getElementById('showthis');

            if (selectedobj.className == 'hide') {  //check if classname is hide 
                selectedobj.style.display = "block";

                selectedobj.className = 'show';
            } else {
                selectedobj.style.display = "none";

                selectedobj.className = 'hide';
            }
        }
        function characterCount() {
            var text_max = 250;
            $('#count_message').html(text_max + ' remaining');

            $('#content').keyup(function () {
                var text_length = $('#content').val().length;
                var text_remaining = text_max - text_length;

                $('#count_message').html(text_remaining + ' remaining');
            });
        }
    </script>    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
