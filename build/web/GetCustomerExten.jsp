<%-- 
    Document   : GetCustomerExten
    Created on : Mar 22, 2025, 2:46:23 AM
    Author     : son
--%>
<%@page import="model.BookingRoom" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                width="100"
                                height="46"
                                />
                        </a>
                        <a class="nav-link active" href="RoomServlet" style="padding-left: 20px"
                           >Trang chủ</a
                        >
                    </div>

                    <!-- Các nút đăng ký, đăng nhập, đăng tin -->
                    <div class="d-flex align-items-center">
                        <% if (username != null) { %>
                        <!-- Messenger Dropdown -->
                        <div class="dropdown d-none d-lg-block">
                            <button type="button" class="btn btn-light border-0 d-flex align-items-center dropdown-toggle"
                                    data-bs-toggle="dropdown" aria-expanded="false" aria-label="Tin nhắn">
                                <i class="bi bi-chat-dots-fill text-primary fs-4"></i>
                            </button>

                        </div>
                        <% } %>
                        <% if(username == null){ %>
                        <a href="#" class="btn btn-outline-secondary me-2">
                            <i class="bi bi-heart"></i>
                        </a>
                        <% } else { %>
                        <a href="WishListServlet" class="btn btn-outline-secondary me-2">
                            <i class="bi bi-heart"></i>
                        </a>
                        <% } %>
                        <% if (username != null) { %>
                        <a href="ListContractCustomer">
                            <button class="btn btn-outline-secondary me-2">DS hợp đồng thuê</button>
                        </a>

                        <% } %>
                        <% if (state != null && state == 3) { %>
                        <div class="dropdown">
                            <button class="btn btn-outline-secondary dropdown-toggle me-2" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                Quản lý hợp đồng
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li>
                                    <a class="dropdown-item" href="OwnerListContractCustomer">DS hợp đồng cho thuê</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="OwnerBookingRoom">DS cho thuê</a>
                                </li>
                            </ul>
                        </div>
                        <% } %>



                        <% 
     if (username != null) { 
                        %>
                        <img class="avatar rounded-circle me-2"
                             src="${pageContext.request.contextPath}/images/<%= userImage %>" 
                             alt="Ảnh đại diện tài khoản" width="33" height="33" />
                        <span class="me-2"><%= username %></span>
                        <a href="WalletServlet">
                            <button class="btn btn-outline-secondary me-2">ví</button>
                        </a>
                        <a href="RoomAppointmentServlet">
                            <button class="btn btn-outline-secondary me-2">Lịch Xem Phòng</button>
                        </a>
                        <a href="ChangePassword.jsp">
                            <button class="btn btn-outline-secondary me-2">Đổi mật khẩu</button>
                        </a>
                        <a href="Profile">
                            <button class="btn btn-outline-secondary me-2">Thông tin</button>
                        </a>
                        <a href="Logout.jsp">
                            <button class="btn btn-outline-secondary me-2">Đăng xuất</button>
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
        <div class="container mt-5">
            <h2 class="text-center mb-4">Danh sách Hợp đồng Phòng</h2>
            <div class="table-responsive">
                <table class="table table-hover table-bordered text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>Người gia hạn</th>
                            <th>Tên Phòng</th>
                            <th>Ngày Bắt Đầu</th>
                            <th>Ngày Kết Thúc</th>
                            <th>Trạng thái</th>
                            <th>Phê duyệt</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            ArrayList<BookingRoom> list = (ArrayList<BookingRoom>) request.getAttribute("list");
                            if (list != null && !list.isEmpty()) {
                                for (BookingRoom br : list) { 
                        %>
                        <tr>
                            <td><%= br.getCustomer().getFullName() %></td>
                            <td>
                                <a href="#" class="text-decoration-none fw-bold">
                                    <%= br.getRoom().getRoomName() %>
                                </a>
                            </td>
                            <td><%= br.getDate() %></td>
                            <td><%= br.getEnd_date() %></td>
                            <td>
                                <span class="badge bg-info text-dark">Đang xử lý</span>
                            </td>
                            <td>
                                <!-- Form Đồng ý -->
                                <form action="AcceptPenCon" method="get">
                                    <input type="hidden" name="roomId" value="<%= br.getRoom().getRoomId()%>">
                                    <input type="hidden" name="endDate" value="<%= br.getEnd_date() %>">
                                    <input type="hidden" name="booking_id" value="<%= br.getBooking_id() %>">
                                    <input type="hidden" name="price" value="<%= br.getRoom().getPrice() %>">
                                    <button type="submit" name="action" value="accept" class="btn btn-success btn-sm">Đồng ý</button>
                                </form>

                                <!-- Form Từ chối -->
                                <form action="your-servlet-url" method="post">
                                    <input type="hidden" name="roomId" value="<%= br.getRoom().getRoomId()%>">
                                    <input type="hidden" name="endDate" value="<%= br.getEnd_date() %>">
                                    <input type="hidden" name="booking_id" value="<%= br.getBooking_id() %>">
                                    <input type="hidden" name="price" value="<%= br.getRoom().getPrice() %>">
                                    <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm">Từ chối</button>
                                </form>

                            </td>
                        </tr>
                        <% 
                                } 
                            } else { 
                        %>
                        <tr>
                            <td colspan="6" class="text-center text-muted">Không có hợp đồng nào</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>
