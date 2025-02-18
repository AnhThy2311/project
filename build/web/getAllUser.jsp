<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-4">
            <h1 class="mb-4 text-center">Admin List</h1>
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Full Name</th>
                        <th>Date of Birth</th>
                        <th>Image</th>
                        <th>Action</th>
                        <th>State</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        ArrayList<Customer> list = (ArrayList<Customer>) request.getAttribute("list");
                        SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd");
                        SimpleDateFormat sdfOutput = new SimpleDateFormat("dd/MM/yyyy");

                        if (list != null && !list.isEmpty()) {
                            for (Customer admin : list) { 
                    %>
                    <tr>
                        <td><%= admin.getEmail() %></td>
                        <td><%= admin.getPhone() %></td>
                        <td><%= admin.getFullName() %></td>
                        <td>
                            <% 
                                String dateStr = admin.getBirthDate();
                                if (dateStr != null && !dateStr.isEmpty()) {
                                    try {
                                        Date date = sdfInput.parse(dateStr);
                                        out.print(sdfOutput.format(date));
                                    } catch (Exception e) {
                                        out.print("Invalid Date");
                                    }
                                } else {
                                    out.print("N/A");
                                }
                            %>
                        </td>
                        <td>
                            <% if (admin.getImage() != null && !admin.getImage().isEmpty()) { %>
                            <img src="${pageContext.request.contextPath}/images/<%= admin.getImage() %>" alt="Admin Image" class="img-thumbnail" style="width: 80px; height: 80px;">
                            <% } else { %>
                            <span>No Image</span>
                            <% } %>
                        </td>
                        <td>
                            <form action="UnanBlockServlet" method="get" style="display:inline;">
                                <input type="hidden" name="email" value="<%= admin.getEmail() %>">
                                <input type="hidden" name="action" value="block">
                                <button type="submit" class="btn btn-danger btn-sm">Block</button>
                            </form>

                            <form action="UnanBlockServlet" method="post" style="display:inline; margin-left:5px;">
                                <input type="hidden" name="email" value="<%= admin.getEmail() %>">
                                <input type="hidden" name="action" value="unlock">
                                <button type="submit" class="btn btn-success btn-sm">Unlock</button>
                            </form>
                        </td>
                        <td>
                            <% if (admin.getState() == 1) { %>
                            <span class="text-success">Unlock</span>
                            <% } else { %>
                            <span class="text-danger">Block</span>
                            <% } %>
                        </td>
                    </tr>
                    <% 
                            } 
                        } else { 
                    %>
                    <tr>
                        <td colspan="7" class="text-center">No admins found.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
