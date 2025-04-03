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
        <!-- At the end of the body section -->
        <title>Room Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <!-- In the head section -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <%
                                      HttpSession sessionUser = request.getSession(false); // Không tạo session mới nếu chưa tồn tại
                                     int userRole = (sessionUser != null && sessionUser.getAttribute("state") != null) 
              ? (int) sessionUser.getAttribute("state") 
              : -1; // Mặc định -1 nếu không có giá trị
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
                        <a href="RoomServlet" class="navbar-brand">
                            <img
                                src="https://static.muonnha.com.vn/images/logo.png?w=384&p=100"
                                alt="Muôn Nhà"
                                width="160"
                                height="46"
                                />
                        </a>
                        <a class="nav-link active" href="RoomServlet" style="padding-left: 20px"
                           >Trang Chủ</a
                        >
                    </div>
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
                    <% if (userRole == 3) { %>
                    <div class="dropdown">
                        <button class="btn btn-outline-secondary dropdown-toggle me-2" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                            Quản lý hợp đồng
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <li>
                                <a class="dropdown-item" href="OwnerListContractCustomer">DS hợp đồng cho thuê</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="OwnerBookingRoom">DS  phê duyệt cho thuê</a>
                            </li>
                        </ul>
                    </div>
                    <% } %>
                    <!-- Các nút đăng ký, đăng nhập, đăng tin -->
                    <% 
    if (username != null) { 
                    %>
                    <div class="dropdown">
                        <img class="avatar rounded-circle me-2"
                             src="${pageContext.request.contextPath}/images/<%= userImage %>"
                             alt="Ảnh đại diện tài khoản" width="33" height="33" />
                        <button class="btn btn-outline-secondary dropdown-toggle me-2" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                            <%= username %>
                        </button>

                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <li><a class="dropdown-item" href="ChangePassword.jsp">Đổi mật khẩu</a></li>
                            <li><a class="dropdown-item" href="Profile">Thông tin</a></li>
                            <li> <a class="dropdown-item" href="Logout.jsp">
                                    Đăng xuất
                                </a></li>
                        </ul>
                        <a href="WalletServlet">
                            <button class="btn btn-outline-secondary me-2">ví</button>
                        </a>
                        <a href="RoomAppointmentServlet">
                            <button class="btn btn-outline-secondary me-2">Lịch Xem Phòng</button>
                        </a>


                        <%
        if (userRole == 3) {
                        %>
                        <a  href="OwnerRoomAppointment" class="btn btn-outline-danger me-2"> Lịch Đặt Xem Phòng</a>
                        <a  href="GetPostRooms?email=<%=username%>" class="btn btn-outline-danger me-2">Đăng tin</a>

                        <%
                                } else if(userRole==2){
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
            <a href="GetCustomerExten" class="btn btn-primary">Danh Sách gia hạn hợp đồng</a>

            <h2 class="text-center">Danh sách Hợp đồng Phòng</h2>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>TT</th>
                        <th>Hợp đồng phòng</th>
                        <th>Ngày Bắt Đầu </th>
                        <th>Ngày Kết Thúc</th>
                        <th>Thời hạn </th>
                        <th>Tố cáo </th>
                        <th>Trạng thái tố cáo </th>
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
                           <a href="OwnerDetailContract?user_id=<%= br.getUser_id() %>&roomId=<%= br.getRoom().getRoomId()%>" class="text-decoration-none text-dark">

                                <%= br.getRoom().getRoomName() %>
                            </a>
                        </td>
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
                            <form action="ContractViolationServlet" method="get">
                                <input type="hidden" name="booking_id" value="<%= br.getBooking_id() %>">
                                <button type="submit" class="btn btn-danger btn-sm">Vi phạm hợp đồng</button>
                            </form>
                        </td>
                        <% if (br.getStatus().equals("5")) { %>
                        <th>Chờ kết quả</th>
                            <% } else { %>
                        <th>Không có</th>
                            <% } %>

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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/your_code.js" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>
</html>
