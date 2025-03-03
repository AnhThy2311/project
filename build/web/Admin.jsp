<%-- 
    Document   : Admin
    Created on : Feb 26, 2025, 9:58:42 PM
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
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/dau.css" />
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
        <div class="flex">
            <!-- Sidebar -->
            <div class="w-1/5 bg-white h-screen p-4">
                <ul class="space-y-4">
                    <li class="flex items-center space-x-2 text-blue-500">
                        <i class="fas fa-tachometer-alt">
                        </i>
                        <span>
                            Dashboard
                        </span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <i class="fas fa-chart-bar">
                        </i>
                        <span>
                            Charts
                        </span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <i class="fas fa-table">
                        </i>
                        <span>
                            Tables
                        </span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <i class="fas fa-edit">
                        </i>
                        <span>
                            Forms
                        </span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <i class="fas fa-calendar-alt">
                        </i>
                        <span>
                            Calendar
                        </span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <i class="fas fa-map-marker-alt">
                        </i>
                        <span>
                            Maps
                        </span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <i class="fas fa-file-alt">
                        </i>
                        <span>
                            Pages
                        </span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <i class="fas fa-cogs">
                        </i>
                        <span>
                            UI Elements
                        </span>
                    </li>
                </ul>
            </div>
            <!-- Main Content -->
            <div class="w-4/5 p-6">
                <div class="flex justify-between items-center mb-6">
                    <h1 class="text-2xl font-semibold">Overview</h1>
                </div>

                <div class="grid grid-cols-4 gap-4 mb-6">
                    <a href="AdminServlet" class="block bg-gradient-to-r from-purple-500 to-pink-500 text-white p-4 rounded focus:outline-none hover:shadow-lg active:scale-95 transition transform duration-200 cursor-pointer">
                        <div class="flex items-center space-x-2">
                            <i class="fas fa-user text-2xl"></i>
                            <div>
                                <p>User Management</p>
                            </div>
                        </div>
                        <img alt="Line chart showing members online trend" class="mt-4" height="100" src="https://storage.googleapis.com/a1aa/image/hRAS63IqZM36b-4wI_0OIIKZx3HcLWDkYaIzJ92I-TU.jpg" width="300"/>
                    </a>
                    <a href="AdminGetPendingapproval" class="block bg-gradient-to-r from-green-400 to-teal-500 text-white p-4 rounded focus:outline-none hover:shadow-lg active:scale-95 transition transform duration-200 cursor-pointer">
                        <div class="flex items-center space-x-2">
                            <i class="fas fa-shopping-cart text-2xl"></i>
                            <div>
                                <p>Approve Post Room</p>
                            </div>
                        </div>
                        <img alt="Line chart showing items sold trend" class="mt-4" height="100" src="https://storage.googleapis.com/a1aa/image/jnEvh5_WhCJPCgo1zMgozUzG-KtGuvvb6W91VMIkknE.jpg" width="300"/>
                    </a>

                    <a href="ReportFeebackAdmin" class="block bg-gradient-to-r from-orange-400 to-pink-500 text-white p-4 rounded focus:outline-none hover:shadow-lg active:scale-95 transition transform duration-200 cursor-pointer">
                        <div class="flex items-center space-x-2">
                            <i class="fas fa-calendar-alt text-2xl"></i>
                            <div>
                               
                                <p>Report Comment</p>
                            </div>
                        </div>
                        <img alt="Line chart showing weekly trend" class="mt-4" height="100" src="https://storage.googleapis.com/a1aa/image/mJd9u4hAKkXsNd1qkyCZIm7Q_dLCR1YJmzqt5Eol0Qw.jpg" width="300"/>
                    </a>

                    <a href="AdminBadnewReport" class="block bg-gradient-to-r from-green-400 to-yellow-500 text-white p-4 rounded focus:outline-none hover:shadow-lg active:scale-95 transition transform duration-200 cursor-pointer">
                        <div class="flex items-center space-x-2">
                            <i class="fas fa-dollar-sign text-2xl"></i>
                            <div>
                                <h2 class="text-xl font-semibold">$1,080,386</h2>
                                <p>Report Room</p>
                            </div>
                        </div>
                        <img alt="Bar chart showing total earnings trend" class="mt-4" height="100" src="https://storage.googleapis.com/a1aa/image/Yc5GzORqvlr8phzEYRXLhmV3O5eHwCzlsHyQLS2UrJg.jpg" width="300"/>
                    </a>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="bg-white p-4 rounded shadow">
                        <h2 class="text-lg font-semibold mb-4">Recent Reports</h2>
                        <img alt="Area chart showing recent reports" class="w-full" height="300" src="https://storage.googleapis.com/a1aa/image/o0TMYgUArlg51sfSlXxa2W8zpqF7ASxIHqotm49oU_w.jpg" width="600"/>
                    </div>
                    <div class="bg-white p-4 rounded shadow">
                        <h2 class="text-lg font-semibold mb-4">Chart By %</h2>
                        <img alt="Pie chart showing percentage distribution" class="w-full" height="300" src="https://storage.googleapis.com/a1aa/image/Kt32K5khOJ7yRIG0VGrFyuV1xbkbD24IOep4V7ASsfk.jpg" width="300"/>
                    </div>
                </div>
            </div>

    </body>
</html>
