<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Quên mật khẩu</title>
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
            .forgot-password-container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .forgot-password-container input {
                width: 90%;
                padding: 10px;
                margin: 10px 0;
                border-radius: 5px;
                border: 1px solid #ccc;
            }
            .forgot-password-container button {
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
        <div class="forgot-password-container">
            <h2>Quên mật khẩu</h2>
            <form action="forgot-password" method="post">
                <input type="email" name="email" placeholder="Nhập email của bạn" required>
                <button type="submit">Gửi</button>
            </form>
        </div>
    </body>
</html>
