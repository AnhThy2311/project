<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.RoomAppointment" %>
<%@ page import="model.Room" %>
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
        <link rel="stylesheet" href="css/dau.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
            }
        </style>
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
        <div class="bg-gradient-to-r from-purple-400 via-pink-500 to-red-500 flex items-center justify-center min-h-screen">
            <div class="container mx-auto p-4 bg-white shadow-lg rounded-lg">
                <h1 class="text-4xl font-bold text-center mb-8 text-gray-800" id="appointmentsTitle">Room Appointments</h1>
                <div class="overflow-x-auto">
                    <div class="grid grid-cols-6 bg-blue-500 text-white font-bold text-left p-3">
                        <div name="appointmentIdHeader">Appointment ID</div>
                        <div name="viewDateHeader">View Date</div>
                        <div name="statusHeader">Status</div>
                        <div name="roomNameHeader">Room Name</div>
                        <div name="customerNameHeader">Customer Name</div>
                        <div name="actionHeader">Action</div>
                    </div>
                    <div class="divide-y divide-gray-200">
                        <% ArrayList<RoomAppointment> list_appointment = (ArrayList<RoomAppointment>) request.getAttribute("list_appointment");
                        if (list_appointment != null && !list_appointment.isEmpty()) {
                            for (RoomAppointment appointment : list_appointment) { %>
                        <div class="grid grid-cols-6 p-3 hover:bg-gray-100">
                            <div name="appointmentId" id="appointment<%= appointment.getAppointmentId() %>"><%= appointment.getAppointmentId() %></div>
                            <% String viewDateStr = appointment.getViewDate(); 
                            String formattedDate = "N/A";
                            if (viewDateStr != null && !viewDateStr.isEmpty()) {
                                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
                                SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
                                try {
                                    Date viewDate = inputFormat.parse(viewDateStr);
                                    formattedDate = outputFormat.format(viewDate);
                                } catch (Exception e) {
                                    formattedDate = "Invalid date";
                                }
                            } %>
                            <div name="viewDate" id="date<%= appointment.getAppointmentId() %>"><%= formattedDate %></div>
                            <div name="status" id="status<%= appointment.getAppointmentId() %>" class="<%= appointment.getStatus() == 1 ? "text-green-600 font-medium" : appointment.getStatus() == 2 ? "text-yellow-600 font-medium" : "text-red-600 font-medium" %>">
                                <%= appointment.getStatus() == 1 ? "Confirmed" : appointment.getStatus() == 0 ? "Waiting" : "Cancel" %>
                            </div>
                            <div name="roomName" id="room<%= appointment.getAppointmentId() %>"><%= appointment.getRoom().getRoomName() %></div>
                            <div name="customerName" id="customer<%= appointment.getAppointmentId() %>"><%= appointment.getRoom().getCustomer().getFullName() %></div>
                            <div>
                                <form action="RoomAppointmentServlet?COMMAND=DELETE_APPOINTMENT" method="post">
                                    <input type="hidden" name="roomId" value="<%= appointment.getRoom().getRoomId() %>">
                                    <button name="deleteButton" id="delete<%= appointment.getAppointmentId() %>" type="submit" class="bg-red-500 text-white py-1 px-3 rounded hover:bg-red-600 transition duration-300">Delete</button>
                                </form>
                            </div>
                        </div>
                        <% } } else { %>
                        <p class="text-center text-muted">No appointments found.</p>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>