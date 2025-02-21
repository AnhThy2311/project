<%-- 
    Document   : RoomAppointment
    Created on : Feb 19, 2025, 3:58:52 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.RoomAppointment" %>
<%@ page import="model.Room" %>


<!DOCTYPE html>
<html>
<head>
    <title>Room Appointments</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%@ include file="./Header.jsp" %>
<div class="container mt-5">
    <h2 class="text-center">Room Appointments</h2>
    
    <%-- Lấy danh sách cuộc hẹn từ request --%>
    <%
        List<RoomAppointment> list_appointment = (List<RoomAppointment>) request.getAttribute("list_appointment");
        if (list_appointment != null && !list_appointment.isEmpty()) {
    %>

    <table class="table table-bordered mt-4">
        <thead>
            <tr>
                <th>Appointment ID</th>
                <th>View Date</th>
                <th>Status</th>
                <th>Room Name</th>
                <th>Customer Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% for (RoomAppointment appointment : list_appointment) { %>
                <tr>  
                    <td><%= appointment.getAppointmentId() %></td>
                    <td><%= appointment.getViewDate() %></td>
                    <td><%= appointment.getStatus() == 1 ? "Confirmed" : "Pending" %></td>
                    <td><%= appointment.getRoom().getRoomName() %></td>
                    <td><%= appointment.getRoom().getCustomer().getFullName() %></td>
                    <td>
                        <form action="RoomAppointmentServlet?COMMAND=DELETE_APPOINTMENT" method="post">
                            <input type="hidden" name="roomId" value="<%= appointment.getRoom().getRoomId() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <% } else { %>
        <p class="text-center text-muted">No appointments found.</p>
    <% } %>

</div>

</body>
</html>
