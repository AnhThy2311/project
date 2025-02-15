<%-- 
    Document   : Header1
    Created on : Feb 11, 2025, 2:50:27 AM
    Author     : son
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Room" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
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

        <div class="container mt-4" template="page_category">
            <div class="row">
                <div class="col-md-9 col-lg-8">
                    <header class="mt-2 mb-3">
                        <h1 class="fs-4 fw-medium mb-2 lh-sm">Kênh thông tin Phòng trọ số 1 Việt Nam</h1>
                        <p class="fs-7 m-0">Có 3.490 tin đăng cho thuê</p>
                    </header>

                    <ul class="list-unstyled">
                        <% 
                            // Get rooms from the request
                            ArrayList<Room> rooms = (ArrayList<Room>) request.getAttribute("rooms");
                            if (rooms != null && !rooms.isEmpty()) {
                                for (Room room : rooms) { 
                        %>
                        <li class="d-flex bg-white shadow-sm rounded p-3 mt-3">
                            <figure class="post__thumb__vip2">
                                <a href="RoomDetails.jsp?roomId=<%= room.getRoomId() %>">
                                    <img class="lazy_done" src="${pageContext.request.contextPath}/images/<%= room.getImage() %>" 
                                         alt="<%= room.getRoomName() %>" width="150">
                                </a>
                            </figure>
                            <div class="flex-grow-1 ps-3">
                                <h3 class="fs-6 fw-medium text-uppercase mb-2">
                                    <a href="RoomDetails.jsp?roomId=<%= room.getRoomId() %>">
                                        <%= room.getRoomName() %>
                                    </a>
                                </h3>
                                <div class="mb-2">
                                    <span class="text-price fw-semibold fs-6"><%= room.getPrice() %> triệu/tháng</span>
                                    <span class="dot mx-2">•</span>
                                    <span>45 m<sup>2</sup></span>
                                    <span class="dot mx-2">•</span>
                                    <a href="#">
                                        <%= room.getPosition().getNumber_house() %>, 
                                        <%= room.getPosition().getStreet() %>, 
                                        <%= room.getPosition().getWard() %>, 
                                        <%= room.getPosition().getDistrict() %>, 
                                        <%= room.getPosition().getCity() %>
                                    </a>
                                </div>
                                <p class="fs-8 text-secondary">
                                    <%= room.getDescription() %>
                                </p>
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex w-50">
                                        <img class="avatar size-35 me-2" 
                                             src="${pageContext.request.contextPath}/images/<%= room.getCustomer().getImage() != null ? room.getCustomer().getImage() : "/images/default_user.jpg" %>" 
                                             alt="<%= room.getCustomer().getFullName() %>" width="35">
                                        <div>
                                            <span><%= room.getCustomer().getFullName() %></span>
                                            <br>
                                            <small class="text-secondary">SĐT: <%= room.getCustomer().getPhone() %></small>
                                            <br>
                                            <small class="text-secondary">Email: <%= room.getCustomer().getEmail() %></small>
                                        </div>
                                    </div>
                                    <div class="w-auto d-flex align-items-center">
                                        <button class="btn btn-white btn__save d-flex px-2">
                                            <i class="icon heart size-18"></i> Lưu tin này
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <% 
                                }
                            } 
                        %>
                           
                    </ul>
                </div>
            </div>
        </div>

        <div class="container mt-4">
            <div class="bg-white shadow-sm rounded">
                <div class="row">
                    <div class="col-md-6"><img class="d-block object-fit-contain mx-auto" src="/images/contact-us-pana-orange.svg" style="max-height: 390px;" alt="Hỗ trợ chủ nhà đăng tin"></div>
                    <div class="col-md-6 text-center p-5"><i class="icon headset size-30 d-block mx-auto"></i>
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
    </body>
</html>
