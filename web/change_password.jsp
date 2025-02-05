<%-- 
    Document   : change_password
    Created on : Feb 5, 2025, 3:02:15 PM
    Author     : son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <div class="change-password-container">
            <h2>Change Password</h2>
            <form action="ResertPassword" method="post">
                <input type="email" name="email" value="<%= request.getParameter("email") %>" readonly>
                <input type="password" name="newPassword" placeholder="Enter new password" required>
                <input type="password" name="confirmPassword" placeholder="Confirm new password" required>
                <button type="submit">Change Password</button>
            </form>
        </div>
    </body>
</html>
