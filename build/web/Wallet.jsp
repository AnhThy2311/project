<%-- 
    Document   : Wallet
    Created on : Mar 2, 2025, 3:40:33 PM
    Author     : son
--%>
<%@ page import="model.Wallet" %>
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
        <!-- At the end of the body section -->
        <title>Room Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <!-- In the head section -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
    </head>

    <body>
        <%
      HttpSession sessionUser = request.getSession(false); // Không tạo session mới nếu chưa tồn tại
      int userRole = (sessionUser != null && sessionUser.getAttribute("state") != null) 
          ? (int) sessionUser.getAttribute("state") 
          : -1; // Mặc định -1 nếu không có giá trị

      String username = (sessionUser != null && sessionUser.getAttribute("email") != null) 
          ? (String) sessionUser.getAttribute("email") 
          : null;

      String userImage = (sessionUser != null && sessionUser.getAttribute("userImage") != null) 
          ? (String) sessionUser.getAttribute("userImage") 
          : "default_user.jpg"; // Mặc định nếu không có ảnh
        %>

        <header class="navbar navbar-expand-lg navbar-custom sticky-top bg-light">
            <div class="container-fluid">
                <div class="d-flex justify-content-between align-items-center py-2 w-100">
                    <!-- Logo -->
                    <div class="d-flex align-items-center">
                        <a href="RoomServlet" class="navbar-brand">
                            <img src="https://static.muonnha.com.vn/images/logo.png?w=384&p=100" 
                                 alt="Muôn Nhà" width="160" height="46">
                        </a>
                        <a class="nav-link active ms-3" href="RoomServlet">Trang Chủ</a>
                    </div>

                    <!-- Wishlist -->
                    <a href="<%= (username == null) ? "#" : "WishListServlet" %>" class="btn btn-outline-secondary me-2">
                        <i class="bi bi-heart"></i>
                    </a>

                    <!-- Hợp đồng thuê -->
                    <% if (username != null) { %>
                    <a href="ListContractCustomer" class="btn btn-outline-secondary me-2">DS hợp đồng thuê</a>
                    <% } %>

                    <!-- Dropdown Quản lý hợp đồng (chỉ dành cho role = 3) -->
                    <% if (userRole == 3) { %>
                    <div class="dropdown me-2">
                        <button class="btn btn-outline-secondary dropdown-toggle" type="button" 
                                id="contractDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            Quản lý hợp đồng
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="contractDropdown">
                            <li><a class="dropdown-item" href="OwnerListContractCustomer">DS hợp đồng cho thuê</a></li>
                            <li><a class="dropdown-item" href="OwnerBookingRoom">DS phê duyệt cho thuê</a></li>
                        </ul>
                    </div>
                    <% } %>

                    <!-- Tài khoản & Chức năng -->
                    <% if (username != null) { %>
                    <div class="dropdown">
                        <button class="btn btn-outline-secondary dropdown-toggle" type="button" 
                                id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <%= username %>
                        </button>

                        <ul class="dropdown-menu" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="ChangePassword.jsp">Đổi mật khẩu</a></li>
                            <li><a class="dropdown-item" href="Profile">Thông tin cá nhân</a></li>
                            <li><a class="dropdown-item" href="Logout.jsp">Đăng xuất</a></li>
                        </ul>
                    </div>

                    <!-- Ví & Lịch xem phòng -->
                    <a href="WalletServlet" class="btn btn-outline-secondary me-2">Ví</a>
                    <a href="RoomAppointmentServlet" class="btn btn-outline-secondary me-2">Lịch Xem Phòng</a>

                    <!-- Chức năng riêng của từng vai trò -->
                    <% if (userRole == 3) { %>
                    <a href="OwnerRoomAppointment" class="btn btn-outline-danger me-2">Lịch Đặt Xem Phòng</a>
                    <a href="GetPostRooms?email=<%= username %>" class="btn btn-outline-danger me-2">Đăng tin</a>
                    <% } else if (userRole == 2) { %>
                    <a href="Ugradeaccount.jsp" class="btn btn-outline-danger me-2">Nâng cấp tài khoản</a>
                    <% } %>

                    <% } else { %>
                    <!-- Nếu chưa đăng nhập -->
                    <a href="Register.jsp" class="btn btn-outline-secondary me-2">Đăng ký</a>
                    <a href="Loggin.jsp" class="btn btn-outline-secondary me-2">Đăng nhập</a>
                    <button class="btn btn-outline-danger me-2">Đăng tin</button>
                    <% } %>

                </div>
            </div>
        </header>


        <%
     Wallet w = (Wallet) request.getAttribute("w");
     double balance = (w == null) ? 0.0 : w.getPrice();
        %>
        <div class="bg-gradient-to-r from-blue-500 to-purple-600 min-h-screen flex items-center justify-center font-roboto">
            <div class="bg-white rounded-lg shadow-lg p-8 max-w-md w-full h-auto">
                <div class="text-center mb-6">
                    <h1 class="text-3xl font-bold text-gray-800">Ví Tiền Của Bạn</h1>
                    <p class="text-gray-600 mt-2">Số dư hiện tại của bạn là:</p>
                    <p class="text-4xl font-bold text-green-500 mt-2">
                        <%= String.format("%,.3f", balance).replace(".", "@").replace(",", ".").replace("@", ",") %> VND
                    </p>
                </div>
                <div class="flex justify-center mb-6">
                    <img alt="A decorative image of a wallet with money and credit cards" class="rounded-lg shadow-md" height="200" 
                         src="https://storage.googleapis.com/a1aa/image/wxpcw-dc6aYs1OoI5rOPEDfb4KtRUYOZfqUQObpOku4.jpg" width="300"/>
                </div>
                <div>
                    <a href="deposit.jsp?id=<%=request.getAttribute("id") %>" 
                       class="w-full bg-blue-500 text-white py-2 rounded-lg shadow hover:bg-blue-600 transition duration-300 text-center block">
                        <i class="fas fa-wallet mr-2"></i> Nạp Tiền
                    </a>
                </div>
                <br/>
                <div class="mb-4">
                    <a href="TransactionServlet" 
                       class="w-full bg-green-500 text-white py-2 rounded-lg shadow hover:bg-green-600 transition duration-300 text-center block mb-4">
                        <i class="fas fa-history mr-2"></i> Lịch Sử Giao Dịch
                    </a>
                </div>
                <div class="mb-4">
                    <button onclick="openModal()" 
                            class="w-full bg-blue-500 text-white py-2 rounded-lg shadow hover:bg-blue-600 transition duration-300 text-center block">
                        <i class="fas fa-wallet mr-2"></i> Rút tiền
                    </button>
                </div>
                <div class="mb-4">
                    <a href="WithdrawalsRut" 
                       class="w-full bg-green-500 text-white py-2 rounded-lg shadow hover:bg-green-600 transition duration-300 text-center block mb-4">
                        <i class="fas fa-history mr-2"></i> Lịch sử rút tiền
                    </a>
                </div>
            </div>
        </div>

        <!-- Modal Rút Tiền -->
        <div id="withdrawModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 flex justify-center items-center hidden">
            <div class="bg-white p-6 rounded-lg shadow-lg w-96">
                <h2 class="text-2xl font-bold mb-4 text-gray-800 text-center">Rút Tiền</h2>
                <form id="withdrawForm" action="withdrawForm" method="GET" onsubmit="return validateWithdrawAmount()">
                    <div class="mb-4">
                        <label class="block text-gray-700">Số tài khoản</label>
                        <input type="text" name="accountNumber" required 
                               class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700">Ngân hàng</label>
                        <input type="text" name="bankName" required 
                               class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700">Tên người nhận</label>
                        <input type="text" name="recipientName" required 
                               class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700">Số tiền muốn rút</label>
                        <input type="number" id="withdrawAmount" name="amount" required min="1000" step="1000"
                               class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
                        <p id="error-message" class="text-red-500 text-sm mt-1 hidden">Số tiền rút phải lớn hơn 10.000!</p>
                    </div>
                    <div class="flex justify-between">
                        <button type="button" onclick="closeModal()" 
                                class="bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-600">
                            Đóng
                        </button>
                        <button type="submit" 
                                class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">
                            Xác nhận
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function validateWithdrawAmount() {
                const withdrawAmount = document.getElementById("withdrawAmount").value;
                const errorMessage = document.getElementById("error-message");

                if (withdrawAmount < 10000) {
                    errorMessage.classList.remove("hidden");
                    return false; // Ngăn form gửi đi
                } else {
                    errorMessage.classList.add("hidden");
                    return true; // Cho phép gửi form
                }
            }
        </script>


        <!-- JavaScript để mở/đóng modal & kiểm tra số dư -->
        <script>
            let balance = <%= balance %>;

            function openModal() {
                document.getElementById("withdrawModal").classList.remove("hidden");
            }

            function closeModal() {
                document.getElementById("withdrawModal").classList.add("hidden");
            }

            document.getElementById("withdrawForm").addEventListener("submit", function (event) {
                let withdrawAmount = parseFloat(document.getElementById("withdrawAmount").value);

                if (withdrawAmount > balance) {
                    alert("Số tiền bạn cần rút lớn hơn số tiền bạn có.");
                    event.preventDefault(); // Ngăn form gửi đi
                    return;
                }

                let confirmWithdraw = confirm("Bạn đã xác nhận mọi thông tin chính xác chưa?");
                if (!confirmWithdraw) {
                    event.preventDefault(); // Ngăn form gửi đi nếu chọn "Hủy"
                }
            });

        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/your_code.js" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>
</html>

