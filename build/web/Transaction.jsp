
<%@ page import="model.Transaction" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>
            Wallet Page
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
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
                                                Search by area
                                            </span>
                                        </div>
                                        <!-- Nút bộ lọc -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Các nút đăng ký, đăng nhập, đăng tin -->
                    <div class="d-flex align-items-center">
                        <% if (username != null) { %>
                        <!-- Messenger Dropdown -->
                        <div class="dropdown d-none d-lg-block">
                            <button type="button" class="btn btn-light border-0 d-flex align-items-center dropdown-toggle"
                                    data-bs-toggle="dropdown" aria-expanded="false" aria-label="Tin nhắn">
                                <i class="bi bi-chat-dots-fill text-primary fs-4"></i>
                            </button>

                        </div>
                        <% } %>
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
                        <a href="RoomAppointmentServlet">
                            <button class="btn btn-outline-secondary me-2">wallet</button>
                        </a>
                        <a href="RoomAppointmentServlet">
                            <button class="btn btn-outline-secondary me-2">Room View Schedule</button>
                        </a>
                        <a href="ChangePassword.jsp">
                            <button class="btn btn-outline-secondary me-2">Change Password</button>
                        </a>
                        <a href="Profile">
                            <button class="btn btn-outline-secondary me-2">Profile</button>
                        </a>
                        <a href="Logout.jsp">
                            <button class="btn btn-outline-secondary me-2">Logout</button>
                        </a>
                        <%
    Integer state = (Integer) session.getAttribute("state");

        if (state == 3) {
                        %>
                        <a  href="OwnerRoomAppointment" class="btn btn-outline-danger me-2">Xem Lịch Đặt Phòng</a>
                        <a  href="GetPostRooms?email=<%=username%>" class="btn btn-outline-danger me-2">Đăng tin</a>

                        <%
                                } else if(state==2){
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
    List<Transaction> trList = (List<Transaction>) request.getAttribute("tr");
     SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy  HH:mm:ss");
        %>
        <div class="bg-gray-200 text-gray-800 flex items-center justify-center min-h-screen">
            <div class="w-full max-w-3xl p-6 bg-white shadow-lg rounded-lg">
                <h1 class="text-2xl font-bold mb-6 text-blue-600">Transaction List</h1>
                <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
                    <thead class="bg-blue-500 text-white">
                        <tr>
                            <th class="py-3 px-4 text-left">ID</th>
                            <th class="py-3 px-4 text-left">Price</th>
                            <th class="py-3 px-4 text-left">Create Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (trList != null && !trList.isEmpty()) { %>
                        <% for (Transaction tr : trList) { %>
                        <tr class="border-b border-gray-200 hover:bg-gray-100">
                            <td class="py-3 px-4"><%= tr.getTransactionId() %></td>
                            <td class="py-3 px-4"><%= tr.getAmount() %></td>
                            <td class="py-3 px-4"><%= sdf.format(tr.getCreatedAt()) %></td>
                        </tr>
                        <% } %>
                        <% } else { %>
                        <tr>
                            <td colspan="4" class="py-3 px-4 text-center">No Transactions Found</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>


    </body>

</html>
