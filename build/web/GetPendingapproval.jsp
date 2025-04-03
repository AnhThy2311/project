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
        <link rel="stylesheet" href="css/dau.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
        <div class="bg-gray-200 p-8">
            <div class="container mx-auto">
                <div class="flex justify-center mb-8">
                    <button class="bg-blue-500 text-white px-4 py-2 rounded mx-2 hover:bg-blue-600 transition duration-200">
                        Danh Sách Đăng tin
                    </button>
                    <button class="bg-green-500 text-white px-4 py-2 rounded mx-2 hover:bg-green-600 transition duration-200">
                        Danh Sách Chờ Bài Đăng
                    </button>

                </div>
                <h1 class="text-4xl font-bold mb-8 text-center text-blue-600">Danh Sách Chờ Bài Đăng</h1>
                <div class="overflow-x-auto shadow-lg rounded-lg bg-white p-6">
                    <table class="min-w-full bg-white border border-gray-300">
                        <thead class="bg-blue-500 text-white">
                            <tr>
                                <th class="py-3 px-4 border-b">ID</th>
                                <th class="py-3 px-4 border-b">Hình ảnh</th>
                                <th class="py-3 px-4 border-b">Tên phòng</th>
                                <th class="py-3 px-4 border-b">Giá</th>
                                <th class="py-3 px-4 border-b">Số nhà</th>
                                <th class="py-3 px-4 border-b">Đường</th>
                                <th class="py-3 px-4 border-b">Phường/Xã</th>
                                <th class="py-3 px-4 border-b">Quận/Huyện</th>
                                <th class="py-3 px-4 border-b">Thành phố</th>
                                <th class="py-3 px-4 border-b">Trạng thái</th>
                                <th class="py-3 px-4 border-b">Hủy</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<PostRooms> list = (ArrayList<PostRooms>) request.getAttribute("list");
                                for(PostRooms property : list) {
                            %>
                            <tr class="bg-gray-100 hover:bg-gray-200 transition duration-200">
                                <td class="py-3 px-4 border-b text-center"><%= property.getId() %></td>
                                <td class="py-3 px-4 border-b text-center">
                                    <img src="${pageContext.request.contextPath}/images/<%= property.getImage() %>" 
                                         alt="Property Image" class="w-16 h-16 object-cover mx-auto">
                                </td>
                                <td class="py-3 px-4 border-b text-center"><%= property.getRoom_name() %></td>
                                <td class="py-3 px-4 border-b text-center"><%= property.getPrice() %> VND</td>
                                <td class="py-3 px-4 border-b text-center"><%= property.getNumber_house() %></td>
                                <td class="py-3 px-4 border-b text-center"><%= property.getStreet() %></td>
                                <td class="py-3 px-4 border-b text-center"><%= property.getWard() %></td>
                                <td class="py-3 px-4 border-b text-center"><%= property.getDistrict() %></td>
                                <td class="py-3 px-4 border-b text-center"><%= property.getCity() %></td>
                                <td class="py-3 px-4 border-b text-center">
                                    <% 
                                        if ("2".equals(property.getStatus())) {
                                            out.print("<span class='text-blue-500'>Đang duyệt</span>");
                                        } else if ("0".equals(property.getStatus())) {
                                            out.print("<span class='text-red-500'>Yêu cầu bị hủy</span>");
                                        } else {
                                            out.print("<span class='text-green-500'>Hoàn thành</span>");
                                        }
                                    %>
                                </td>
                                <% if(property != null && !property.getStatus().equals("2")){ %>

                                <td class="py-3 px-4 border-b text-center">
                                    <form method="post" action="cancelPendingApproval">
                                        <input type="hidden" name="id" value="<%= property.getId() %>">
                                        <button type="submit" 
                                                class="bg-red-500 text-white px-4 py-1 rounded hover:bg-red-600 transition duration-200"
                                                onclick="return confirm('Bạn có chắc chắn muốn hủy?');">
                                            Hủy
                                        </button>
                                    </form>
                                </td>
                                <% } %>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
