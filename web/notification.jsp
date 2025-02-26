<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Notification</title>
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
            .notification-container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="notification-container">
            <h2>Notification</h2>
            <p>An email has been sent to: <strong>${email}</strong></p>
            <p>Please return to login page to login after you changed yours account's password</p>
            <a href="index.html">Return to login page</a>
        </div>
    </body>
</html>
