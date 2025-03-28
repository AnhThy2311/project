<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PostRooms"%>
<%
    PostRooms pr = (PostRooms) request.getAttribute("pr");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập Nhật Chi Tiết Phòng</title>
    </head>
    <body>
        <h1>Cập Nhật Chi Tiết Phòng</h1>
        <% if (pr != null) { %>
        <form action="UpdatePostRoomServlet" method="post" enctype="multipart/form-data">
            <!-- Truyền id ẩn để cập nhật đúng phòng -->
            <input type="hidden" name="id" value="<%= pr.getId() %>">

            <label for="room_name">Tên phòng:</label>
            <input type="text" id="room_name" name="room_name" value="<%= pr.getRoom_name() %>" required><br><br>

            <label for="price">Giá phòng:</label>
            <input type="number" id="price" name="price" value="<%= pr.getPrice() %>" step="0.01" min="0" pattern="[0-9]+([.][0-9]+)?" required>

            <p><strong>Địa Chỉ:</strong> <%= pr.getNumber_house() %>, <%= pr.getStreet() %>, <%= pr.getWard() %>, <%= pr.getDistrict() %>, <%= pr.getCity() %></p>
            <label for="image">Cập nhật hình ảnh:</label>
            <input type="file" id="image" name="image"><br><br>

            <p><strong>Ảnh hiện tại:</strong></p>
            <img src="${pageContext.request.contextPath}/images/<%= pr.getImage() %>" alt="Hình ảnh phòng" width="300" height="200"><br><br>

            <input type="submit" value="Cập Nhật">
        </form>
        <% } else { %>
        <p>Không tìm thấy thông tin phòng.</p>
        <% } %>
    </body>
</html>
