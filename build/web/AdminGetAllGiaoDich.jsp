<%@ page import="model.Transaction" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, model.Withdrawals, java.text.SimpleDateFormat" %>
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
        <%
   ArrayList<Withdrawals> list = (ArrayList<Withdrawals>) request.getAttribute("list");
   SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        %>
        <div class="bg-gray-200 text-gray-800 flex items-center justify-center min-h-screen">
            <div class="w-full max-w-3xl p-6 bg-white shadow-lg rounded-lg">
                <h1 class="text-2xl font-bold mb-6 text-blue-600">Transaction List</h1>
                <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
                    <thead class="bg-blue-500 text-white">
                        <tr>
                            <th class="py-3 px-4 text-left">Số tài khoản</th>
                            <th class="py-3 px-4 text-left">Ngày Giao dịch</th>
                            <th class="py-3 px-4 text-left">Số tiền giao dịch</th>
                            <th class="py-3 px-4 text-left">Tên Ngân Hàng</th>
                            <th class="py-3 px-4 text-left">Tên Tài Khoản</th>
                            <th class="py-3 px-4 text-left">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (list != null && !list.isEmpty()) { %>
                        <% for (Withdrawals wd : list) { %>
                        <tr class="border-b border-gray-200 hover:bg-gray-100">
                            <td class="py-3 px-4"><%= wd.getAccount_number() %></td>
                            <td class="py-3 px-4"><%= wd.getDate() %></td>
                            <td class="py-3 px-4"><%= wd.getPrice() %> VNĐ</td>
                            <td class="py-3 px-4"><%= wd.getBank_name() %></td>
                            <td class="py-3 px-4"><%= wd.getRecipient_name() %></td>
                            <td>
                                <div class="d-flex gap-2">
                                    <form action="ApproveWithdrawalServlet" method="get">
                                        <input type="hidden" name="user_id" value="<%= wd.getUser_id() %>">
                                        <input type="hidden" name="price" value="<%= wd.getPrice() %>">
                                        <button type="submit" class="btn btn-success btn-sm">
                                            Đồng ý
                                        </button>
                                    </form>
                                </div>
                            </td>


                        </tr>
                        <% } %>
                        <% } else { %>
                        <tr>
                            <td colspan="5" class="py-3 px-4 text-center">Không có giao dịch nào.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>
