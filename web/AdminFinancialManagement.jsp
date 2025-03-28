<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@page import="model.BookingRoom"%>
<%
    ArrayList<Customer> list = (ArrayList<Customer>) request.getAttribute("list");
     ArrayList<BookingRoom> list1 = (ArrayList<BookingRoom>) request.getAttribute("list1");
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
        <div class="bg-gray-100 p-4">
            <div class="container mx-auto bg-white p-6 rounded-lg shadow-lg">
                <h1 class="text-3xl font-bold mb-6 text-blue-600">Danh sách tài khoản nâng cấp</h1>
                <table class="min-w-full border-collapse border border-gray-400 mb-8">
                    <thead>
                        <tr class="bg-blue-100">
                            <th class="border border-gray-400 px-4 py-2">Email</th>
                            <th class="border border-gray-400 px-4 py-2">Họ và Tên</th>
                            <th class="border border-gray-400 px-4 py-2">Ngày nâng cấp</th>
                            <th class="border border-gray-400 px-4 py-2">Số tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            double totalUpgradeAmount = 0;
                            if (list != null && !list.isEmpty()) { 
                                for (Customer customer : list) { 
                                    double price = customer.getAccount_upgrade().getPrice();
                                    totalUpgradeAmount += price;
                        %>
                        <tr>
                            <td class="border border-gray-400 px-4 py-2"><%= customer.getEmail() %></td>
                            <td class="border border-gray-400 px-4 py-2"><%= customer.getFullName() %></td>
                            <td class="border border-gray-400 px-4 py-2"><%= customer.getAccount_upgrade().getCreate_date() %></td>
                            <td class="border border-gray-400 px-4 py-2"><%= price %></td>
                        </tr>
                        <% 
                                } 
                            } else { 
                        %>
                        <tr>
                            <td class="border border-gray-400 px-4 py-2" colspan="4">Không có dữ liệu</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

                <h2 class="text-2xl font-bold mb-4 text-red-600">Tổng tiền nâng cấp: <%= totalUpgradeAmount %> VNĐ</h2>

                <h1 class="text-3xl font-bold mb-6 text-blue-600">Danh sách Thống kê thuê nhà</h1>
                <table class="min-w-full border-collapse border border-gray-400">
                    <thead>
                        <tr class="bg-blue-100">
                            <th class="border border-gray-400 px-4 py-2">Email</th>
                            <th class="border border-gray-400 px-4 py-2">Họ và Tên</th>
                            <th class="border border-gray-400 px-4 py-2">Tên Phòng</th>
                            <th class="border border-gray-400 px-4 py-2">Ngày bắt đầu thuê</th>
                            <th class="border border-gray-400 px-4 py-2">Số tháng thuê</th>
                            <th class="border border-gray-400 px-4 py-2">Ngày kết thúc thuê</th>
                            <th class="border border-gray-400 px-4 py-2">Tổng tiền</th>
                            <th class="border border-gray-400 px-4 py-2">Tổng tiền admin thu về</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            double totalRentAmount = 0;
                            if (list1 != null && !list1.isEmpty()) { 
                                for (BookingRoom b : list1) { 
                                    double roomPrice = b.getC().getRoom_price();
                                    totalRentAmount += roomPrice;
                        %>
                        <tr>
                            <td class="border border-gray-400 px-4 py-2"><%= b.getCustomer().getEmail() %></td>
                            <td class="border border-gray-400 px-4 py-2"><%= b.getCustomer().getFullName() %></td>
                            <td class="border border-gray-400 px-4 py-2"><%= b.getRoom().getRoomName() %></td>
                            <td class="border border-gray-400 px-4 py-2"><%= b.getDate() %></td>
                            <td class="border border-gray-400 px-4 py-2"><%= b.getMonth() %></td>
                            <td class="border border-gray-400 px-4 py-2"><%= b.getEnd_date() %></td>
                            <td class="border border-gray-400 px-4 py-2"><%= roomPrice %></td>
                            <td class="border border-gray-400 px-4 py-2"><%= b.getC().getAdmin_price() %></td>
                        </tr>
                        <% 
                                } 
                            } else { 
                        %>
                        <tr>
                            <td class="border border-gray-400 px-4 py-2" colspan="8">Không có dữ liệu</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

                <h2 class="text-2xl font-bold mb-4 text-red-600">Tổng tiền thuê trọ: <%= totalRentAmount %> VNĐ</h2>

                <h2 class="text-2xl font-bold mb-4 text-green-600">Tổng cộng (Nâng cấp + Thuê trọ): <%= totalUpgradeAmount + totalRentAmount %> VNĐ</h2>
            </div>
        </div>

    </body>
</html>