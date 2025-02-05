<%-- 
    Document   : End
    Created on : Feb 5, 2025, 6:06:09 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <div class="container">
            <h2>Edit Profile</h2>
            <form action="UpdateProfileServlet" method="post">
                <label for="fullname">Full Name:</label>
                <input type="text" name="fullname" >

                <label for="phone">Phone:</label>
                <input type="text" name="phone" >

                <label for="birthDate">Date of birth:</label>
                <input type="text" name="birthDate" >

                <button type="submit">Update Profile</button>
            </form>
        </div>
    </body>
</html>
