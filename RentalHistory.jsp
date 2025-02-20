<%-- 
    Document   : RentalHistory
    Created on : Feb 19, 2025, 6:49:36 PM
    Author     : HP
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.RoomRentalHistory" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lịch Sử Thuê Phòng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4 text-success">Lịch Sử Thuê Phòng</h2>

        <form action="rental-history" method="GET" class="d-flex justify-content-center mb-4">
            <input type="number" name="roomId" class="form-control w-25 me-2" placeholder="Nhập ID Phòng" required>
            <button type="submit" class="btn btn-primary">Xem Lịch Sử</button>
        </form>

        <div class="table-responsive">
            <table class="table table-bordered table-hover shadow">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Người Thuê</th>
                        <th>Ngày Bắt Đầu</th>
                        <th>Ngày Kết Thúc</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<RoomRentalHistory> historyList = (List<RoomRentalHistory>) request.getAttribute("historyList");
                        if (historyList != null && !historyList.isEmpty()) {
                            for (RoomRentalHistory history : historyList) {
                    %>
                    <tr>
                        <td><%= history.getHistoryId() %></td>
                        <td><%= history.getTenantId() %></td>
                        <td><%= history.getStartDate() %></td>
                        <td><%= history.getEndDate() %></td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="4" class="text-center text-danger">Không có dữ liệu</td>
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

