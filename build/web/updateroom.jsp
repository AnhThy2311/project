<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PostRooms"%>
<%
    PostRooms pr = (PostRooms) request.getAttribute("pr");
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
                        <button class="btn btn-outline-secondary me-2">
                            <i class="bi-heart"></i>
                        </button>
                        <% 
     if (username != null) { 
                        %>
                        <img class="avatar rounded-circle me-2"
                             src="${pageContext.request.contextPath}/images/<%= userImage %>" 
                             alt="Ảnh đại diện tài khoản" width="33" height="33" />
                        <span class="me-2"><%= username %></span>
                        <a href="Register.jsp">
                            <button class="btn btn-outline-secondary me-2">Thông tin</button>
                        </a>
                        <a href="Logout.jsp">
                            <button class="btn btn-outline-secondary me-2">Logout</button>
                        </a>
                        <button class="btn btn-outline-danger me-2">Nâng câp tài khoản</button>
                        <button class="btn btn-outline-danger me-2">Đăng tin</button>
                        <% 
                            } else { 
                        %>
                        <a href="Register.jsp">
                            <button class="btn btn-outline-secondary me-2">Đăng ký</button>
                        </a>
                        <a href="Loggin.jsp">
                            <button class="btn btn-outline-secondary me-2">Đăng nhập</button>
                        </a>
                        <% } %>
                        <button class="btn btn-outline-danger me-2">Đăng tin</button>

                    </div>
                </div>
            </div>

        </header>
        <div class="flex justify-center items-center min-h-screen bg-gray-200">
            <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-lg">
                <h1 class="text-4xl font-bold mb-6 text-blue-600">Cập Nhật Chi Tiết Phòng</h1>
                <% if (pr != null) { %>
                <form action="UpdatePostRoomServlet" method="post" enctype="multipart/form-data">
                    <!-- Truyền id ẩn để cập nhật đúng phòng -->
                    <input type="hidden" name="id" value="<%= pr.getId() %>">

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="room_name">Tên phòng:</label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                               id="room_name" type="text" name="room_name" value="<%= pr.getRoom_name() %>" required>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="price">Giá phòng:</label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                               id="price" type="text" name="price" value="<%= pr.getPrice() %>" required>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2">Địa Chỉ:</label>
                        <p class="text-gray-700"><%= pr.getNumber_house() %>, <%= pr.getStreet() %>, <%= pr.getWard() %>, <%= pr.getDistrict() %>, <%= pr.getCity() %></p>
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="image">Cập nhật hình ảnh:</label>
                        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                               id="image" type="file" name="image" >
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2">Ảnh hiện tại:</label>
                        <img class="w-full h-auto rounded-lg shadow-md" src="${pageContext.request.contextPath}/images/<%= pr.getImage() %>" 
                             alt="Hình ảnh phòng" width="600" height="400">
                    </div>

                    <div class="flex items-center justify-between">
                        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" 
                                type="submit">Cập Nhật</button>
                    </div>
                </form>
                <% } else { %>
                <p class="text-red-500 font-bold">Không tìm thấy thông tin phòng.</p>
                <% } %>
            </div>
        </div>

    </body>
</html>
