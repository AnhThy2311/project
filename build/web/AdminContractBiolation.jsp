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
                        <a class="nav-link active" href="Admin.jsp" style="padding-left: 20px"
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
        <div class="container mt-5">
            <h2 class="text-center">Danh sách Hợp đồng Phòng</h2>
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>TT</th>
                        <th>Hợp đồng phòng</th>
                        <th>Ngày Bắt Đầu </th>
                        <th>Ngày Kết Thúc</th>
                        <th>Thời hạn </th>
                        <th>Xử lý </th>
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
                            <a href="OwnerDetailContract?user_id=<%= br.getUser_id() %>" class="text-decoration-none text-dark">
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
                            <div class="d-flex gap-2">
                                <!-- Form xác nhận vi phạm hợp đồng -->
                                <form action="HandleContractViolationServlet" method="get">
                                    <input type="hidden" name="booking_id" value="<%= br.getBooking_id() %>">
                                    <input type="hidden" name="room_id" value="<%= br.getRoom().getRoomId() %>">
                                    <input type="hidden" name="action" value="confirm">
                                    <button type="submit" class="btn btn-success btn-sm">Đồng ý</button>
                                </form>

                                <!-- Form hủy thao tác -->
                                <form action="HandleContractViolationServlet" method="post">
                                    <input type="hidden" name="booking_id" value="<%= br.getBooking_id() %>">
                                    <input type="hidden" name="action" value="cancel">
                                    <button type="submit" class="btn btn-secondary btn-sm">Hủy</button>
                                </form>
                            </div>
                        </td>

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
    </body>
</html>
