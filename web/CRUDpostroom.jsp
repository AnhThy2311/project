<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.PostRooms" %>
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
        <link rel="stylesheet" href="#" />
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>

    </head>
    <body>
        <%
     HttpSession sessionUser = request.getSession(false); // Không tạo session mới nếu chưa tồn tại
     int userRole = (sessionUser != null && sessionUser.getAttribute("state") != null) 
                    ? (int) sessionUser.getAttribute("state") : -1; // Mặc định -1 nếu không có giá trị
     String username = (sessionUser != null) ? (String) sessionUser.getAttribute("email") : null;
     String userImage = (sessionUser != null && sessionUser.getAttribute("userImage") != null) 
                        ? (String) sessionUser.getAttribute("userImage") : "default_user.jpg"; // Ảnh mặc định
        %>

        <header class="navbar-custom sticky-top">
            <div class="container-fluid">
                <div class="d-flex justify-content-between align-items-center py-2">
                    <!-- Logo và Trang Chủ -->
                    <div class="d-flex align-items-center">
                        <a href="RoomServlet" class="navbar-brand">
                            <img src="https://static.muonnha.com.vn/images/logo.png?w=384&p=100" alt="Muôn Nhà" width="160" height="46"/>
                        </a>
                        <a class="nav-link active ms-3" href="RoomServlet">Trang Chủ</a>
                    </div>

                    <!-- Nút Wishlist -->
                    <a href="<%= (username != null) ? "WishListServlet" : "#" %>" class="btn btn-outline-secondary me-2">
                        <i class="bi bi-heart"></i>
                    </a>

                    <!-- Nếu đã đăng nhập -->
                    <% if (username != null) { %>
                    <a href="ListContractCustomer" class="btn btn-outline-secondary me-2">DS hợp đồng thuê</a>

                    <% if (userRole == 3) { %>
                    <div class="dropdown">
                        <button class="btn btn-outline-secondary dropdown-toggle me-2" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown">
                            Quản lý hợp đồng
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="OwnerListContractCustomer">DS hợp đồng cho thuê</a></li>
                            <li><a class="dropdown-item" href="OwnerBookingRoom">DS phê duyệt cho thuê</a></li>
                        </ul>
                    </div>
                    <% } %>

                    <!-- Avatar và tài khoản dropdown -->
                    <div class="d-flex align-items-center gap-2">
                        <img class="rounded-circle" src="${pageContext.request.contextPath}/images/<%= userImage %>" 
                             alt="Ảnh đại diện" width="35" height="35" />
                        <div class="dropdown">
                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                <%= username %>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="ChangePassword.jsp">Đổi mật khẩu</a></li>
                                <li><a class="dropdown-item" href="Profile">Thông tin</a></li>
                                <li><a class="dropdown-item" href="Logout.jsp">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </div>


                    <!-- Ví và Lịch Xem Phòng -->
                    <a href="WalletServlet" class="btn btn-outline-secondary me-2">Ví</a>
                    <a href="RoomAppointmentServlet" class="btn btn-outline-secondary me-2">Lịch Xem Phòng</a>

                    <% if (userRole == 3) { %>
                    <a href="OwnerRoomAppointment" class="btn btn-outline-danger me-2">Lịch Đặt Xem Phòng</a>
                    <a href="GetPostRooms?email=<%= username %>" class="btn btn-outline-danger me-2">Đăng tin</a>
                    <% } else if (userRole == 2) { %>
                    <a href="Ugradeaccount.jsp" class="btn btn-outline-danger me-2">Nâng cấp tài khoản</a>
                    <% } %>

                    <% } else { %>
                    <!-- Nếu chưa đăng nhập -->
                    <a href="Register.jsp" class="btn btn-outline-secondary me-2">Đăng ký</a>
                    <a href="Loggin.jsp" class="btn btn-outline-secondary me-2">Đăng nhập</a>
                    <a href="#" class="btn btn-outline-danger me-2">Đăng tin</a>
                    <% } %>
                </div>
            </div>
        </header>

        <%
    ArrayList<PostRooms> list = (ArrayList<PostRooms>) request.getAttribute("list");
        %>
        <div class="bg-gradient-to-r from-green-200 via-blue-200 to-purple-200 min-h-screen">
            <div class="container mx-auto mt-10 p-6">
                <!-- Các nút thao tác -->
                <div class="flex justify-center gap-4 mb-6">
                    <a href="danh-sach-dang-tin.html" class="bg-blue-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-blue-600 transition">
                        Danh Sách Đăng Tin
                    </a>
                    <a href="GetPendingapproval" class="bg-green-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-green-600 transition">
                        Danh Sách Chờ Bài Đăng
                    </a>
                </div>
            </div>

            <!-- Bảng danh sách phòng -->
            <div class="bg-white shadow-lg rounded-lg p-6">
                <h1 class="text-center text-3xl font-bold mb-6 text-blue-600">Danh Sách bài đăng</h1>
                <div class="overflow-x-auto">
                    <table class="w-full bg-white border border-gray-300 shadow-md rounded-lg">
                        <thead class="bg-blue-600 text-white">
                            <tr>
                                <th class="w-1/6 py-3 px-4">Hình ảnh</th>
                                <th class="w-1/6 py-3 px-4">Phòng</th>
                                <th class="w-1/6 py-3 px-4">Giá</th>
                                <th class="w-1/3 py-3 px-4">Địa chỉ</th>
                                <th class="w-1/6 py-3 px-4">Hành động</th>

                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                if (list != null && !list.isEmpty()) { 
                                    for (PostRooms post : list) { 
                            %>
                            <tr class="border-t border-gray-300 hover:bg-gray-100 transition">
                                <td class="py-3 px-4">
                                    <img src="${pageContext.request.contextPath}/images/<%= post.getImage() %>" 
                                         alt="<%= post.getRoom_name() %>" 
                                         class="w-24 h-24 object-cover rounded-lg shadow-md mx-auto"/>
                                </td>
                                <td class="py-3 px-4 text-center"><%= post.getRoom_name() %></td>
                                <td class="py-3 px-4 text-center font-semibold text-blue-600"><%= post.getPrice() %> VNĐ</td>
                                <td class="py-3 px-4">
                                    <%= post.getNumber_house() %>, <%= post.getStreet() %>, 
                                    <%= post.getWard() %>, <%= post.getDistrict() %>, <%= post.getCity() %>
                                </td>
                                <td class="py-3 px-4 text-center">
                                    <div class="flex justify-center space-x-2">
                                        <a href="UpdatePostRoom?id=<%= post.getId() %>" 
                                           class="bg-blue-500 text-white px-4 py-1 rounded shadow-md hover:bg-blue-700 transition">
                                            Chỉnh sửa
                                        </a>
                                        <a href="#" onclick="showmessg(<%=post.getId()%>)" 
                                           class="bg-red-500 text-white px-4 py-1 rounded shadow-md hover:bg-red-700 transition">
                                            xóa
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <% 
                                    } 
                                } else { 
                            %>
                            <tr>
                                <td colspan="5" class="text-center py-4 text-gray-500">Không có bài đăng nào.</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>

                <!-- Nút đăng bài -->
                <div class="text-center mt-6">
                    <a href="CreatePostRooms.jsp" 
                       class="bg-gradient-to-r from-green-400 via-blue-500 to-purple-600 text-white px-6 py-2 rounded-lg shadow-md hover:from-green-500 hover:via-blue-600 hover:to-purple-700 transition">
                        Đăng Bài
                    </a>
                </div>
            </div>
        </div>
    </div>


    <script>
        function showmessg(id) {
            var option = confirm("Are you sure you want to delete?");
            if (option == true) {
                window.location.href = 'DeletePostRoom?id=' + id;
            }
        }
    </script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
    ></script>
</body>
</html>
