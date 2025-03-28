<%-- 
    Document   : ReportFeebackAdmin
    Created on : Feb 28, 2025, 9:43:01 PM
    Author     : son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.ReportFeedback" %>
<!DOCTYPE html>
<html>
    <head>
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

        <%
            ArrayList<ReportFeedback> list = (ArrayList<ReportFeedback>) request.getAttribute("list");
        %>

        <div class="bg-gray-200 flex items-center justify-center min-h-screen">
            <div class="container mx-auto p-4 bg-white shadow-lg rounded-lg">
                <h1 class="text-2xl font-bold mb-4 text-center">Báo cáo bình luận</h1>
                <div class="overflow-x-auto">
                    <table class="min-w-full bg-white border border-gray-300 rounded-lg">
                        <thead class="bg-blue-600 text-white">
                            <tr>
                                <th class="py-3 px-4 border-b">Mã phản hồi</th>
                                <th class="py-3 px-4 border-b">Email</th>
                                <th class="py-3 px-4 border-b">Họ và tên</th>
                                <th class="py-3 px-4 border-b">Tên phòng</th>
                                <th class="py-3 px-4 border-b">Nội dung</th>
                                <th class="py-3 px-4 border-b">Hành động</th>

                            </tr>
                        </thead>
                        <tbody>
                            <% if (list != null && !list.isEmpty()) { %>
                            <% for (ReportFeedback fb : list) { %>
                            <tr class="<%= (list.indexOf(fb) % 2 == 0) ? "bg-gray-100" : "bg-white" %>">
                                <td class="py-3 px-4 border-b"><%= fb.getFeedbackId() %></td>
                                <td class="py-3 px-4 border-b"><%= fb.getEmail() %></td>
                                <td class="py-3 px-4 border-b"><%= fb.getFullname() %></td>
                                <td class="py-3 px-4 border-b"><%= fb.getRoom_name() %></td>
                                <td class="py-3 px-4 border-b"><%= fb.getContent() %></td>
                                <td class="py-3 px-4 border-b flex space-x-2">
                                    <form action="AcceptFeedbackServlet" method="get" style="display:inline;">
                                        <input type="hidden" name="feedbackId" value="<%= fb.getFeedbackId() %>">
                                        <button type="submit" class="bg-green-500 text-white px-4 py-1 rounded">Đòng ý</button>
                                    </form>
                                    <form action="AcceptFeedbackServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="feedbackId" value="<%= fb.getFeedbackId() %>">
                                        <button type="submit" class="bg-red-500 text-white px-4 py-1 rounded">hủy</button>
                                    </form>
                                </td>
                            </tr>
                            <% } %>
                            <% } else { %>
                            <tr>
                                <td colspan="6" class="py-3 px-4 border-b text-center">No Feedback Found</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    </body>
</html>
