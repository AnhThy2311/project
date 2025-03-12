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
                        <button class="btn btn-outline-danger me-2">Đăng tin</button>
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
