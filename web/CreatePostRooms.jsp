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
        <title>JSP Page</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
            rel="stylesheet"
            />
        <link href="./css/header.css" rel="stylesheet" />
        <script type="text/javascript">
            function updateDistricts() {
                var city = document.getElementById("city").value;
                var districtSelect = document.getElementById("district");

                // Xóa tất cả các option hiện tại trong quận
                districtSelect.innerHTML = "<option value=''>Chọn Quận</option>";

                // Cập nhật các quận tùy theo thành phố đã chọn
                if (city === "Hà Nội") {
                    var districts = ["Ba Đình", "Hoàn Kiếm", "Cầu Giấy", "Thanh Xuân", "Đống Đa", "Tây Hồ", "Long Biên", "Hà Đông"];
                } else if (city === "TP Hồ Chí Minh") {
                    var districts = ["Quận 1", "Quận 3", "Quận 5", "Quận 7", "Bình Thạnh", "Tân Bình", "Gò Vấp", "Phú Nhuận", "Thủ Đức"];
                } else if (city === "Đà Nẵng") {
                    var districts = ["Hải Châu", "Sơn Trà", "Ngũ Hành Sơn", "Liên Chiểu", "Cẩm Lệ"];
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

            function updateWardAndStreet() {
                var district = document.getElementById("district").value;
                var wardSelect = document.getElementById("ward");
                var streetSelect = document.getElementById("street");

                // Xóa các option hiện tại
                wardSelect.innerHTML = "<option value=''>Chọn Phường</option>";
                streetSelect.innerHTML = "<option value=''>Chọn Đường</option>";

                var wards = [];
                var streets = [];

                // Cập nhật các phường và đường theo quận
                if (district === "Ba Đình") {
                    wards = ["Phường Đội Cấn", "Phường Ngọc Hà", "Phường Ba Đình"];
                    streets = ["Đường Liễu Giai", "Đường Nguyễn Thái Học", "Đường Quán Thánh", "Đường Hoàng Hoa Thám"];
                } else if (district === "Hoàn Kiếm") {
                    wards = ["Phường Hàng Bạc", "Phường Cửa Đông", "Phường Hàng Gai"];
                    streets = ["Đường Lý Thái Tổ", "Đường Đinh Tiên Hoàng", "Đường Phan Chu Trinh"];
                } else if (district === "Cầu Giấy") {
                    wards = ["Phường Dịch Vọng Hậu", "Phường Nghĩa Tân", "Phường Quan Hoa"];
                    streets = ["Đường Cầu Giấy", "Đường Trần Duy Hưng", "Đường Nguyễn Phong Sắc"];
                } else if (district === "Thanh Xuân") {
                    wards = ["Phường Hạ Đình", "Phường Thanh Xuân Bắc", "Phường Thanh Xuân Nam"];
                    streets = ["Đường Nguyễn Trãi", "Đường Khuất Duy Tiến", "Đường Giải Phóng"];
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
                    wards = ["Phường Võ Thị Sáu", "Phường Tân Định", "Phường Nguyễn Cư Trinh"];
                    streets = ["Đường Trường Sa", "Đường Cách Mạng Tháng 8", "Đường Lý Chính Thắng"];
                } else if (district === "Quận 5") {
                    wards = ["Phường 1", "Phường 2", "Phường 5"];
                    streets = ["Đường Nguyễn Trãi", "Đường An Dương Vương", "Đường Châu Văn Liêm"];
                } else if (district === "Quận 7") {
                    wards = ["Phường Tân Phong", "Phường Tân Kiểng", "Phường Phú Mỹ"];
                    streets = ["Đường Nguyễn Thị Thập", "Đường Lê Văn Lương", "Đường Nguyễn Hữu Thọ"];
                } else if (district === "Bình Thạnh") {
                    wards = ["Phường 1", "Phường 3", "Phường 5"];
                    streets = ["Đường Xô Viết Nghệ Tĩnh", "Đường Nguyễn Hữu Cảnh", "Đường Phan Văn Trị"];
                } else if (district === "Tân Bình") {
                    wards = ["Phường 1", "Phường 2", "Phường 3"];
                    streets = ["Đường Hoàng Hoa Thám", "Đường Trường Chinh", "Đường Lý Thường Kiệt"];
                } else if (district === "Gò Vấp") {
                    wards = ["Phường 1", "Phường 2", "Phường 3"];
                    streets = ["Đường Phạm Văn Đồng", "Đường Nguyễn Oanh", "Đường Quang Trung"];
                } else if (district === "Phú Nhuận") {
                    wards = ["Phường 1", "Phường 2", "Phường 3"];
                    streets = ["Đường Phan Đình Giót", "Đường Hoàng Văn Thụ", "Đường Trường Sa"];
                } else if (district === "Thủ Đức") {
                    wards = ["Phường Linh Đông", "Phường Bình Thọ", "Phường Hiệp Bình Chánh"];
                    streets = ["Đường Kha Vạn Cân", "Đường Đặng Văn Bi", "Đường Võ Văn Ngân"];
                } else if (district === "Hải Châu") {
                    wards = ["Phường Hòa Cường Bắc", "Phường Hòa Thuận Tây", "Phường Thạch Thang"];
                    streets = ["Đường Lê Duẩn", "Đường Nguyễn Hữu Thọ", "Đường Hải Phòng"];
                } else if (district === "Sơn Trà") {
                    wards = ["Phường An Hải Bắc", "Phường An Hải Tây", "Phường Mân Thái"];
                    streets = ["Đường Võ Nguyên Giáp", "Đường Nguyễn Tất Thành", "Đường Lê Văn Duyệt"];
                } else if (district === "Ngũ Hành Sơn") {
                    wards = ["Phường Mỹ An", "Phường Khuê Mỹ", "Phường Hòa Hải"];
                    streets = ["Đường Võ Nguyên Giáp", "Đường Trường Sa", "Đường Phan Tôn"];
                } else if (district === "Liên Chiểu") {
                    wards = ["Phường Hòa Hiệp Bắc", "Phường Hòa Hiệp Nam", "Phường Thủy Tú"];
                    streets = ["Đường Nguyễn Lương Bằng", "Đường Cách Mạng Tháng 8", "Đường Bà Triệu"];
                } else if (district === "Cẩm Lệ") {
                    wards = ["Phường Hòa Thọ Đông", "Phường Hòa Thọ Tây", "Phường Khuê Trung"];
                    streets = ["Đường Trường Chinh", "Đường Lê Trọng Tấn", "Đường Hòa Thọ"];
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

        <header class="bg-white text-body shadow-sm sticky-top z-1021" id="header">
            <div class="container-xl">
                <div
                    class="d-flex justify-content-between border-bottom"
                    style="--bs-border-color: #f1f1f1"
                    >
                    <div class="d-flex">
                        <a href="#"
                           ><img
                                class="object-fit-contain"
                                style="width: 190px; height: 60px"
                                src="${pageContext.request.contextPath}/images/anhthuetro.png" 
                                alt="Kênh thông tin cho thuê phòng trọ số 1 Việt Nam"
                                title="Phongtro123.com"
                                /></a>
                        <div class="d-none d-md-flex ms-4">
                            <div class="filter__bar pb-2">
                                <div class="w-100">
                                    <div class="d-flex position-relative bg-white">
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

                                        <button
                                            type="button"
                                            data-bs-toggle="offcanvas"
                                            data-bs-target="#offcanvasAdvance"
                                            aria-controls="offcanvasAdvance"
                                            class="btn btn__funnel"
                                            >
                                            <i class="icon funnel size-14 me-1"></i>
                                            <span>Bộ lọc</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="d-flex js-reload-html-header">
                            <!-- <a
                              class="btn btn-white d-none d-lg-flex align-items-center text-body rounded-4"
                              href="https://phongtro123.com/tin-da-luu.html"
                              ><i class="icon heart size-16 me-2"></i>Tin đã lưu</a
                            > -->
                            <!-- <a
                              class="btn btn-white d-none d-xl-flex align-items-center text-body rounded-4 me-4"
                              href="https://phongtro123.com/quan-ly/tin-dang.html"
                              ><i class="icon folder size-18 me-2"></i>Quản lý</a
                            > -->
                            <%
    HttpSession sessionUser = request.getSession(false); // Không tạo session mới nếu chưa tồn tại
    String username = (sessionUser != null) ? (String) sessionUser.getAttribute("email") : null;
     String userImage = (sessionUser != null && sessionUser.getAttribute("userImage") != null) 
                        ? (String) sessionUser.getAttribute("userImage") 
                        : "default_user.jpg"; // Mặc định nếu không có ảnh
                            %>
                            <div class="dropdown d-none d-lg-block">
                                <button class="btn border-0 text-body d-flex align-items-center dropdown-toggle"
                                        type="button" data-bs-toggle="dropdown" aria-expanded="false" aria-label="Tài khoản">
                                    <img class="avatar rounded-circle me-2"
                                         src="${pageContext.request.contextPath}/images/<%= userImage %>" 
                                         alt="Ảnh đại diện tài khoản" width="33" height="33" />
                                    <span class="fs-6">
                                        <%= (username != null) ? username : "Tài khoản" %>
                                    </span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end shadow border-0 pt-3 pb-3">
                                    <% if (username == null) { %>
                                    <!-- Chưa đăng nhập -->
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5" rel="nofollow" href="Register.jsp">
                                            <div class="d-flex">
                                                <span class="d-flex size-30 bg-light rounded-circle justify-content-center me-2">
                                                    <i class="icon register size-16"></i>
                                                </span>
                                                Tạo tài khoản mới
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5" rel="nofollow" href="Loggin.jsp">
                                            <div class="d-flex">
                                                <span class="d-flex size-30 bg-light rounded-circle justify-content-center me-2">
                                                    <i class="icon login size-16"></i>
                                                </span>
                                                Đăng nhập
                                            </div>
                                        </a>
                                    </li>
                                    <% } else { %>
                                    <!-- Đã đăng nhập -->
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5" rel="nofollow" href="Profile">
                                            <div class="d-flex">
                                                <span class="d-flex size-30 bg-light rounded-circle justify-content-center me-2">
                                                    <i class="icon user size-16"></i>
                                                </span>
                                                Cập nhật thông tin
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5" rel="nofollow" href="ChangePassword.jsp">
                                            <div class="d-flex">
                                                <span class="d-flex size-30 bg-light rounded-circle justify-content-center me-2">
                                                    <i class="icon logout size-16"></i>
                                                </span>
                                                Thay Đổi Mật Khẩu
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item d-flex justify-content-between pt-1 pb-1 pe-5" rel="nofollow" href="Logout.jsp">
                                            <div class="d-flex">
                                                <span class="d-flex size-30 bg-light rounded-circle justify-content-center me-2">
                                                    <i class="icon logout size-16"></i>
                                                </span>
                                                Đăng xuất
                                            </div>
                                        </a>
                                    </li>
                                    <% } %>
                                </ul>
                            </div>
                            <%
Integer state = (Integer) session.getAttribute("state");
if (state != null) {
                            %>
                            <a class="btn btn-red text-white rounded-4 align-items-center justify-content-center ms-4"
                               style="
                               background-color: red;
                               width: 150px;
                               height: 40px;
                               display: flex;
                               align-items: center;
                               justify-content: center;
                               "
                               rel="nofollow"
                               href="GetPostRooms?email=<%=username%>">
                                <i class="icon posting white me-2"></i>Đăng tin
                            </a>
                            <%
                            } else {
                            %>
                            <a class="btn btn-blue text-white rounded-4 align-items-center justify-content-center ms-4"
                               style="
                               background-color: blue;
                               width: 150px;
                               height: 40px;
                               display: flex;
                               align-items: center;
                               justify-content: center;
                               "
                               rel="nofollow"
                               href="#">
                                <i class="icon upgrade white me-2"></i>Nâng cấp
                            </a>
                            <%
                            }
                            %>


                        </div>
                    </div>
                </div>
            </div>
            <div
                class="d-flex d-lg-none align-items-center p-2 pe-0 ms-4 text-nowrap text-body cursor-pointer"
                data-bs-toggle="offcanvas"
                data-bs-target="#offcanvasRight"
                aria-controls="offcanvasRight"
                style="
                border: 1px solid #ddd;
                border-radius: 4px;
                background-color: #f8f9fa;
                transition: background-color 0.3s;
                "
                >
                <i class="icon list size-25 me-2" style="color: #6c757d"></i>
                <span style="font-size: 14px; font-weight: 500; color: #343a40"
                      >Danh mục</span
                >
            </div>
            <div class="container d-none d-lg-block">
                <nav class="pt123__nav">
                    <ul class="d-flex h-100" id="cha">
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê phòng trọ"
                                href="#"
                                >Phòng trọ</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê nhà nguyên căn"
                                href="#"
                                >Nhà nguyên căn</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê căn hộ chung cư"
                                href="#"
                                >Căn hộ chung cư</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê căn hộ mini"
                                href="#"
                                >Căn hộ mini</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê căn hộ dịch vụ"
                                href="#"
                                >Căn hộ dịch vụ</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Tìm người ở ghép"
                                href="#"
                                >Ở ghép</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Cho thuê mặt bằng"
                                href="#"
                                >Mặt bằng</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Blog"
                                href="/blog.html"
                                >Blog</a
                            >
                        </li>
                        <li class="h-100">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="Bảng giá dịch vụ"
                                href="/bang-gia-dich-vu"
                                >Bảng giá dịch vụ</a
                            >
                        </li>
                        <li class="h-100 me-4">
                            <a
                                class="fs-6 d-flex h-100 border-bottom border-2 border-white text-link-body"
                                title="diendan"
                                href="/blog.html"
                                >Diễn Đàn</a
                            >
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
                            
        <div class="container mt-4">
            <h2 class="text-center">Thêm Vị Trí</h2>
            <form action="AddPositionServlet" method="post">
                <!-- Select for Thành phố -->
                <div class="form-group">
                    <label for="city">Thành Phố</label>
                    <select class="form-control" id="city" name="city" onchange="updateDistricts()" required>
                        <option value="">Chọn Thành Phố</option>
                        <option value="Hà Nội">Hà Nội</option>
                        <option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
                        <option value="Đà Nẵng">Đà Nẵng</option>
                    </select>
                </div>

                <!-- Select for Quận -->
                <div class="form-group">
                    <label for="district">Quận</label>
                    <select class="form-control" id="district" name="district" onchange="updateWardAndStreet()" required>
                        <option value="">Chọn Quận</option>
                    </select>
                </div>

                <!-- Select for Phường -->
                <div class="form-group">
                    <label for="ward">Phường</label>
                    <select class="form-control" id="ward" name="ward" required>
                        <option value="">Chọn Phường</option>
                    </select>
                </div>

                <!-- Select for Đường -->
                <div class="form-group">
                    <label for="street">Đường</label>
                    <select class="form-control" id="street" name="street" required>
                        <option value="">Chọn Đường</option>
                    </select>
                </div>

                <!-- Số Nhà -->
                <div class="form-group">
                    <label for="houseNumber">Số Nhà</label>
                    <input type="text" class="form-control" id="houseNumber" name="houseNumber" required>
                </div>

                <!-- Mô Tả -->
                <div class="form-group">
                    <label for="description">Mô Tả</label>
                    <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                </div>

                <button type="submit" class="btn btn-success">Thêm</button>
            </form>
        </div>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
