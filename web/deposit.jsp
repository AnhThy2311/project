<%-- 
    Document   : deposit
    Created on : Feb 27, 2025, 11:22:36 PM
    Author     : admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="database.database" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Nạp Tiền Vào Ví</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin: 50px; }
        .container { max-width: 400px; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 10px; }
        input[type="number"], button { width: 100%; padding: 10px; margin: 10px 0; }
        button { background-color: #28a745; color: white; border: none; cursor: pointer; }
        button:hover { background-color: #218838; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Nạp Tiền Vào Ví</h2>
        <form action="vnpay_payment" method="post">
          
            <input type="hidden" id="user_id" name="user_id"  value="<%=request.getParameter("id") %>"required>
            
            <label for="amount">Số tiền (VND):</label>
            <input type="number" id="amount" name="amount" min="10000" step="1000" required>
            <button type="submit">Thanh Toán VNPay</button>
        </form>
    </div>
</body>
</html>

