<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="model.BookingRoom" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách hợp đồng phòng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center">Danh sách Hợp đồng Phòng</h2>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>TT</th>
                        <th>Hợp đồng phòng</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        ArrayList<BookingRoom> list = (ArrayList<BookingRoom>) request.getAttribute("list");
                        if (list != null && !list.isEmpty()) {
                            int index = 1;
                            for (BookingRoom br : list) { 
                    %>
                    <tr>
                        <td><%= index++ %></td>
                        <td>
                            <a href="OwnerDetailContract?user_id=<%= br.getUser_id() %>" class="text-decoration-none text-dark">
                                <%= br.getRoom().getRoomName() %>
                            </a>
                        </td>

                    </tr>
                    <% 
                            } 
                        } else { 
                    %>
                    <tr>
                        <td colspan="2" class="text-center">Không có hợp đồng nào</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
