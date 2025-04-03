<%-- 
    Document   : AdminBadnewReport
    Created on : Mar 1, 2025, 1:40:50 AM
    Author     : son
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Room" %>
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
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
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
        <div class="bg-blue-100">
            <div class="container mx-auto p-4 flex justify-center items-center min-h-screen">
                <table class="min-w-full bg-white border border-gray-200 shadow-lg">
                    <thead class="bg-gray-200">
                        <tr>
                            <th class="py-2 px-4 border-b border-gray-300 text-left text-gray-700">Hình ảnh</th>
                            <th class="py-2 px-4 border-b border-gray-300 text-left text-gray-700">Tên phòng</th>
                            <th class="py-2 px-4 border-b border-gray-300 text-left text-gray-700">Email</th>
                            <th class="py-2 px-4 border-b border-gray-300 text-left text-gray-700">Họ và tên</th>
                            <th class="py-2 px-4 border-b border-gray-300 text-left text-gray-700">Số lượng</th>
                            <th class="py-2 px-4 border-b border-gray-300 text-left text-gray-700">Hành động</th>

                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        ArrayList<Room> list = (ArrayList<Room>) request.getAttribute("list");
                        if (list != null && list.size() > 0) {
                            for (Room r : list) { 
                        %>
                        <tr>
                            <td class="py-2 px-4 border-b border-gray-300">
                                <img src="${pageContext.request.contextPath}/images/<%= r.getImage() %>" alt="Room Image" class="w-24 h-32 object-cover" width="100">
                            </td>
                            <td class="py-2 px-4 border-b border-gray-300 text-gray-700"><%= r.getRoomName() %></td>
                            <td class="py-2 px-4 border-b border-gray-300 text-gray-700"><%= r.getCustomer().getEmail() %></td>
                            <td class="py-2 px-4 border-b border-gray-300 text-gray-700"><%= r.getCustomer().getFullName() %></td>
                            <td class="py-2 px-4 border-b border-gray-300 text-gray-700"><%= r.getCustomer().getPhone() %></td>
                            <td class="py-2 px-4 border-b border-gray-300">
                                <form action="AcceptRoom" method="get" style="display:inline;">
                                    <input type="hidden" name="roomId" value="<%= r.getRoomId() %>">
                                    <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded">Đồng ý</button>
                                </form>
                                <form action="AcceptRoom" method="post" style="display:inline;">
                                    <input type="hidden" name="roomId" value="<%= r.getRoomId() %>">
                                    <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded">hủy</button>
                                </form>
                            </td>
                        </tr>
                        <% 
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="6" class="text-center py-4 text-gray-700">No data available</td>
                        </tr>
                        <% 
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
