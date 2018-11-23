<%-- 
    Document   : login
    Created on : 24-oct-2018, 20:35:51
    Author     : mmartin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="CustomStyles/styles.css" type="text/css">
    </head>
    
    <body class="bg">
        <div class="center">
            <h1 style="text-align: center; color: white;">LOGIN TO SEE YOUR MESSAGES</h1>
            <button class="center" onclick="document.getElementById('id01').style.display = 'block'">Login</button>
        </div>
        <div id="id01" class="modal">

            <div class="modal-content animate">
                <div class="imgcontainer">
                    <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                    <img src="http://comic-cons.xyz/wp-content/uploads/Star-Wars-avatar-icon-Darth-Vader.png" alt="Avatar" class="avatar">
                </div>
                <form class="container" method="POST" action="j_security_check">
                    <label for="uname"><b>Username</b></label>
                    <input type="text" placeholder="Enter Username" name="j_username" value="Dani" required>

                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="j_password" value="dani" required>

                    <button type="submit">Login</button>
                    <label>
                        <input type="checkbox" name="remember"> Remember me
                    </label>
                </form>
                <div class="container" style="background-color:#f1f1f1">
                    <button type="button" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn">Cancel</button>
                </div>
            </div>
        </div>

        <script>
            // Get the modal
            var modal = document.getElementById('id01');

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            };
        </script>

    </body>
</html>
