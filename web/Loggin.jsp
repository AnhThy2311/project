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
                                        <button
                                            type="button"
                                            data-bs-toggle="offcanvas"
                                            data-bs-target="#offcanvasAdvance"
                                            aria-controls="offcanvasAdvance"
                                            class="btn btn__funnel ms-2"
                                            >
                                            <i class="bi-funnel me-1"></i>
                                            <span>Filter</span>
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
                        <button class="btn btn-outline-secondary me-2">Đăng ký</button>
                        <button class="btn btn-outline-secondary me-2">Đăng nhập</button>
                        <button class="btn btn-outline-danger me-2">Đăng tin</button>
                    </div>
                </div>
            </div>
        </header>
        <div class="login-container">
            <form class="js-login-form clearfix" action="Login" method="POST">
                <h3 class="text-center mb-4">Login</h3>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="inputPhoneEmailLogin" placeholder="Số điện thoại" 
                           name="loginname" required />
                    <label for="inputPhoneEmailLogin">Email</label>
                </div>

                <div class="form-floating mb-4">
                    <input type="password" class="form-control" id="password" placeholder="password" 
                           name="password" required />
                    <label for="password">Password</label>
                </div>

                <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="text-danger text-center"><%= request.getAttribute("errorMessage") %></p>
                <% } %>
                <% if (request.getAttribute("errorMessage1") != null) { %>
                <p class="text-danger text-center"><%= request.getAttribute("errorMessage1") %></p>
                <% } %>
                <div class="d-grid mb-3">
                    <button type="submit" name="wp-submit-login" class="btn btn-red btn-lg">
                        Login
                    </button>
                </div>

                <p class="text-center">
                    <a class="text-decoration-underline" href="Forgot_Password.jsp">Forgot password?</a>
                </p>
            </form>
            <p class="fs-10 mt-4 pt-4">
               By logging in or creating an account, you agree to the
                <a
                    class="text-decoration-underline"
                    target="_blank"
                    rel="nofollow"
                    href="/quy-dinh-su-dung"
                    >Terms of Use</a
                >
                as
                <a
                    class="text-decoration-underline"
                    target="_blank"
                    rel="nofollow"
                    href="/chinh-sach-bao-mat"
                    >privacy policy</a
                >
                our
            </p>
            <p class="fs-10 m-0">Copyright © 20242024 - 2025</p>
        </div>

        <script>
            // Kiểm tra nếu URL có chứa ?success=true
            if (new URLSearchParams(window.location.search).get("success") === "true") {
                alert("Đăng ký thành công! Vui lòng kiểm tra email để kích hoạt tài khoản.");
            }
        </script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
