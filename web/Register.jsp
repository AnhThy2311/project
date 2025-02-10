<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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
    </head>
    <body>
        <%@ include file="./Header.jsp" %>
        <div class="container mt-3 mb-3 mt-lg-5 mb-lg-5">
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-7">
                    <div class="bg-white shadow-sm rounded-4 p-4 p-lg-5 pt-4">
                        <div class="d-flex justify-content-between mb-5">
                            <a
                                class="fs-3 fw-semibold text-center text-body border-2 border-bottom border-red pb-3 w-100"
                                href="Loggin.jsp"
                                >Đăng nhập</a
                            >
                            <a
                                class="fs-3 fw-light text-center text-secondary border-2 border-bottom border-light-subtle pb-3 w-100"
                                href="Register.jsp"
                                >Tạo tài khoản mới</a
                            >
                        </div>
                        <form class="js-register-form clearfix" action="InsertCustomer" method="POST">
                            <div class="form-floating mb-3">
                                <input
                                    type="text"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    id="inputFullName"
                                    placeholder="Họ tên"
                                    minlength="3"
                                    name="fullname"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="inputFullName">Họ tên</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input
                                    type="text"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    id="inputPhone"
                                    placeholder="Số điện thoại"
                                    minlength="10"
                                    maxlength="11"
                                    name="phone_number"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="inputPhone">Số điện thoại</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input
                                    type="email"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    id="inputEmail"
                                    placeholder="Email"
                                    name="email"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="inputEmail">Email</label>
                                <% String errorMessage = (String) request.getAttribute("errorMessage");
                                   if (errorMessage != null) { %>
                                <p style="color: red;"><%= errorMessage %></p>
                                <% } %>
                            </div>

                            <div class="form-floating mb-3">
                                <input
                                    type="date"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    id="inputDob"
                                    name="date_of_birth"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="inputDob">Ngày sinh</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input
                                    type="password"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    placeholder="Mật khẩu"
                                    minlength="6"
                                    id="password"
                                    name="password"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="password">Mật khẩu</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input
                                    type="password"
                                    class="form-control form-control-lg rounded-4 border-secondary-subtle"
                                    placeholder="Nhập lại Mật khẩu"
                                    minlength="6"
                                    id="Confirmpassword"
                                    name="Confirmpassword"
                                    required=""
                                    data-msg="Không được phép để trống"
                                    />
                                <label for="Confirmpassword">Nhập lại Mật khẩu</label>
                            </div>

                            <div class="d-grid mb-4">
                                <button
                                    type="submit"
                                    name="wp-submit-register"
                                    class="btn btn-red btn-lg rounded-4"
                                    style="background-color: red; color: white"
                                    >
                                    Tạo tài khoản
                                </button>
                            </div>
                        </form>

                        <p class="fs-10 mt-4 pt-4">
                            Qua việc đăng nhập hoặc tạo tài khoản, bạn đồng ý với các
                            <a
                                class="text-decoration-underline"
                                target="_blank"
                                rel="nofollow"
                                href="/quy-dinh-su-dung"
                                >quy định sử dụng</a
                            >
                            cũng như
                            <a
                                class="text-decoration-underline"
                                target="_blank"
                                rel="nofollow"
                                href="/chinh-sach-bao-mat"
                                >chính sách bảo mật</a
                            >
                            của chúng tôi
                        </p>
                        <p class="fs-10 m-0">Bản quyền © 2015 - 2025 Phongtro123.com</p>
                    </div>
                </div>
            </div>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
