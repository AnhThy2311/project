<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.RoomAppointment"%>
<%@page import="model.Customer"%>
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
        <link rel="stylesheet" href="css/dau.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>
    <body>
        <%
                                      HttpSession sessionUser = request.getSession(false); // Không tạo session mới nếu chưa tồn tại
                                      String username = (sessionUser != null) ? (String) sessionUser.getAttribute("email") : null;
                                      String userImage = (sessionUser != null && sessionUser.getAttribute("userImage") != null) 
                                          ? (String) sessionUser.getAttribute("userImage") 
                                          : "default_user.jpg"; // Mặc định nếu không có ảnh
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
                        <a href="RoomAppointmentServlet">
                            <button class="btn btn-outline-secondary me-2">Lịch xem Phòng</button>
                        </a>
                        <a href="ChangePassword.jsp">
                            <button class="btn btn-outline-secondary me-2">Thay Đổi mật khẩu</button>
                        </a>
                        <a href="Profile">
                            <button class="btn btn-outline-secondary me-2">Thông tin</button>
                        </a>
                        <a href="Logout.jsp">
                            <button class="btn btn-outline-secondary me-2">Logout</button>
                        </a>
                        <%
    Integer state = (Integer) session.getAttribute("state");

        if (state == 3) {
                        %>
                        <a  href="GetPostRooms?email=<%=username%>" class="btn btn-outline-danger me-2">Xem Lịch Đặt Phòng</a>
                        <a  href="GetPostRooms?email=<%=username%>" class="btn btn-outline-danger me-2">Đăng tin</a>

                        <%
                                } else if(state==2){
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

        <div class="bg-gradient-to-r from-blue-100 to-blue-300 flex items-center justify-center min-h-screen">
            <div class="container mx-auto bg-white shadow-lg rounded-lg p-6">
                <h1 class="text-center text-2xl font-bold mb-4 text-gray-800">Danh Sách Khách Hàng Đặt Phòng</h1>
                <div class="overflow-x-auto">
                    <table class="min-w-full bg-white border border-gray-200">
                        <thead>
                            <tr class="bg-gray-800 text-white">
                                <th class="py-2 px-4 border-b">ID</th>
                                <th class="py-2 px-4 border-b">Tên Khách Hàng</th>
                                <th class="py-2 px-4 border-b">Email</th>
                                <th class="py-2 px-4 border-b">Ngày</th>
                                <th class="py-2 px-4 border-b">Tên Phòng</th>
                                <th class="py-2 px-4 border-b">Trạng Thái</th>
                                <th class="py-2 px-4 border-b">Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd"); %>
                            <% SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy"); %>
                            <% ArrayList<RoomAppointment> list = (ArrayList<RoomAppointment>) request.getAttribute("list"); %>
                            <% if (list != null && !list.isEmpty()) { %>
                            <% for (RoomAppointment ra : list) { %>
                            <% Customer customer = ra.getCustomer(); %>
                            <% String statusText = (ra.getStatus() == 0) ? "Đang Chờ" : (ra.getStatus() == 1) ? "Đã Xác Nhận" : "Đã Hủy"; %>
                            <% String formattedDate = "N/A"; %>
                            <% try { %>
                            <% if (ra.getViewDate() != null && !ra.getViewDate().isEmpty()) { %>
                            <% Date viewDate = inputFormat.parse(ra.getViewDate()); %>
                            <% formattedDate = outputFormat.format(viewDate); %>
                            <% } %>
                            <% } catch (Exception e) { %>
                            <% formattedDate = "Invalid date"; %>
                            <% } %>
                            <tr class="<%= (ra.getStatus() == 0) ? "bg-gray-50" : "bg-white" %>">
                                <td><%= ra.getAppointmentId() %></td>
                                <td><%= (customer != null) ? customer.getFullName() : "Không có dữ liệu" %></td>
                                <td><%= (customer != null) ? customer.getEmail() : "Không có dữ liệu" %></td>
                                <td><%= formattedDate %></td>
                                <td><%= ra.getRoom().getRoomName() %></td>
                                <td class="<%= (ra.getStatus() == 1) ? "text-green-500" : (ra.getStatus() == 2) ? "text-red-500" : "text-yellow-500" %>"><%= statusText %></td>
                                <td>
                                    <% if (ra.getStatus() == 0) { %>
                                    <form action="ApproveAppointmentServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="appointmentId" value="<%= ra.getAppointmentId() %>">
                                        <button name="approve" type="submit" class="bg-green-500 text-white px-2 py-1 rounded">Chấp Nhận</button>
                                    </form>
                                    <form action="ApproveAppointmentServlet" method="get" style="display:inline;">
                                        <input type="hidden" name="appointmentId" value="<%= ra.getAppointmentId() %>">
                                        <button name="reject" type="submit" class="bg-red-500 text-white px-2 py-1 rounded">Hủy</button>
                                    </form>
                                    <% } %>
                                </td>
                            </tr>
                            <% } %>
                            <% } else { %>
                            <tr>
                                <td colspan="7" class="text-center py-4">Không có đặt phòng nào.</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <div class="text-center mt-4">
                    <a href="dashboard.jsp" class="bg-blue-500 text-white px-4 py-2 rounded" name="back">Quay lại</a>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
