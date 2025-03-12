<%-- 
    Document   : CreatePostRooms
    Created on : Feb 10, 2025, 2:27:57 PM
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
        <div class="bg-gradient-to-r from-blue-100 to-blue-200 flex items-center justify-center min-h-screen">
            <div class="bg-white p-10 rounded-lg shadow-2xl w-full max-w-lg">
                <h1 class="text-4xl font-bold mb-10 text-center text-blue-800">Thêm Bài Đăng</h1>
                <form action="PostRoom" method="post" enctype="multipart/form-data">
                    <!-- Thành Phố -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Thành Phố</label>
                        <select class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" 
                                id="searchCity" name="city" onchange="updateSearchDistricts()" required>
                            <option value="">Chọn Thành Phố</option>
                            <option value="Hà Nội">Hà Nội</option>
                            <option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
                            <option value="Đà Nẵng">Đà Nẵng</option>
                        </select>
                    </div>

                    <!-- Quận -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Quận</label>
                        <select class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                id="searchDistrict" name="district" onchange="updateSearchWardAndStreet()" required>
                            <option value="">Chọn Quận</option>
                        </select>
                    </div>

                    <!-- Phường -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Phường</label>
                        <select class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                id="searchWard" name="ward" required>
                            <option value="">Chọn Phường</option>
                        </select>
                    </div>

                    <!-- Đường -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Đường</label>
                        <select class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                id="searchStreet" name="street" required>
                            <option value="">Chọn Đường</option>
                        </select>
                    </div>
                     <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Mô tả chi tiết vị trí</label>
                        <input type="text" class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                               id="descriptionlocation" name="descriptionlocation" required>
                    </div>
                    <!-- Số Nhà -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Số Nhà</label>
                        <input type="text" class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                               id="houseNumber" name="houseNumber" required>
                    </div>
                    <!-- Tên Phòng -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Tên Phòng</label>
                        <input type="text" class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                               id="room_name" name="room_name" required>
                    </div>
                    <!-- Mô Tả -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Mô Tả</label>
                        <textarea class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                  id="description" name="description" rows="3" required></textarea>
                    </div>
                    <!-- Giá -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Giá</label>
                        <input type="number" class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                               id="price" name="price" required>
                    </div>
                    <!-- Hình Ảnh -->
                    <div class="mb-6">
                        <label class="block text-gray-700 font-semibold mb-2">Hình Ảnh</label>
                        <input type="file" class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                               id="image" name="image" accept="image/*" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="bg-gradient-to-r from-green-400 to-green-600 text-white px-6 py-3 rounded-lg hover:from-green-500 hover:to-green-700 transition duration-300">Thêm</button>
                    </div>
                </form>
            </div>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
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
