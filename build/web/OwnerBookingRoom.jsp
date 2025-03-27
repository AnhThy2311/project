<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BookingRoom"%>
<%@page import="model.Customer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
    ArrayList<BookingRoom> list = (ArrayList<BookingRoom>) request.getAttribute("list");
      SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>
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
    </head>
    <body>
        <%
                                       HttpSession sessionUser = request.getSession(false); // Không tạo session mới nếu chưa tồn tại
                                       String username = (sessionUser != null) ? (String) sessionUser.getAttribute("email") : null;
                                       String userImage = (sessionUser != null && sessionUser.getAttribute("userImage") != null) 
                                           ? (String) sessionUser.getAttribute("userImage") 
                                           : "default_user.jpg"; // Mặc định nếu không có ảnh
                                        
Integer state = (Integer) session.getAttribute("state");
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
                        <% if (state == 3) { %>
                        <a href="OwnerBookingRoom">
                            <button class="btn btn-outline-secondary me-2">DS cho thuê</button>
                        </a>
                        <% } %>
                        <% 
     if (username != null) { 
                        %>
                        <img class="avatar rounded-circle me-2"
                             src="${pageContext.request.contextPath}/images/<%= userImage %>" 
                             alt="Ảnh đại diện tài khoản" width="33" height="33" />
                        <span class="me-2"><%= username %></span>
                        <a href="WalletServlet">
                            <button class="btn btn-outline-secondary me-2">wallet</button>
                        </a>
                        <a href="RoomAppointmentServlet">
                            <button class="btn btn-outline-secondary me-2">Room View Schedule</button>
                        </a>
                        <a href="ChangePassword.jsp">
                            <button class="btn btn-outline-secondary me-2">Change Password</button>
                        </a>
                        <a href="Profile">
                            <button class="btn btn-outline-secondary me-2">Profile</button>
                        </a>
                        <a href="Logout.jsp">
                            <button class="btn btn-outline-secondary me-2">Logout</button>
                        </a>
                        <%
   

        if (state == 3) {
                        %>
                        <a  href="OwnerRoomAppointment" class="btn btn-outline-danger me-2"> Lịch Đặt Xem Phòng</a>
                        <a  href="GetPostRooms?email=<%=username%>" class="btn btn-outline-danger me-2">Đăng tin</a>

                        <%
                                } else if(state==2){
                        %>
                        <a class="btn btn-outline-danger me-2" href="Ugradeaccount.jsp">Nâng cấp tài khoản</a>
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
        <div class="bg-gradient-to-r from-blue-100 to-blue-200 flex items-center justify-center min-h-screen">

            <div class="container mt-5">
                <h1 class="text-center">Danh Sách Phê Duyệt Thuê Phòng</h1>
                <div class="overflow-x-auto">
                    <table class="min-w-full bg-white border border-gray-300 rounded-lg">
                        <thead class="bg-blue-500 text-white">
                            <tr>
                                <th class="py-2 px-4 border-b">Họ và Tên</th>
                                <th class="py-2 px-4 border-b">Tên Phòng</th>
                                <th class="py-2 px-4 border-b">Ngày thuê</th>
                                <th class="py-2 px-4 border-b">Ngày kết thúc</th>
                                <th class="py-2 px-4 border-b">Giá</th>
                                <th class="py-2 px-4 border-b">Trạng thái</th>
                                <th class="py-2 px-4 border-b">Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (list != null && !list.isEmpty()) { %>
                            <% for (BookingRoom br : list) { %>
                            <tr class="bg-gray-100 text-gray-800">
                               
                                <td class="py-2 px-4 border-b"><%= br.getCustomer().getFullName() %></td>
                                <td class="py-2 px-4 border-b"><%= br.getRoomName() %></td>
                                <td class="py-2 px-4 border-b"><%= sdf.format(java.sql.Date.valueOf(br.getDate())) %></td>
                                <td class="py-2 px-4 border-b"><%= sdf.format(java.sql.Date.valueOf(br.getEnd_date())) %></td>
                                <td class="py-2 px-4 border-b"><%=br.getTotalPrice() %></td>
                                <td class="py-2 px-4 border-b">
                                    <% if (br.getStatus().equals("0")) { %>
                                    Chưa giải quuyết
                                    
                                <td class="py-2 px-4 border-b">
                                    <form action="BookingActionServlet" method="get" style="display:inline-block;">
                                        <input type="hidden" name="idRooom" value="<%=br.getRoom_id() %>">
                                        <input type="hidden" name="totalPrice" value="<%=br.getTotalPrice() %>">
                                        <input type="hidden" name="email_customer" value="<%= br.getCustomer().getEmail() %>">
                                        <input type="hidden" name="action" value="accept">
                                        <button type="submit" class="bg-green-500 text-white py-1 px-3 rounded hover:bg-green-600">Chấp nhận</button>
                                    </form>
                                    <form action="BookingActionServlet" method="post" style="display:inline-block;">
                                        <input type="hidden" name="idRooom" value="<%=br.getRoom_id() %>">
                                        <input type="hidden" name="totalPrice" value="<%=br.getTotalPrice() %>">
                                        <input type="hidden" name="email_customer" value="<%= br.getCustomer().getEmail() %>">
                                        <input type="hidden" name="action" value="reject">
                                        <button type="submit" class="bg-red-500 text-white py-1 px-3 rounded hover:bg-red-600">Từ chối</button>
                                    </form>
                                </td>
                                <% } else if(br.getStatus().equals("2")) {%>
                                từ chối
                                <% } %>
                                </td>

                            </tr>
                            <% } %>
                            <% } else { %>
                            <tr>
                                <td colspan="7" class="text-center">No pending bookings found.</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>  
    </body>
</html>
