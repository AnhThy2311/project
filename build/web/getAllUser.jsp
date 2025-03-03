<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Muôn Nhà - Kênh thông tin bất động sản</title>
        <!-- Bootstrap CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <!-- Bootstrap Icons -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Material Icons -->
        <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
            rel="stylesheet"
            />
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/dau.css" />
        <script src="https://cdn.tailwindcss.com">
        </script>
    </head>
    <body>
        <%
                                      HttpSession sessionUser = request.getSession(false); // Không tạo session mới nếu chưa tồn tại
                                      String username = (sessionUser != null) ? (String) sessionUser.getAttribute("email") : null;
                                      String userImage = (sessionUser != null && sessionUser.getAttribute("userImage") != null) 
                                          ? (String) sessionUser.getAttribute("userImage") 
                                          : "default_user.jpg"; // Mặc định nếu không có ảnh

    if (username == null) {
        response.sendRedirect("Loggin.jsp"); // Chuyển hướng về trang đăng nhập
        return;
    }
        %>
        <header class="navbar-custom sticky-top">
            <div class="container-fluid">
                <div class="d-flex justify-content-between align-items-center py-2">
                    <!-- Logo và Home -->
                    <div class="d-flex align-items-center">
                        <a href="/" class="navbar-brand">
                            <img
                                src="https://static.muonnha.com.vn/images/logo.png?w=384&p=100"
                                alt="Muôn Nhà"
                                width="160"
                                height="46"
                                />
                        </a>
                        <a class="nav-link active" href="RoomServlet" style="padding-left: 20px"
                           >Home</a
                        >

                        <!-- Thanh tìm kiếm -->
                        <div class="d-none d-md-flex ms-3">
                            <div class="filter__bar pb-2">
                                <div class="w-100">
                                    <div class="d-flex position-relative bg-white">
                                        <!-- Nút tìm theo khu vực -->
                                        <div
                                            data-bs-toggle="offcanvas"
                                            data-bs-target="#offcanvasLocation"
                                            aria-controls="offcanvasLocation"
                                            class="btn__search d-flex align-items-center"
                                            >
                                            <span class="material-icons me-2">location_on</span>
                                            <span
                                                class="fw-normal flex-grow-1 line-clamp-1 text-body"
                                                >
                                                Tìm theo khu vực
                                            </span>
                                        </div>

                                        <!-- Nút bộ lọc -->
                                        <button
                                            type="button"
                                            data-bs-toggle="offcanvas"
                                            data-bs-target="#offcanvasAdvance"
                                            aria-controls="offcanvasAdvance"
                                            class="btn btn__funnel ms-2"
                                            >
                                            <i class="bi-funnel me-1"></i>
                                            <span>Bộ lọc</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Các nút đăng ký, đăng nhập, đăng tin -->
                    <div class="d-flex align-items-center">
                        <% if(username == null){ %>
                        <a href="#" class="btn btn-outline-secondary me-2">
                            <i class="bi bi-heart"></i>
                        </a>
                        <% } else { %>
                        <a href="WishListServlet" class="btn btn-outline-secondary me-2">
                            <i class="bi bi-heart"></i>
                        </a>
                        <% } %>

                        <% 
     if (username != null) { 
                        %>
                        <img class="avatar rounded-circle me-2"
                             src="${pageContext.request.contextPath}/images/<%= userImage %>" 
                             alt="Ảnh đại diện tài khoản" width="33" height="33" />
                        <span class="me-2"><%= username %></span>
                        <a href="Profile">
                            <button class="btn btn-outline-secondary me-2">Thông tin</button>
                        </a>
                        <a href="Logout.jsp">
                            <button class="btn btn-outline-secondary me-2">Logout</button>
                        </a>
                        <%
    Integer state = (Integer) session.getAttribute("state");

        if (state != null) {
                        %>
                        <a  href="GetPostRooms?email=<%=username%>" class="btn btn-outline-danger me-2">Đăng tin</a>

                        <%
                                } else {
                        %>
                        <button class="btn btn-outline-danger me-2">Nâng cấp tài khoản</button>
                        <%
                                }
                            } else { 
                        %>
                        <a href="Register.jsp" class="btn btn-outline-secondary me-2">Đăng ký</a>
                        <a href="Loggin.jsp" class="btn btn-outline-secondary me-2">Đăng nhập</a>
                        <button class="btn btn-outline-danger me-2">Đăng tin</button>
                        <%
                            }
                        %>


                    </div>
                </div>
            </div>
        </header>
        <div class="container mt-4">
            <h1 class="mb-4 text-center" style="font-size: 200%">Admin List</h1>
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
                            <% if (admin.getState() == 1) { %>
                            <!-- Nếu admin đang mở khóa (Unlock), chỉ hiển thị nút Block -->
                            <form action="UnanBlockServlet" method="get" style="display:inline;">
                                <input type="hidden" name="email" value="<%= admin.getEmail() %>">
                                <input type="hidden" name="action" value="block">
                                <button type="submit" class="btn btn-danger btn-sm">Block</button>
                            </form>
                            <% } else { %>
                            <!-- Nếu admin đang bị khóa (Block), chỉ hiển thị nút Unlock -->
                            <form action="UnanBlockServlet" method="post" style="display:inline;">
                                <input type="hidden" name="email" value="<%= admin.getEmail() %>">
                                <input type="hidden" name="action" value="unlock">
                                <button type="submit" class="btn btn-success btn-sm">Unlock</button>
                            </form>
                            <% } %>
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
