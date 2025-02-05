<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Change Password</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f0f0f0;
                margin: 0;
                font-family: Arial, sans-serif;
            }
            .change-password-container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .change-password-container input {
                width: 90%;
                padding: 10px;
                margin: 10px 0;
                border-radius: 5px;
                border: 1px solid #ccc;
            }
            .change-password-container button {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border-radius: 5px;
                border: none;
                background-color: #007bff;
                color: white;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <div class="change-password-container">
            <h2>Change Password</h2>
            <form action="ChangePasswordServlet" method="post">
                <input type="email" name="email" value="<%= request.getParameter("email") %>" readonly>
                <input type="password" name="newPassword" placeholder="Enter new password" required>
                <input type="password" name="confirmPassword" placeholder="Confirm new password" required>
                <button type="submit">Change Password</button>
            </form>
        </div>
    </body>
</html>
