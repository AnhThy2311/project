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
        <link rel="stylesheet" href="css/loggin.css" />
    </head>
    <body>
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
                        <a class="nav-link active" href="/" style="padding-left: 20px"
                           >Trang chủ</a
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
                        <button class="btn btn-outline-secondary me-2">
                            <i class="bi-heart"></i>
                        </button>
                        <a href="Register.jsp" class="btn btn-outline-secondary me-2">Đăng ký</a>
                        <a href="Loggin.jsp" class="btn btn-outline-secondary me-2">Đăng nhập</a>
                        <button class="btn btn-outline-danger me-2">Đăng tin</button>
                    </div>
                </div>
            </div>
        </header>
        <div class="register-container">
            <h2 class="text-center text-danger">Đăng ký</h2>
            <form class="js-register-form clearfix" action="InsertCustomer" method="POST">

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="inputFullName" name="fullname" required minlength="3">
                    <label for="inputFullName">Họ và Tên</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="inputPhone" name="phone_number" required>
                    <label for="inputPhone">Số điện thoại</label>
                    <p id="phone-error" class="text-danger text-small"></p>
                </div>

                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="inputEmail" name="email" required>
                    <label for="inputEmail">Email</label>
                    <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="text-danger text-small"><%= request.getAttribute("errorMessage") %></p>
                    <% } %>
                </div>

                <div class="form-floating mb-3">
                    <input type="date" class="form-control" id="inputDob" name="date_of_birth" required>
                    <label for="inputDob">Ngày sinh</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="password" name="password" required minlength="6">
                    <label for="password">Mật khẩu</label>
                    <p id="password-error" class="text-danger text-small"></p>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="Confirmpassword" name="Confirmpassword" required minlength="6">
                    <label for="Confirmpassword">Nhập lại mật khẩu</label>
                    <p id="confirm-password-error" class="text-danger text-small"></p>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-red">Đăng ký</button>
                </div>
            </form>

            <p class="fs-10 mt-4 pt-4">
                Bằng cách đăng nhập hoặc tạo tài khoản, bạn đồng ý với
                <a
                    class="text-decoration-underline"
                    target="_blank"
                    rel="nofollow"
                    href="/quy-dinh-su-dung"
                    >Điều khoản sử dụng</a
                >
                bằng
                <a
                    class="text-decoration-underline"
                    target="_blank"
                    rel="nofollow"
                    href="/chinh-sach-bao-mat"
                    >chính sách bảo mật</a
                >
                của chúng tôi
            </p>
            <p class="fs-10 m-0">Copyright © 20242024 - 2025</p>
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
    document.querySelector(".js-register-form").addEventListener("submit", function (event) {
        let isValid = true;

        // Lấy giá trị của các input
        let fullName = document.getElementById("inputFullName").value.trim();
        let phone = document.getElementById("inputPhone").value.trim();
        let email = document.getElementById("inputEmail").value.trim();
        let dob = document.getElementById("inputDob").value.trim();
        let password = document.getElementById("password").value;
        let confirmPassword = document.getElementById("Confirmpassword").value;

        // Lấy phần hiển thị lỗi
        let phoneError = document.getElementById("phone-error");
        let passwordError = document.getElementById("password-error");
        let confirmPasswordError = document.getElementById("confirm-password-error");

        // Xóa thông báo lỗi cũ
        phoneError.innerText = "";
        passwordError.innerText = "";
        confirmPasswordError.innerText = "";

        // Kiểm tra các trường không được để trống
        if (!fullName || !phone || !email || !dob || !password || !confirmPassword) {
            alert("Vui lòng điền đầy đủ tất cả các ô!");
            event.preventDefault();
            return;
        }

        // Kiểm tra số điện thoại: đúng 10 số, chỉ chứa số
        let phonePattern = /^\d{10}$/;
        if (!phonePattern.test(phone)) {
            phoneError.innerText = "Số điện thoại phải có đúng 10 số!";
            isValid = false;
        }

        // Kiểm tra định dạng email
        let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            alert("Email không hợp lệ!");
            isValid = false;
        }

        // Kiểm tra mật khẩu (6 ký tự, 1 chữ hoa, 1 số, 1 ký tự đặc biệt)
        let passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$/;
        if (!passwordPattern.test(password)) {
            passwordError.innerText = "Mật khẩu phải có ít nhất 6 ký tự, 1 chữ hoa, 1 số, 1 ký tự đặc biệt!";
            isValid = false;
        }

        // Kiểm tra mật khẩu nhập lại
        if (password !== confirmPassword) {
            confirmPasswordError.innerText = "Mật khẩu nhập lại không khớp!";
            isValid = false;
        }

        // Nếu có lỗi, ngăn form submit
        if (!isValid) {
            event.preventDefault();
        }
    });
</script>
</body>
</html>
