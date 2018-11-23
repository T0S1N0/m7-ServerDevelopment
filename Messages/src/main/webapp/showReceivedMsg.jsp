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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="CustomStyles/styles.css" type="text/css">
        <style>*{font-size: 20px;}</style>
        <title>MessageReceived</title>
    </head>
    
    <body style="background-color: grey;">
        <h1 class=" text-center py-3" style="color: white;">INBOX</h1>
        <div class="form-group" style="width: 40%; margin-left: 30%;">
            <label for="username"><b>FROM:</b></label>
            <input class="form-control" id="username" type="text" value="${requestScope.user}" readonly>

            <label for="date"><b>DATE:</b></label>
            <input class="form-control" id="date" type="text" value="${requestScope.date}" readonly>

            <label for="content"><b>CONTENT:</b></label>
            <textarea  id="content" class="form-control" rows="10" readonly>${requestScope.msgContent}</textarea>

        </div>
            <input type="button" class="btn btn-primary btn-lg" value="Reply" onclick="displayTextArea();characterCount();" style="width: 20%; text-align: center; margin-left: 40%;  margin-bottom: 1%;">
            <div id="showthis" class="hide" style="display:none; margin-left: 25%; margin-bottom: 5%; width: 50%;">
                <form accept-charset="UTF-8" method="POST" action="${pageContext.request.contextPath}/WriteNewMessageServlet" class="form-group">

                    <input class="form-control" type="text" name="userSelected" style="display: none;" value="${requestScope.user}">

                    <textarea id="content" class="form-control"  placeholder="Write here your message" name="content" maxlength="250" rows="7" cols="30" required></textarea>

                    <h6 class="pull-right" id="count_message"></h6>

                    <input type="submit" class="btn btn-info" value="Send">
                </form>
            </div>


        <c:url value = "/welcomePage.jsp" var = "back"></c:url>
           <footer class="footer">
                <div>
                    <a href="${back}"><b>GO BACK</b></a>
                </div>
            </footer>

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
