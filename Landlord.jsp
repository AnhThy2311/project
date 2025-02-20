<%-- 
    Document   : Landlord
    Created on : Feb 19, 2025, 6:49:07 PM
    Author     : HP
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.Landlord" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh Sách Chủ Nhà</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4 text-primary">Danh Sách Chủ Nhà</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-hover shadow">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>SĐT</th>
                        <th>Email</th>
                        <th>Địa Chỉ</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<Landlord> landlords = (List<Landlord>) request.getAttribute("landlords");
                        if (landlords != null && !landlords.isEmpty()) {
                            for (Landlord landlord : landlords) {
                    %>
                    <tr>
                        <td><%= landlord.getLandlordId() %></td>
                        <td><%= landlord.getFullName() %></td>
                        <td><%= landlord.getPhoneNumber() %></td>
                        <td><%= landlord.getEmail() %></td>
                        <td><%= landlord.getAddress() %></td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="5" class="text-center text-danger">Không có dữ liệu</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <a href="index.jsp" class="btn btn-secondary mt-3">Quay lại Trang Chủ</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

