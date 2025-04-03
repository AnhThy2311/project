<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Room" %>
<%@ page import="model.ChatBox" %>
<%@ page import="model.Notification" %>
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
        <script type="text/javascript">
            function updateSearchDistricts() {
                var city = document.getElementById("searchCity").value;
                var districtSelect = document.getElementById("searchDistrict");

                // Xóa tất cả các option hiện tại trong quận
                districtSelect.innerHTML = "<option value=''>Chọn Quận</option>";

                // Cập nhật các quận tùy theo thành phố đã chọn
                if (city === "Hà Nội") {
                    var districts = [
                        "Ba Đình",
                        "Hoàn Kiếm",
                        "Cầu Giấy",
                        "Thanh Xuân",
                        "Đống Đa",
                        "Tây Hồ",
                        "Long Biên",
                        "Hà Đông",
                    ];
                } else if (city === "TP Hồ Chí Minh") {
                    var districts = [
                        "Quận 1",
                        "Quận 3",
                        "Quận 5",
                        "Quận 7",
                        "Bình Thạnh",
                        "Tân Bình",
                        "Gò Vấp",
                        "Phú Nhuận",
                        "Thủ Đức",
                    ];
                } else if (city === "Đà Nẵng") {
                    var districts = [
                        "Hải Châu",
                        "Sơn Trà",
                        "Ngũ Hành Sơn",
                        "Liên Chiểu",
                        "Cẩm Lệ",
                    ];
                } else {
                    var districts = [];
                }

                // Thêm các quận vào dropdown quận
                for (var i = 0; i < districts.length; i++) {
                    var option = document.createElement("option");
                    option.value = districts[i];
                    option.text = districts[i];
                    districtSelect.appendChild(option);
                }
            }

            function updateSearchWardAndStreet() {
                var district = document.getElementById("searchDistrict").value;
                var wardSelect = document.getElementById("searchWard");
                var streetSelect = document.getElementById("searchStreet");

                // Xóa các option hiện tại
                wardSelect.innerHTML = "<option value=''>Chọn Phường</option>";
                streetSelect.innerHTML = "<option value=''>Chọn Đường</option>";

                var wards = [];
                var streets = [];

                // Cập nhật các phường và đường theo quận
                if (district === "Ba Đình") {
                    wards = ["Phường Đội Cấn", "Phường Ngọc Hà", "Phường Ba Đình"];
                    streets = [
                        "Đường Liễu Giai",
                        "Đường Nguyễn Thái Học",
                        "Đường Quán Thánh",
                        "Đường Hoàng Hoa Thám",
                    ];
                } else if (district === "Hoàn Kiếm") {
                    wards = ["Phường Hàng Bạc", "Phường Cửa Đông", "Phường Hàng Gai"];
                    streets = [
                        "Đường Lý Thái Tổ",
                        "Đường Đinh Tiên Hoàng",
                        "Đường Phan Chu Trinh",
                    ];
                } else if (district === "Cầu Giấy") {
                    wards = [
                        "Phường Dịch Vọng Hậu",
                        "Phường Nghĩa Tân",
                        "Phường Quan Hoa",
                    ];
                    streets = [
                        "Đường Cầu Giấy",
                        "Đường Trần Duy Hưng",
                        "Đường Nguyễn Phong Sắc",
                    ];
                } else if (district === "Thanh Xuân") {
                    wards = [
                        "Phường Hạ Đình",
                        "Phường Thanh Xuân Bắc",
                        "Phường Thanh Xuân Nam",
                    ];
                    streets = [
                        "Đường Nguyễn Trãi",
                        "Đường Khuất Duy Tiến",
                        "Đường Giải Phóng",
                    ];
                } else if (district === "Đống Đa") {
                    wards = ["Phường Phương Liên", "Phường Trung Tự", "Phường Kim Liên"];
                    streets = ["Đường Xã Đàn", "Đường Lê Duẩn", "Đường Láng"];
                } else if (district === "Tây Hồ") {
                    wards = ["Phường Quảng An", "Phường Nhật Tân", "Phường Thụy Khuê"];
                    streets = ["Đường Âu Cơ", "Đường Xuân La", "Đường Tô Ngọc Vân"];
                } else if (district === "Long Biên") {
                    wards = ["Phường Bồ Đề", "Phường Gia Thụy", "Phường Ngọc Thụy"];
                    streets = ["Đường Nguyễn Văn Cừ", "Đường Cổ Linh", "Đường Sài Đồng"];
                } else if (district === "Hà Đông") {
                    wards = ["Phường Phú Lãm", "Phường Dương Nội", "Phường Văn Quán"];
                    streets = ["Đường Quang Trung", "Đường Lê Lợi", "Đường Nguyễn Trãi"];
                } else if (district === "Quận 1") {
                    wards = ["Phường Bến Nghé", "Phường Cầu Ông Lãnh", "Phường Đa Kao"];
                    streets = ["Đường Lê Lợi", "Đường Nguyễn Huệ", "Đường Đồng Khởi"];
                } else if (district === "Quận 3") {
                    wards = [
                        "Phường Võ Thị Sáu",
                        "Phường Tân Định",
                        "Phường Nguyễn Cư Trinh",
                    ];
                    streets = [
                        "Đường Trường Sa",
                        "Đường Cách Mạng Tháng 8",
                        "Đường Lý Chính Thắng",
                    ];
                } else if (district === "Quận 5") {
                    wards = ["Phường 1", "Phường 2", "Phường 5"];
                    streets = [
                        "Đường Nguyễn Trãi",
                        "Đường An Dương Vương",
                        "Đường Châu Văn Liêm",
                    ];
                } else if (district === "Quận 7") {
                    wards = ["Phường Tân Phong", "Phường Tân Kiểng", "Phường Phú Mỹ"];
                    streets = [
                        "Đường Nguyễn Thị Thập",
                        "Đường Lê Văn Lương",
                        "Đường Nguyễn Hữu Thọ",
                    ];
                } else if (district === "Bình Thạnh") {
                    wards = ["Phường 1", "Phường 3", "Phường 5"];
                    streets = [
                        "Đường Xô Viết Nghệ Tĩnh",
                        "Đường Nguyễn Hữu Cảnh",
                        "Đường Phan Văn Trị",
                    ];
                } else if (district === "Tân Bình") {
                    wards = ["Phường 1", "Phường 2", "Phường 3"];
                    streets = [
                        "Đường Hoàng Hoa Thám",
                        "Đường Trường Chinh",
                        "Đường Lý Thường Kiệt",
                    ];
                } else if (district === "Gò Vấp") {
                    wards = ["Phường 1", "Phường 2", "Phường 3"];
                    streets = [
                        "Đường Phạm Văn Đồng",
                        "Đường Nguyễn Oanh",
                        "Đường Quang Trung",
                    ];
                } else if (district === "Phú Nhuận") {
                    wards = ["Phường 1", "Phường 2", "Phường 3"];
                    streets = [
                        "Đường Phan Đình Giót",
                        "Đường Hoàng Văn Thụ",
                        "Đường Trường Sa",
                    ];
                } else if (district === "Thủ Đức") {
                    wards = [
                        "Phường Linh Đông",
                        "Phường Bình Thọ",
                        "Phường Hiệp Bình Chánh",
                    ];
                    streets = [
                        "Đường Kha Vạn Cân",
                        "Đường Đặng Văn Bi",
                        "Đường Võ Văn Ngân",
                    ];
                } else if (district === "Hải Châu") {
                    wards = [
                        "Phường Hòa Cường Bắc",
                        "Phường Hòa Thuận Tây",
                        "Phường Thạch Thang",
                    ];
                    streets = [
                        "Đường Lê Duẩn",
                        "Đường Nguyễn Hữu Thọ",
                        "Đường Hải Phòng",
                    ];
                } else if (district === "Sơn Trà") {
                    wards = ["Phường An Hải Bắc", "Phường An Hải Tây", "Phường Mân Thái"];
                    streets = [
                        "Đường Võ Nguyên Giáp",
                        "Đường Nguyễn Tất Thành",
                        "Đường Lê Văn Duyệt",
                    ];
                } else if (district === "Ngũ Hành Sơn") {
                    wards = ["Phường Mỹ An", "Phường Khuê Mỹ", "Phường Hòa Hải"];
                    streets = [
                        "Đường Võ Nguyên Giáp",
                        "Đường Trường Sa",
                        "Đường Phan Tôn",
                    ];
                } else if (district === "Liên Chiểu") {
                    wards = [
                        "Phường Hòa Hiệp Bắc",
                        "Phường Hòa Hiệp Nam",
                        "Phường Thủy Tú",
                    ];
                    streets = [
                        "Đường Nguyễn Lương Bằng",
                        "Đường Cách Mạng Tháng 8",
                        "Đường Bà Triệu",
                    ];
                } else if (district === "Cẩm Lệ") {
                    wards = [
                        "Phường Hòa Thọ Đông",
                        "Phường Hòa Thọ Tây",
                        "Phường Khuê Trung",
                    ];
                    streets = [
                        "Đường Trường Chinh",
                        "Đường Lê Trọng Tấn",
                        "Đường Hòa Thọ",
                    ];
                }

                // Thêm các phường vào dropdown Phường
                for (var i = 0; i < wards.length; i++) {
                    var option = document.createElement("option");
                    option.value = wards[i];
                    option.text = wards[i];
                    wardSelect.appendChild(option);
                }

                // Thêm các đường vào dropdown Đường
                for (var i = 0; i < streets.length; i++) {
                    var option = document.createElement("option");
                    option.value = streets[i];
                    option.text = streets[i];
                    streetSelect.appendChild(option);
                }
            }
        </script>
    </head>
    <body>

        <%
                                        HttpSession sessionUser = request.getSession(false); // Không tạo session mới nếu chưa tồn tại
                                        String username = (sessionUser != null) ? (String) sessionUser.getAttribute("email") : null;
                                        String userImage = (sessionUser != null && sessionUser.getAttribute("userImage") != null) 
                                            ? (String) sessionUser.getAttribute("userImage") 
                                            : "default_user.jpg"; // Mặc định nếu không có ảnh
                                        
 Integer state = (Integer) session.getAttribute("state");
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
                                width="100"
                                height="46"
                                />
                        </a>
                        <a class="nav-link active" href="RoomServlet" style="padding-left: 20px"
                           >Trang chủ</a
                        >
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

                            <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0 p-3" 
                                style="width: 350px; max-height: 400px; overflow-y: auto; border-radius: 10px;">

                                <%
                                ArrayList<ChatBox> listReceiver = (ArrayList<ChatBox>) session.getAttribute("list");
                                if (listReceiver != null && !listReceiver.isEmpty()) {
                                    for (ChatBox receiver : listReceiver) { 
                                %>
                                <!-- Tin nhắn mới -->
                                <!--receiver là id của người gửi-->
                                <li>
                                    <a href="OwnerChat?receiverId=<%= receiver.getSender() %>"   
                                       class="dropdown-item d-flex align-items-start py-2 text-decoration-none">
                                        <img src="${pageContext.request.contextPath}/images/<%= receiver.getImange() %>" 
                                             class="rounded-circle me-3" width="45" height="45" alt="User">
                                        <div>
                                            <strong class="d-block"><%= receiver.getName() %></strong>
                                            <p class="text-muted small mb-0">You have new messages!</p>
                                        </div>
                                    </a>
                                </li>

                                <% 
                                    }
                                } else { 
                                %>
                                <!-- Không có tin nhắn -->
                                <li class="dropdown-item text-center py-2">
                                    <span class="text-muted">không có tin nhắn</span>
                                </li>
                                <% } %>

                                <!-- Xem tất cả tin nhắn -->
                                <li class="dropdown-item text-center py-2">
                                    <a href="messages.jsp" class="text-primary fw-semibold">tất cả tin nhắn</a>
                                </li>
                            </ul>
                        </div>
                        <%
     // Lấy danh sách thông báo và số lượng thông báo từ request
     ArrayList<Notification> listNotification = (ArrayList<Notification>) request.getAttribute("ListNotification");
     String countNotification = request.getAttribute("countNotification") != null ? 
                                (String) request.getAttribute("countNotification") : "0";
                        %>

                        <div class="dropdown d-none d-lg-block">
                            <!-- Nút Bell hiển thị thông báo -->
                            <button type="button" class="btn btn-light border-0 d-flex align-items-center position-relative dropdown-toggle"
                                    data-bs-toggle="dropdown" aria-expanded="false" aria-label="Thông báo"
                                    onclick="<%= !countNotification.equals("0") ? "window.location.href='NotificationServlet'" : "" %>">
                                <!-- Icon Bell -->
                                <i class="bi bi-bell-fill text-primary fs-4"></i>

                                <!-- Hiển thị số lượng thông báo nếu có -->
                                <% if (!countNotification.equals("0")) { %>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                    <%= countNotification %>
                                </span>
                                <% } %>
                            </button>


                            <!-- Danh sách thông báo -->
                            <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0 p-3"
                                style="width: 350px; max-height: 400px; overflow-y: auto; border-radius: 10px;">
                                <%
                                    if (listNotification != null && !listNotification.isEmpty()) {
                                        for (Notification notification : listNotification) {
                                %>
                                <!-- Hiển thị từng thông báo -->
                                <li>
                                    <a href="#" class="dropdown-item d-flex align-items-start py-2 text-decoration-none">
                                        <i class="bi bi-bell me-3 fs-4 text-warning"></i>
                                        <div>
                                            <strong class="d-block"><%= notification.getTitle() %></strong>
                                        </div>
                                    </a>
                                </li>
                                <%
                                        }
                                    } else {
                                %>
                                <!-- Không có thông báo -->
                                <li class="dropdown-item text-center py-2">
                                    <span class="text-muted">Không có thông báo</span>
                                </li>
                                <% } %>

                                <!-- Link xem tất cả thông báo -->
                                <li class="dropdown-item text-center py-2">
                                    <a href="allNotifications.jsp" class="text-primary fw-semibold">Xem tất cả thông báo</a>
                                </li>
                            </ul>
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
                        <% if (username != null) { %>
                        <a href="ListContractCustomer">
                            <button class="btn btn-outline-secondary me-2">DS hợp đồng thuê</button>
                        </a>

                        <% } %>
                        <% if (state != null && state == 3) { %>
                        <div class="dropdown">
                            <button class="btn btn-outline-secondary dropdown-toggle me-2" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                Quản lý hợp đồng
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li>
                                    <a class="dropdown-item" href="OwnerListContractCustomer">DS hợp đồng cho thuê</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="OwnerBookingRoom">DS  phê duyệt cho thuê</a>
                                </li>
                            </ul>
                        </div>
                        <% } %>



                        <% 
     if (username != null) { 
                        %>
                        <div class="dropdown">
                            <img class="avatar rounded-circle me-2"
                                 src="${pageContext.request.contextPath}/images/<%= userImage %>"
                                 alt="Ảnh đại diện tài khoản" width="33" height="33" />
                            <button class="btn btn-outline-secondary dropdown-toggle me-2" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                <%= username %>
                            </button>

                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li><a class="dropdown-item" href="ChangePassword.jsp">Đổi mật khẩu</a></li>
                                <li><a class="dropdown-item" href="Profile">Thông tin</a></li>
                                <li> <a class="dropdown-item" href="Logout.jsp">
                                        Đăng xuất
                                    </a></li>
                            </ul>
                            <a href="WalletServlet">
                                <button class="btn btn-outline-secondary me-2">ví</button>
                            </a>
                            <a href="RoomAppointmentServlet">
                                <button class="btn btn-outline-secondary me-2">Lịch Xem Phòng</button>
                            </a>


                            <%
            if (state == 3) {
                            %>
                            <a  href="OwnerRoomAppointment" class="btn btn-outline-danger me-2"> Lịch Đặt Xem Phòng</a>
                            <a  href="GetPostRooms?email=<%=username%>" class="btn btn-outline-danger me-2">Đăng tin</a>

                            <%
                                    } else if(state==2){
                            %>
                            <a class="btn btn-outline-danger me-2" href="Ugradeaccount.jsp">Nâng cấp tài khoản</a>
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
        <!-- Phần tìm kiếm -->
        <div id="search-section" class="home-banner">
            <div class="overlay">
                <div class="search-box">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Phòng Trọ</a>
                        </li>
                    </ul>
                    <div class="search-bar">
                        <h3 class="form-select">Tìm Kiếm Phòng Trọ</h3>
                    </div>
                    <div class="filter-options">
                        <form
                            id="searchForm"
                            action="SearchForm"
                            method="GET"
                            class="row g-2 align-items-center"
                            >
                            <div class="col-auto">
                                <select
                                    class="form-control"
                                    id="searchCity"
                                    name="city"
                                    onchange="updateSearchDistricts()"
                                    required
                                    >
                                    <option value="">Chọn Thành Phố</option>
                                    <option value="Hà Nội">Hà Nội</option>
                                    <option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
                                    <option value="Đà Nẵng">Đà Nẵng</option>
                                </select>
                            </div>

                            <div class="col-auto">
                                <select
                                    class="form-control"
                                    id="searchDistrict"
                                    name="district"
                                    onchange="updateSearchWardAndStreet()"
                                    required
                                    >
                                    <option value="">Chọn Huyện</option>
                                </select>
                            </div>

                            <div class="col-auto">
                                <select
                                    class="form-control"
                                    id="searchWard"
                                    name="ward"
                                    required
                                    >
                                    <option value="">Chọn Phường</option>
                                </select>
                            </div>

                            <div class="col-auto">
                                <select
                                    class="form-control"
                                    id="searchStreet"
                                    name="street"
                                    required
                                    >
                                    <option value="">Chọn Đường</option>
                                </select>
                            </div>

                            <div class="col-auto">
                                <button class="btn btn-primary">🔍 Tìm Kiếm</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS -->
        <div class="container mt-4">
            <h4>Phòng Trọ dành cho bạn</h4>

            <% 
                // Lấy danh sách phòng từ request
                ArrayList<Room> rooms = (ArrayList<Room>) request.getAttribute("rooms");
                if (rooms != null && !rooms.isEmpty()) { 
            %>

            <!-- Bọc toàn bộ danh sách phòng trong một hàng (row) -->
            <div class="row">
                <% for (Room room : rooms) { %>
                <div class="col-md-3"> <!-- Hiển thị 4 phòng trên mỗi hàng -->
                    <div class="property-card">
                        <a href="RoomDetail?roomId=<%= room.getRoomId() %>">   
                            <img class="lazy_done" src="${pageContext.request.contextPath}/images/<%= room.getImage() %>" 
                                 alt="<%= room.getRoomName() %>" width="150">
                        </a>
                        <div class="property-info">
                            <p class="property-title">
                                <a href="RoomDetail?roomId=<%= room.getRoomId() %>">
                                    🏠 <%= room.getRoomName() %>
                                </a>
                            </p>
                            <p class="property-price">
                                <%= String.format("%,.3f", room.getPrice()).replace(".", "@").replace(",", ".").replace("@", ",") %> VND/tháng
                            </p>


                            <p class="property-meta">
                                <a href="#">
                                    <%= room.getPosition().getNumber_house() %>, 
                                    <%= room.getPosition().getStreet() %>, 
                                    <%= room.getPosition().getWard() %>, 
                                    <%= room.getPosition().getDistrict() %>, 
                                    <%= room.getPosition().getCity() %>
                                </a>
                            </p>
                            <% if(username != null){ %>
                            <form action="SendWishList" method="post">
                                <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
                                <button type="submit" class="btn btn-outline-secondary me-2 heart-btn">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </form>
                            <% }else{ %>
                            <form action="#" method="#">
                                <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
                                <button type="submit" class="btn btn-outline-secondary me-2 heart-btn">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </form>
                            <% }%>


                        </div>
                    </div>
                </div>
                <% } %>
            </div>

            <% } else { %>
            <div class="alert alert-warning mt-3">
                Không có phòng trọ nào được tìm thấy.
            </div>
            <% } %>

        </div>
        <div class="container mt-4">
            <div class="bg-white shadow-sm rounded">
                <div class="row">
                    <div class="col-md-6"><img class="d-block object-fit-contain mx-auto" src="https://th.bing.com/th/id/OIP.SZyknYljr3lMy37E5S8vkAHaI2?rs=1&pid=ImgDetMain" style="max-height: 390px;" alt="Hỗ trợ chủ nhà đăng tin"></div>
                    <div class="col-md-6 text-center p-5">
                        <i class="icon headset size-30 d-block mx-auto"></i>
                        <div class="fs-2 mt-2" id="offcanvasSupportLabel">Hỗ trợ chủ nhà đăng tin</div>
                        <p class="mt-3 lead">Nếu bạn cần hỗ trợ đăng tin, vui lòng liên hệ số điện thoại bên dưới:</p>
                        <div class="rounded-4 p-4 mb-4 text-center"><a class="btn btn-red btn-lg text-white d-flex justify-content-center rounded-4" target="_blank" rel="nofollow" href="tel:0909316890"><i class="icon telephone-fill white me-2"></i>ĐT: 0909316890 </a><a class="btn btn-primary btn-lg text-white d-flex justify-content-center rounded-4 mt-2" target="_blank" rel="nofollow" href="https://zalo.me/0909316890"><i class="icon chat-text white me-2"></i>Zalo: 0909316890 </a></div>
                    </div>
                </div>
            </div>
        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
        <script>
                                        document.addEventListener("DOMContentLoaded", function () {
                                            // Lấy các nút cần gắn sự kiện
                                            const locationBtn = document.querySelector(".btn__search");
                                            const filterBtn = document.querySelector(".btn__funnel");
                                            const searchSection = document.querySelector("#search-section");

                                            // Hàm lăn xuống tìm kiếm
                                            function scrollToSearch() {
                                                if (searchSection) {
                                                    searchSection.scrollIntoView({behavior: "smooth"});
                                                }
                                            }

                                            // Gắn sự kiện click cho các nút
                                            locationBtn.addEventListener("click", scrollToSearch);
                                            filterBtn.addEventListener("click", scrollToSearch);
                                        });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const citySelect = document.getElementById("city");
                const districtSelect = document.getElementById("district");
                const wardSelect = document.getElementById("ward");

                // Function to load cities
                function loadCities() {
                    fetch("/api/cities") // Replace with your API endpoint
                            .then((response) => response.json())
                            .then((data) => {
                                data.forEach((city) => {
                                    const option = document.createElement("option");
                                    option.value = city.id;
                                    option.textContent = city.name;
                                    citySelect.appendChild(option);
                                });
                            });
                }

                // Function to load districts based on selected city
                citySelect.addEventListener("change", function () {
                    const cityId = this.value;
                    districtSelect.innerHTML = '<option value="">Chọn quận</option>';
                    wardSelect.innerHTML = '<option value="">Chọn phường</option>';

                    if (cityId) {
                        fetch(`/api/districts?cityId=${cityId}`) // Replace with your API endpoint
                                .then((response) => response.json())
                                .then((data) => {
                                    data.forEach((district) => {
                                        const option = document.createElement("option");
                                        option.value = district.id;
                                        option.textContent = district.name;
                                        districtSelect.appendChild(option);
                                    });
                                });
                    }
                });

                // Function to load wards based on selected district
                districtSelect.addEventListener("change", function () {
                    const districtId = this.value;
                    wardSelect.innerHTML = '<option value="">Chọn phường</option>';

                    if (districtId) {
                        fetch(`/api/wards?districtId=${districtId}`) // Replace with your API endpoint
                                .then((response) => response.json())
                                .then((data) => {
                                    data.forEach((ward) => {
                                        const option = document.createElement("option");
                                        option.value = ward.id;
                                        option.textContent = ward.name;
                                        wardSelect.appendChild(option);
                                    });
                                });
                    }
                });

                // Load cities on page load
                loadCities();
            });
        </script>
    </body>
</html>
