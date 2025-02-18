<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.PostRooms" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Property List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-4">
            <h1>Property List</h1>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Image</th>
                        <th>Room Name</th>
                        <th>Price</th>
                        <th>Number House</th>
                        <th>Street</th>
                        <th>Ward</th>
                        <th>District</th>
                        <th>City</th>
                        <th>Status</th>
                        <th>Cancel</th> 
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<PostRooms> list = (ArrayList<PostRooms>) request.getAttribute("list");
                        for(PostRooms property : list) {
                    %>
                    <tr>
                        <td><%= property.getId() %></td>
                        <td><img src="${pageContext.request.contextPath}/images/<%= property.getImage() %>" alt="Property Image" width="100" height="100"></td>
                        <td><%= property.getRoom_name() %></td>
                        <td><%= property.getPrice() %></td>
                        <td><%= property.getNumber_house() %></td>
                        <td><%= property.getStreet() %></td>
                        <td><%= property.getWard() %></td>
                        <td><%= property.getDistrict() %></td>
                        <td><%= property.getCity() %></td>
                        <td>
                            <% 
                                // Kiểm tra giá trị status, nếu là "2" thì hiển thị "Đang duyệt"
                                if ("2".equals(property.getStatus())) {
                                    out.print("Đang duyệt");
                                } else if ("0".equals(property.getStatus())) {
                                    out.print("yêu cầu bị hủy");
                                }
                                   else {
                                    out.print("Hoàn thành");
                                }
                            %>
                        </td>
                        <td>
                            <form method="post" action="cancelProperty">
                                <input type="hidden" name="id" value="<%= property.getId() %>">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn hủy?');">Hủy</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
