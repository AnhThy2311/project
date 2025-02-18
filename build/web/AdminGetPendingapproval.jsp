<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.AdminPending" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Listings</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="mb-4 text-primary">Room Listings</h2>
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Email</th>
                        <th>Full Name</th>
                        <th>Image</th>
                        <th>Room Name</th>
                        <th>Price</th>
                        <th>Number House</th>
                        <th>Street</th>
                        <th>Ward</th>
                        <th>District</th>
                        <th>City</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        ArrayList<AdminPending> list = (ArrayList<AdminPending>) request.getAttribute("list");
                        if (list != null && !list.isEmpty()) {
                            for (AdminPending room : list) { 
                    %>
                    <tr>
                        <td><%= room.email %></td>
                        <td><%= room.fullname %></td>
                        <td>
                            <img src="${pageContext.request.contextPath}/images/<%= room.image %>" alt="Room Image" width="80" height="80" class="rounded">
                        </td>
                        <td><%= room.roomName %></td>
                        <td><%= String.format("$%.2f", room.price) %></td>
                        <td><%= room.numberHouse %></td>
                        <td><%= room.street %></td>
                        <td><%= room.ward %></td>
                        <td><%= room.district %></td>
                        <td><%= room.city %></td>
                        <td>
                            <div class="d-flex gap-2">
                                <form action="AdminApprovalServlet" method="get">
                                    <input type="hidden" name="positionId" value="<%= room.getPositionId() %>">
                                    <button type="submit" name="action" value="accept" class="btn btn-success btn-sm">Accept</button>
                                </form>
                                <form action="AdminApprovalServlet" method="post">
                                    <input type="hidden" name="positionId" value="<%= room.positionId %>">
                                    <button type="submit" name="action" value="cancel" class="btn btn-danger btn-sm">Cancel</button>
                                </form>
                            </div>
                        </td>

                    </tr>
                    <% 
                            } 
                        } else { 
                    %>
                    <tr>
                        <td colspan="11" class="text-center text-danger">No rooms available</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    </body>
</html>
