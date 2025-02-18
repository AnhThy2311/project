<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Room" %>
<%@ page import="model.Position" %>
<%@ page import="model.Customer" %>
<%@ page import="model.Feedback" %>
<%@ page import="java.time.Duration" %>
<%@ page import="java.time.LocalDateTime" %>

<%
    List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
    Room room = (Room) request.getAttribute("room");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <!-- In the head section -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <!-- At the end of the body section -->
        <title>Room Detail</title>
    </head>
    <body>
        <%@ include file="./Header.jsp" %>
        <main>
            <div class="container mt-4">
                <div class="row mt-3">
                    <div class="col-md-9 col-lg-8">
                        <div class="post__photos mb-3">
                            <div id="carousel_Photos" class="carousel photos bg-white shadow-sm slide pointer-event rounded" data-bs-touch="true"
                                 style="background-color: lightgray; border-top-left-radius: 8px; border-top-right-radius: 8px; height: 300px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                                <div class="carousel-inner bg-dark rounded-top" style="width: 100%; height: 100%">
                                    <div class="carousel-item" data-bs-toggle="offcanvas" data-bs-target="#offcanvasPhotos" aria-controls="offcanvasPhotos"><img class="d-block mx-auto lazy_done" style="height: 300px" alt="Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh" class="lazy_done" src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/51e2f7bc-e1ae-44cf-b46c-91b0f021d7a0_1739092492.jpg" data-src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/51e2f7bc-e1ae-44cf-b46c-91b0f021d7a0_1739092492.jpg" data-loaded="true"></div>
                                    <div class="carousel-item" data-bs-toggle="offcanvas" data-bs-target="#offcanvasPhotos" aria-controls="offcanvasPhotos"><img class="d-block mx-auto lazy_done" style="height: 300px" alt="Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh" class="lazy_done" src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/3879967d-f64a-4c1e-87e4-6fb1d0c8b928_1739092492.jpg" data-src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/3879967d-f64a-4c1e-87e4-6fb1d0c8b928_1739092492.jpg" data-loaded="true"></div>
                                    <div class="carousel-item" data-bs-toggle="offcanvas" data-bs-target="#offcanvasPhotos" aria-controls="offcanvasPhotos"><img class="d-block mx-auto lazy_done" style="height: 300px" alt="Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh" class="lazy_done" src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/da87b3e6-a4c8-49a5-be91-2a461679cba3_1739092493.jpg" data-src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/da87b3e6-a4c8-49a5-be91-2a461679cba3_1739092493.jpg" data-loaded="true"></div>
                                    <div class="carousel-item active" data-bs-toggle="offcanvas" data-bs-target="#offcanvasPhotos" aria-controls="offcanvasPhotos"><img class="d-block mx-auto lazy_done" style="height: 300px" alt="Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh" class="lazy_done" src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/71a80b2c-15e0-4d9d-ae51-6ebe45852614_1739092493.jpg" data-src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/71a80b2c-15e0-4d9d-ae51-6ebe45852614_1739092493.jpg" data-loaded="true"></div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carousel_Photos" data-bs-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="visually-hidden">Slide trước</span></button><button class="carousel-control-next" type="button" data-bs-target="#carousel_Photos" data-bs-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="visually-hidden">Slide tiếp theo</span></button>
                            </div>
                            <div class="bg-white shadow-sm rounded-bottom d-flex justify-content-between border-bottom d-lg-none"><button class="bg-white fs-9 w-100 border-0 p-25 " data-bs-toggle="offcanvas" data-bs-target="#offcanvasPhotos" aria-controls="offcanvasPhotos"><i class="icon camera d-block mb-1 mx-auto"></i><span>4 Ảnh</span></button><button class="bg-white fs-9 w-100 border-0 p-25 disabled opacity-25" data-bs-toggle="offcanvas" data-bs-target="#offcanvasVideo" aria-controls="offcanvasVideo"><i class="icon camera-video size-20 d-block lh-1 mx-auto"></i><span>Video</span></button><button class="bg-white fs-9 w-100 border-0 p-25" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMap" aria-controls="offcanvasMap"><i class="icon map d-block mb-1 mx-auto"></i><span>Bản đồ</span></button><button class="bg-white fs-9 w-100 border-0 p-25" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSharePost" aria-controls="offcanvasSharePost"><i class="icon share d-block mb-1 mx-auto"></i><span>Chia sẻ</span></button><button class="bg-white fs-9 w-100 border-0 p-25" data-bs-toggle="offcanvas" data-bs-target="#offcanvasReportPost" aria-controls="offcanvasReportPost"><i class="icon exclamation-triangle d-block mb-1 mx-auto"></i><span>Báo xấu</span></button></div>
                        </div>
                        <div class="bg-white shadow-sm rounded p-4 mb-3">
                            <header class="border-bottom pb-4 mb-4">
                                <h1 class="fs-5 fw-semibold lh-sm mb-2" style="color:#ff5723">Tên phòng: <%= room.getRoomName() %></h1>
                                <address class="lh-sm">
                                    <i class="icon geo-alt size-12 mt-1 me-2"></i>
                                    <h3>Địa chỉ : </h3>
                                    <h4>
                                        nhà:   <%= room.getPosition().getNumber_house() %>, 
                                        <%= room.getPosition().getStreet() %>, 
                                        <%= room.getPosition().getWard() %>, 
                                        <%= room.getPosition().getDistrict() %>, 
                                        <%= room.getPosition().getCity() %>
                                    </h4>
                                </address>

                                <div class="d-flex justify-content-between">
                                    <div class="d-flex">
                                        <span class="text-price fs-5 fw-bold"><%= room.getPrice() %> triệu/tháng</span>
                                        <span class="dot mx-3"></span>
                                        <time>Cập nhật: 1 ngày trước</time>
                                    </div>
                                    <div><span>Mã tin: #${room.roomId}</span></div>
                                </div>
                            </header>
                            <div class="border-bottom pb-3 mb-4">
                                <h2 class="fs-5 mb-3">Thông tin mô tả</h2>
                                <p>${room.description}</p>
                                <h2 class="fs-5 mb-3">Địa chỉ chi tiết</h2>
                                <p><%= room.getPosition().getDescription()%></p>
                            </div>

                            <div class="alert alert-warning mt-4 p-3">
                                <ul class="fs-10">
                                    <li class="pb-2 fw-bold">Lưu ý:</li>
                                    <li class="pb-2">Chỉ đặt khi cọc xác định được chủ nhà và có thỏa thuận biên nhận rõ ràng. Kiểm tra mọi điều khoản và yêu cầu liệt kê tất cả chi phí hàng tháng vào hợp đồng. <a rel="nofollow" target="_blank" class="text-link text-decoration-underline" href="/kinh-nghiem-c822.html">Xem thêm</a></li>
                                    <li>Mọi thông tin liên quan đến tin đăng này chỉ mang tính chất tham khảo. Nếu bạn thấy rằng tin đăng này không đúng hoặc có dấu hiệu lừa đảo, <span class="text-link text-decoration-underline" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasReportPost" aria-controls="offcanvasReportPost">hãy phản ánh với chúng tôi.</span></li>
                                </ul>
                            </div>
                            
                            
                        </div>
                    </div>
                    <div class="col-md-9 col-lg-4">
                        <div class="bg-white shadow-sm rounded p-3 mb-3 d-none d-lg-block" style="height:300px">
                            <div class="mb-3">
                                <img style = "height: 100px"class="avatar size-100 d-block p-1 m-auto" src="https://phongtro123.com/images/default-user.svg">
                                <div class="mt-3 text-center">
                                    <span class="fs-5 fw-medium"><%= room.getCustomer().getFullName()%></span>
                                </div>
                            </div>
                            <div class="d-flex gap-2">
                                <a class="btn btn-primary text-white d-flex justify-content-center rounded-4 flex-grow-1 px-3 py-2" 
                                   target="_blank" rel="nofollow" href="https://zalo.me/0913113234"
                                   onclick="return checkLogin(event)">
                                    <i class="icon chat-text white me-2"></i> Liên Hệ
                                </a>
                                <a class="btn btn-success text-white d-flex justify-content-center rounded-4 flex-grow-1 px-3 py-2" 
                                   href="#"
                                   onclick="return checkLogin(event)">
                                    <i class="icon house white me-2"></i> Thuê Trọ
                                </a>
                                <a class="btn btn-warning text-white d-flex justify-content-center rounded-4 flex-grow-1 px-3 py-2" 
                                   href="#" 
                                   onclick="openDatePickerModal(event)">
                                    <i class="icon calendar white me-2"></i> Đặt Lịch
                                </a>
                            </div>
                            <div class="d-flex justify-content-between mt-3">
                                <button class="btn btn-white btn__save__lg fs-7 d-flex text-nowrap js-btn-save" 
                                        data-post-id="593916" title="Tin đã lưu" onclick="return checkLogin(event)">
                                    <i class="icon heart me-2"></i><span>Lưu tin</span>
                                </button>

                                <button class="btn btn-white fs-7 text-nowrap d-flex" 
                                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasSharePost" 
                                        aria-controls="offcanvasSharePost" onclick="return checkLogin(event)">
                                    <i class="icon share me-2"></i><span>Chia sẻ</span>
                                </button>

                                <button class="btn btn-white fs-7 text-nowrap d-flex" 
                                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasReportPost" 
                                        aria-controls="offcanvasReportPost" onclick="return checkLogin(event)">
                                    <i class="icon exclamation-triangle me-2"></i><span>Báo xấu</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bg-white shadow-sm rounded p-3 mb-3">
                    <h2 class="fs-5 mb-3">Đánh giá khách thuê</h2>
                    <!-- Feedback Input Section -->
                    <div class="mb-4">
                        <textarea class="form-control" 
                                  style="min-height: 100px; resize: vertical;" 
                                  placeholder="Write your feedback here..."></textarea>
                        <button class="btn btn-primary mt-2">Submit Feedback</button>
                    </div>

                    <!-- Feedback Cards -->
                    <div class="feedback-cards">
                        <% if (feedbacks != null && !feedbacks.isEmpty()) { 
                            for (Feedback fb : feedbacks) { 
                                Customer customer = fb.getCustomer();
                                LocalDateTime creationDate = fb.getCreationDate();
                                LocalDateTime now = LocalDateTime.now();
                                long minutesAgo = Duration.between(creationDate, now).toMinutes();
                        %>
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-1 text-center">
                                            <img style="height: 70px" class="avatar size-100 d-block p-1 m-auto" src="https://phongtro123.com/images/default-user.svg">
                                        </div>
                                        <div class="col-11">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <div>
                                                    <span class="fw-bold"><%= customer.getFullName() %></span>
                                                    <span class="text-muted ms-2">• Posted <%= minutesAgo %> minutes ago</span>
                                                </div>
                                                <div class="dropdown">
                                                    <button class="btn btn-link p-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                        <i class="fa-solid fa-ellipsis"></i>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="#">Edit</a></li>
                                                        <li><a class="dropdown-item" href="#">Delete</a></li>
                                                        <li><a class="dropdown-item" href="#">Report</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="feedback-content">
                                                <p class="mb-0"><%= fb.getContent() %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <% 
                            } 
                        } else { 
                        %>
                            <p class="text-muted">No feedback available.</p>
                        <% } %>
                    </div>
                </div>

            </div>
            <div class="fixed-bottom bg-white d-lg-none border-top shadow-lg p-2 px-3">
                <div class="mb-1 fs-5 fw-medium"><span>4 triệu/tháng</span><span class="dot"></span><span>45 m<sup>2</sup></span></div>
                <div class="d-flex w-100"><a class="btn btn-green btn-lg text-white p-25 rounded-4 fs-6 fw-medium w-100 d-flex justify-content-center" rel="nofollow" target="_blank" href="tel:0913113234"><i class="icon telephone-fill white me-2"></i>0913113234</a><a class="btn btn-primary btn-lg p-25 rounded-4 fs-6 fw-medium w-100 mx-2 d-flex justify-content-center" rel="nofollow" target="_blank" href="https://zalo.me/0913113234"><i class="icon chat-text white me-2"></i>Zalo</a><button class="btn__save__lg border-0 p-25 rounded-4 fs-6 d-flex justify-content-center text-nowrap js-btn-save" data-post-id="593916" title="Tin đã lưu"><i class="icon heart me-2"></i><span>Lưu tin</span></button></div>
            </div>
            <div class="offcanvas offcanvas-bottom text-bg-dark" tabindex="-1" id="offcanvasPhotos" aria-labelledby="offcanvasPhotosLabel" style="width: 100%; --bs-offcanvas-height: 100%; top: 0; left: 0; transition: none;">
                <div class="offcanvas-header border-bottom border-black px-4">
                    <div class="d-flex w-100 justify-content-center"><button class="me-2 btn btn-white" type="button"><span>Hình ảnh</span></button><button class="btn btn-secondary text-white" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMap" aria-controls="offcanvasMap"><span>Bản đồ</span></button></div>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body p-0">
                    <div id="carousel_PhotosFullScreen" class="carousel photos slide h-100">
                        <div class="carousel-inner" style="height: calc(100% - 84px);">
                            <div class="carousel-item active"><img src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/51e2f7bc-e1ae-44cf-b46c-91b0f021d7a0_1739092492.jpg"></div>
                            <div class="carousel-item "><img src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/3879967d-f64a-4c1e-87e4-6fb1d0c8b928_1739092492.jpg"></div>
                            <div class="carousel-item "><img src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/da87b3e6-a4c8-49a5-be91-2a461679cba3_1739092493.jpg"></div>
                            <div class="carousel-item "><img src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/71a80b2c-15e0-4d9d-ae51-6ebe45852614_1739092493.jpg"></div>
                        </div>
                        <div class="carousel-indicators position-relative d-flex flex-wrap p-3 px-2 m-0"><button type="button" data-bs-target="#carousel_PhotosFullScreen" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 0"><img class="size-50" src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2025/02/09/51e2f7bc-e1ae-44cf-b46c-91b0f021d7a0_1739092492.jpg"></button><button type="button" data-bs-target="#carousel_PhotosFullScreen" data-bs-slide-to="1" class="" aria-current="false" aria-label="Slide 1"><img class="size-50" src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2025/02/09/3879967d-f64a-4c1e-87e4-6fb1d0c8b928_1739092492.jpg"></button><button type="button" data-bs-target="#carousel_PhotosFullScreen" data-bs-slide-to="2" class="" aria-current="false" aria-label="Slide 2"><img class="size-50" src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2025/02/09/da87b3e6-a4c8-49a5-be91-2a461679cba3_1739092493.jpg"></button><button type="button" data-bs-target="#carousel_PhotosFullScreen" data-bs-slide-to="3" class="" aria-current="false" aria-label="Slide 3"><img class="size-50" src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2025/02/09/71a80b2c-15e0-4d9d-ae51-6ebe45852614_1739092493.jpg"></button></div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carousel_PhotosFullScreen" data-bs-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="visually-hidden">Previous</span></button><button class="carousel-control-next" type="button" data-bs-target="#carousel_PhotosFullScreen" data-bs-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="visually-hidden">Next</span></button>
                    </div>
                </div>
            </div>
            <div class="offcanvas text-bg-dark" tabindex="-1" id="offcanvasMap" aria-labelledby="offcanvasMapLabel" style="width: 100%; --bs-offcanvas-height: 100%; top: 0; left: 0; transition: none;">
                <div class="offcanvas-header border-bottom border-black px-4">
                    <div class="d-flex w-100 justify-content-center"><button class="me-2 btn btn-secondary text-white" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasPhotos" aria-controls="offcanvasPhotos"><span>Hình ảnh</span></button><button class="btn btn-white" type="button"><span>Bản đồ</span></button></div>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body p-0"><iframe title="Vị trí cho thuê" width="100%" height="100%" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=12/4b Đường Hoàng Hoa Thám, Phường 7, Quận Bình Thạnh, Hồ Chí Minh&amp;key=AIzaSyD6Coia3ssHYuRKJ2nDysWBdSlVlBCzKAw&amp;zoom=14" allowfullscreen=""></iframe></div>
            </div>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasReportPost" aria-labelledby="offcanvasReportPostLabel" style="--bs-offcanvas-height: 80%;">
                <div class="offcanvas-header shadow-sm px-4">
                    <div class="fs-4">Phản ánh tin đăng</div>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body p-4">
                    <form class="form-post-report js-form-submit-data" data-action-url="https://phongtro123.com/api/report/post" novalidate="novalidate">
                        <p class="fw-medium fs-5">Lý do phản ánh:</p>
                        <div class="form-check mb-2"><input class="form-check-input" type="radio" name="report_type" id="report_scam" value="scam" checked="checked"><label class="form-check-label" for="report_scam"> Tin có dấu hiệu lừa đảo </label></div>
                        <div class="form-check mb-2"><input class="form-check-input" type="radio" name="report_type" id="report_duplicate" value="duplicate"><label class="form-check-label" for="report_duplicate"> Tin trùng lặp nội dung </label></div>
                        <div class="form-check mb-2"><input class="form-check-input" type="radio" name="report_type" id="report_cant_contact" value="cant_contact"><label class="form-check-label" for="report_cant_contact"> Không liên hệ được chủ tin đăng </label></div>
                        <div class="form-check mb-2"><input class="form-check-input" type="radio" name="report_type" id="report_fake" value="fake"><label class="form-check-label" for="report_fake"> Thông tin không đúng thực tế (giá, diện tích, hình ảnh...) </label></div>
                        <div class="form-check mb-2"><input class="form-check-input" type="radio" name="report_type" id="report_other" value="other"><label class="form-check-label" for="report_other"> Lý do khác </label></div>
                        <div class="form-floating mt-3"><textarea class="form-control form-control-lg" id="report_detail" rows="3" name="message" placeholder="Mô tả thêm" style="height: 100px;"></textarea><label for="message">Mô tả thêm</label></div>
                        <p class="fw-medium fs-5 mt-4 mb-0">Thông tin liên hệ</p>
                        <div class="mt-3"><label for="fullname" class="form-label">Họ tên của bạn</label><input class="form-control form-control-lg fs-6 required" type="text" name="fullname" id="fullname" required="" data-msg-required="Bạn vui lòng cho biết tên" value=""></div>
                        <div class="mt-3"><label for="phone" class="form-label">Số điện thoại của bạn</label><input class="form-control form-control-lg fs-6 required" type="text" name="phone" id="phone" required="" data-msg-required="Bạn vui lòng cho biết số điện thoại" value=""></div>
                        <div class="g-recaptcha mt-3" data-sitekey="6LeIBEgaAAAAABhJRc5wW2KohNEXc7EKbsGncvgT" data-callback="recaptchaCallback">
                            <div style="width: 304px; height: 78px;">
                                <div><iframe title="reCAPTCHA" width="304" height="78" role="presentation" name="a-976bqhqj2o6m" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6LeIBEgaAAAAABhJRc5wW2KohNEXc7EKbsGncvgT&amp;co=aHR0cHM6Ly9waG9uZ3RybzEyMy5jb206NDQz&amp;hl=vi&amp;v=PcIQSvk4Y5ANjYUx0f4froA1&amp;size=normal&amp;cb=oih8q58x3o5x"></iframe></div>
                                <textarea id="g-recaptcha-response" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea>
                            </div>
                            <iframe style="display: none;"></iframe>
                        </div>
                        <input type="hidden" name="post_id" value="593916">
                        <div class="mt-4 pt-2"><button type="submit" disabled="" class="btn btn-red btn-lg w-100 js-btn-hoan-tat disabled">Gửi phản ánh</button></div>
                    </form>
                </div>
            </div>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasSharePost" aria-labelledby="offcanvasSharePostLabel" style="--bs-offcanvas-height: 50%;">
                <div class="offcanvas-header shadow-sm px-4">
                    <div class="fs-4">Chia sẻ</div>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body p-4">
                    <p>Chia sẻ đường dẫn tin đăng</p>
                    <div class="form-control form-control-lg border border-secondary-subtle fs-6">https://phongtro123.com/cho-thue-can-ho-mini-day-du-tien-nghi-ngay-duong-hoang-hoa-tham-quan-binh-thanh-pr593916.html</div>
                    <div class="btn btn-red btn-lg mt-3 w-100 d-flex justify-content-center js-share-link-button" title="Sao chép liên kết" data-clipboard-text="https://phongtro123.com/cho-thue-can-ho-mini-day-du-tien-nghi-ngay-duong-hoang-hoa-tham-quan-binh-thanh-pr593916.html"><i class="icon copy white me-25"></i><span>Sao chép</span></div>
                </div>
            </div>
            <div class="container mt-4">
                <div class="bg-white shadow-sm rounded">
                    <div class="row">
                        <div class="col-md-6"><img class="d-block object-fit-contain mx-auto" src="/images/contact-us-pana-orange.svg" style="max-height: 390px;" alt="Hỗ trợ chủ nhà đăng tin"></div>
                        <div class="col-md-6 text-center p-5">
                            <i class="icon headset size-30 d-block mx-auto"></i>
                            <div class="fs-2 mt-2" id="offcanvasSupportLabel">Hỗ trợ chủ nhà đăng tin</div>
                            <p class="mt-3 lead">Nếu bạn cần hỗ trợ đăng tin, vui lòng liên hệ số điện thoại bên dưới:</p>
                            <div class="rounded-4 p-4 mb-4 text-center"><a class="btn btn-red btn-lg text-white d-flex justify-content-center rounded-4" target="_blank" rel="nofollow" href="tel:0909316890"><i class="icon telephone-fill white me-2"></i>ĐT: 0909316890 </a><a class="btn btn-primary btn-lg text-white d-flex justify-content-center rounded-4 mt-2" target="_blank" rel="nofollow" href="https://zalo.me/0909316890"><i class="icon chat-text white me-2"></i>Zalo: 0909316890 </a></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- Modal để hiển thị lịch -->
        <form>
            <div id="datePickerModal" class="modal fade" tabindex="-1" aria-labelledby="datePickerModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="datePickerModalLabel">Chọn ngày đặt lịch</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input type="text" id="datePickerInput" class="form-control" placeholder="Chọn ngày">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary" id="confirmDate">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <script>
            function checkLogin(event) {
                var username = '<%= username %>';
                if (!username || username === 'null') {
                    event.preventDefault(); // Ngăn chặn điều hướng mặc định
                    window.location.href = 'Loggin.jsp'; // Chuyển hướng đến trang đăng nhập
                    return false;
                }
                return true;
            }
        </script>
        <script>
            // Mở modal khi click vào nút "Đặt Lịch"
            function openDatePickerModal(event) {
                event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>
                var modal = new bootstrap.Modal(document.getElementById('datePickerModal'));
                modal.show();
            }

            // Khởi tạo Flatpickr
            document.addEventListener("DOMContentLoaded", function () {
                flatpickr("#datePickerInput", {
                    dateFormat: "Y-m-d", // Định dạng ngày tháng
                    minDate: "today", // Chỉ cho phép chọn ngày từ hôm nay trở đi
                    locale: "vi", // Ngôn ngữ tiếng Việt (nếu cần)
                });

                // Xử lý sự kiện khi người dùng xác nhận ngày
                document.getElementById('confirmDate').addEventListener('click', function () {
                    var selectedDate = document.getElementById('datePickerInput').value;
                    if (selectedDate) {
//                        alert("Bạn đã chọn ngày: " + selectedDate);
                        alert("Bạn đã đặt lịch thành công vui lòng chờ xác nhận ");
                        // Gửi dữ liệu ngày đã chọn lên server hoặc xử lý tiếp
                    } else {
                        alert("Vui lòng chọn ngày!");
                    }
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
