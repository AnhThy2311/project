<%-- 
    Document   : change_password
    Created on : Feb 5, 2025, 3:02:15 PM
    Author     : son
--%>

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
        <div class="flex items-center justify-center min-h-screen bg-gradient-to-r from-green-400 to-blue-500">
            <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg">
                <h2 class="text-3xl font-semibold text-center text-gray-800 mb-6">Đặt lại mật khẩu</h2>
                <form action="ResertPassword" method="post" onsubmit="return validatePassword()">
                    <div class="mb-4">
                        <label for="email" class="block text-gray-700 mb-2">Email</label>
                        <input type="email" name="email" id="email" value="<%= request.getParameter("email") %>" readonly 
                               class="w-full px-4 py-2 border rounded-lg bg-gray-100">
                    </div>
                    <div class="mb-4">
                        <label for="newPassword" class="block text-gray-700 mb-2">Mật khẩu mới</label>
                        <input type="password" name="newPassword" id="newPassword" placeholder="Nhập mật khẩu mới" required
                               class="w-full px-4 py-2 border rounded-lg">
                    </div>
                    <div class="mb-6">
                        <label for="confirmPassword" class="block text-gray-700 mb-2">Nhập lại mật khẩu mới</label>
                        <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Nhập lại mật khẩu mới" required
                               class="w-full px-4 py-2 border rounded-lg">
                    </div>
                    <button type="submit" class="w-full bg-blue-700 text-white py-2 rounded-lg hover:bg-blue-800 transition duration-200">
                        Đôir mật khẩu 
                    </button>
                </form>
            </div>
        </div>

        <script>
            function validatePassword() {
                const password = document.getElementById("newPassword").value;
                const confirmPassword = document.getElementById("confirmPassword").value;
                const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/;

                if (!passwordRegex.test(password)) {
                    alert("Password must be at least 8 characters long, contain at least one uppercase letter, one number, and one special character.");
                    return false;
                }
                if (password !== confirmPassword) {
                    alert("Passwords do not match.");
                    return false;
                }
                return true;
            }
        </script>



        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
