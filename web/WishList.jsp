<%-- 
    Document   : WishList
    Created on : Feb 26, 2025, 11:29:24 AM
    Author     : son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Wishlist" %>
<%@ page import="model.Room" %>
<%@ page import="model.Customer" %>
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
        <link rel="stylesheet" href="css/loggin.css" />
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

        <ul class="list-unstyled d-flex flex-column align-items-center">
            <% 
                ArrayList<Wishlist> wishlists = (ArrayList<Wishlist>) request.getAttribute("list");
                if (wishlists != null && !wishlists.isEmpty()) {
                    for (Wishlist wishlist : wishlists) { 
                        Room room = wishlist.getRoom();
                        Customer owner = room.getCustomer();
            %>
            <li class="d-flex bg-white shadow-sm rounded p-3 mt-3 w-50 align-items-center">
                <figure class="post__thumb__vip2 me-3">
                    <a href="RoomDetail?roomId=<%= room.getRoomId() %>">
                        <img class="lazy_done rounded" src="${pageContext.request.contextPath}/images/<%= room.getImage() %>" 
                             alt="<%= room.getRoomName() %>" width="150" height="200px" style="object-fit: cover;">
                    </a>
                </figure>
                <div class="flex-grow-1">
                    <h3 class="fs-6 fw-medium text-uppercase mb-2 ">
                        <a href="RoomDetail?roomId=<%= room.getRoomId() %>">
                            <%= room.getRoomName() %>
                        </a>
                    </h3>
                    <div class="">
                        <span class="text-price fw-semibold fs-6"><%= room.getPrice() %> triệu/tháng</span>
                        <span class="dot mx-2">•</span>
                        <span>45 m<sup>2</sup></span>
                    </div>
                    <p class="fs-8 text-secondary  mt-2">
                        Mô tả: <%= room.getDescription() %>
                    </p>
                    <div class="d-flex justify-content-between align-items-center mt-2">
                        <div class="d-flex align-items-center">
                            <img class="avatar rounded-circle me-2" 
                                 src="${pageContext.request.contextPath}/images/<%= (owner != null && owner.getImage() != null) ? owner.getImage() : "default_user.jpg" %>" 
                                 alt="<%= (owner != null) ? owner.getFullName() : "Chủ phòng" %>" width="35" height="35">
                            <div>
                                <span><%= (owner != null) ? owner.getFullName() : "Không xác định" %></span>
                                <br>
                                <small class="text-secondary">SĐT: <%= (owner != null && owner.getPhone() != null) ? owner.getPhone() : "N/A" %></small>
                            </div>
                        </div>
                        <form action="DeleteWishList" method="get">
                            <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?')">
                                <i class="bi bi-trash"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </li>
            <% 
                    }
                } else {
            %>
            <li class="d-flex bg-white shadow-sm rounded p-3 mt-3 w-50 justify-content-center">
                <p class="fs-7 text-secondary text-center">Không có phòng trọ nào được tìm thấy.</p>
            </li>
            <% 
                }
            %>
        </ul>

    </body>
</html>
