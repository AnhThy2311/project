<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="model.BookingRoom" %>
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
            <h2 class="text-center">Danh sách Hợp đồng Phòng</h2>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>TT</th>
                        <th>Hợp đồng phòng</th>
                        <th>Giá Tiền</th>
                        <th>Ngày Bắt Đầu</th>
                        <th>Ngày Kết Thúc</th>
                        <th>Thời gian còn lại</th>
                        <th>Trạng thái</th>
                        <th>Thanh toán</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        ArrayList<BookingRoom> list = (ArrayList<BookingRoom>) request.getAttribute("list");
                        if (list != null && !list.isEmpty()) {
                            int index = 1;
                            for (BookingRoom br : list) { 
                                long daysLeft = br.getDaysLeft();
                    %>
                    <tr>
                        <td><%= index++ %></td>
                        <td>
                            <a href="DetailContract?roomId=<%= br.getRoom().getRoomId() %>" class="text-decoration-none text-dark">
                                <%= br.getRoom().getRoomName() %>
                            </a>
                        </td>
                        <td><%= br.getRoom().getPrice() %></td>
                        <td><%= br.getDate() %></td>
                        <td><%= br.getEnd_date() %></td>
                        <td>
                            <% if (daysLeft > 0) { %>
                            Còn <%= daysLeft %> ngày
                            <% } else { %>
                            Hết hạn
                            <% } %>
                        </td>
                        <td>
                            <% 
                                String status = br.getStatus();
                                if (status.equals("1")) {
                            %>
                            Đang thuê
                            <% 
                                } else if (status.equals("3")) {
                            %>
                            Hết hợp đồng thuê
                            <% 
                                } else if (status.equals("4")) {
                            %>
                            đang đợi gia hạn
                            <% 
                                }else {
                            %>
                            Trạng thái khác
                            <% 
                                }
                            %>
                        </td>
                        <td>
                            <% 
                                String submitted = request.getParameter("submitted");
                                if (daysLeft > -2 && daysLeft <=0 && status.equals("1")) { 
                            %>
                            <!-- Hiển thị nút thanh toán -->
                            <form action="BookingRoom" method="post">
                                <input type="hidden" name="roomId" value="<%= br.getRoom().getRoomId() %>">
                                <input type="hidden" name="endDate" value="<%= br.getEnd_date() %>">
                                <input type="hidden" name="booking_id" value="<%= br.getBooking_id() %>">
                                <input type="hidden" name="price" value="<%= br.getRoom().getPrice() %>">
                                <button type="submit" class="btn btn-warning btn-sm">Gia hạn thêm 1 tháng</button>
                            </form>
                            <% 
                                } else if (daysLeft == -3 && (submitted == null || !"true".equals(submitted))) { 
                            %>
                            <form action="ListContractCustomer?submitted=true" method="post" id="autoSubmitForm">
                                <input type="hidden" name="roomId" value="<%= br.getRoom().getRoomId() %>">
                                <input type="hidden" name="booking_id" value="<%= br.getBooking_id() %>">
                            </form>
                            <script>
                                document.getElementById("autoSubmitForm").submit();
                            </script>
                            <% } %>
                        </td>
                    </tr>
                    <% 
                            } 
                        } else { 
                    %>
                    <tr>
                        <td colspan="6" class="text-center">Không có hợp đồng nào</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
            <script>
                alert("<%= errorMessage %>");
            </script>
            <% } %>
        </div>


    </body>
</html>
