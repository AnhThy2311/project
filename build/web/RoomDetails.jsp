    <%-- 
    Document   : RoomDetails
    Created on : Feb 11, 2025, 3:03:45 AM
    Author     : son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Room" %>
<%@ page import="model.Position" %>
<%@ page import="model.Customer" %>
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
        <!-- Bootstrap 5 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <title>Room Detail</title>
    </head>
    <body>
        <%@ include file="./Header.jsp" %>
        <main>
            <div class="container mt-4">
               <div class="row mt-3">
                  <div class="col-md-9 col-lg-8">
                     <div class="post__photos mb-3">
                        <div id="carousel_Photos" class="carousel photos bg-white shadow-sm slide pointer-event rounded" data-bs-touch="true">
                           <div class="carousel-inner bg-dark rounded-top">
                              <div class="carousel-item" data-bs-toggle="offcanvas" data-bs-target="#offcanvasPhotos" aria-controls="offcanvasPhotos"><img alt="Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh" class="lazy_done" src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/51e2f7bc-e1ae-44cf-b46c-91b0f021d7a0_1739092492.jpg" data-src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/51e2f7bc-e1ae-44cf-b46c-91b0f021d7a0_1739092492.jpg" data-loaded="true"></div>
                              <div class="carousel-item" data-bs-toggle="offcanvas" data-bs-target="#offcanvasPhotos" aria-controls="offcanvasPhotos"><img alt="Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh" class="lazy_done" src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/3879967d-f64a-4c1e-87e4-6fb1d0c8b928_1739092492.jpg" data-src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/3879967d-f64a-4c1e-87e4-6fb1d0c8b928_1739092492.jpg" data-loaded="true"></div>
                              <div class="carousel-item" data-bs-toggle="offcanvas" data-bs-target="#offcanvasPhotos" aria-controls="offcanvasPhotos"><img alt="Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh" class="lazy_done" src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/da87b3e6-a4c8-49a5-be91-2a461679cba3_1739092493.jpg" data-src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/da87b3e6-a4c8-49a5-be91-2a461679cba3_1739092493.jpg" data-loaded="true"></div>
                              <div class="carousel-item active" data-bs-toggle="offcanvas" data-bs-target="#offcanvasPhotos" aria-controls="offcanvasPhotos"><img alt="Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh" class="lazy_done" src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/71a80b2c-15e0-4d9d-ae51-6ebe45852614_1739092493.jpg" data-src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2025/02/09/71a80b2c-15e0-4d9d-ae51-6ebe45852614_1739092493.jpg" data-loaded="true"></div>
                           </div>
                           <button class="carousel-control-prev" type="button" data-bs-target="#carousel_Photos" data-bs-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="visually-hidden">Slide trước</span></button><button class="carousel-control-next" type="button" data-bs-target="#carousel_Photos" data-bs-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="visually-hidden">Slide tiếp theo</span></button>
                        </div>
                        <div class="bg-white shadow-sm rounded-bottom d-flex justify-content-between border-bottom d-lg-none"><button class="bg-white fs-9 w-100 border-0 p-25 " data-bs-toggle="offcanvas" data-bs-target="#offcanvasPhotos" aria-controls="offcanvasPhotos"><i class="icon camera d-block mb-1 mx-auto"></i><span>4 Ảnh</span></button><button class="bg-white fs-9 w-100 border-0 p-25 disabled opacity-25" data-bs-toggle="offcanvas" data-bs-target="#offcanvasVideo" aria-controls="offcanvasVideo"><i class="icon camera-video size-20 d-block lh-1 mx-auto"></i><span>Video</span></button><button class="bg-white fs-9 w-100 border-0 p-25" data-bs-toggle="offcanvas" data-bs-target="#offcanvasMap" aria-controls="offcanvasMap"><i class="icon map d-block mb-1 mx-auto"></i><span>Bản đồ</span></button><button class="bg-white fs-9 w-100 border-0 p-25" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSharePost" aria-controls="offcanvasSharePost"><i class="icon share d-block mb-1 mx-auto"></i><span>Chia sẻ</span></button><button class="bg-white fs-9 w-100 border-0 p-25" data-bs-toggle="offcanvas" data-bs-target="#offcanvasReportPost" aria-controls="offcanvasReportPost"><i class="icon exclamation-triangle d-block mb-1 mx-auto"></i><span>Báo xấu</span></button></div>
                     </div>
                     <div class="bg-white shadow-sm rounded p-4 mb-3">
                        <header class="border-bottom pb-4 mb-4" style="--bs-border-color: #f1f1f1;">
                           <h1 class="fs-5 fw-semibold lh-sm mb-2" style="color:#ff5723"> Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh </h1>
                           <address class="lh-sm"><i class="icon geo-alt size-12 mt-1 me-2"></i>12/4b Đường Hoàng Hoa Thám, Phường 7, Quận Bình Thạnh, Hồ Chí Minh - </address>
                           <div class="d-flex justify-content-between">
                              <div class="d-flex"><span class="text-price fs-5 fw-bold">4 triệu/tháng</span><span class="dot mx-3"></span><span>45 m<sup>2</sup></span><span class="dot mx-3"></span><time title="Chủ Nhật, 16:15 09/02/2025">Cập nhật: 1 ngày trước</time></div>
                              <div><span>Mã tin: #593916</span></div>
                           </div>
                        </header>
                        <div class="border-bottom pb-3 mb-4" style="--bs-border-color: #f1f1f1;">
                           <h2 class="fs-5 mb-3">Thông tin mô tả</h2>
                           <p>Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường hoàng hoa thám quận bình thạnh. Phòng có 1 phòng ngủ,1 phòng khách, 1 nhà bếp,sân phơi,nhà vệ sinh.</p>
                           <p>Phòng thoáng mát sạch sẽ phù hợp với gia đình ở,sinh viên và khách văn phòng. Phòng đầy đủ tiện nghi như: máy lạnh,tủ lạnh,tue quần áo, quạt,nệm, giường,kệ bếp,bồn rửa chén,máy nước nóng lạnh,…..</p>
                           <p>Phòng cách mặt tiền hoàng hoa thám 40m. Cách bệnh viện ung bướu 800m. Đi ra đường phạm văn đồng,chợ bà chiểu,bệnh viện gia định, đường vạn kiếp chỉ 3 phút</p>
                           <p>- diện tích: 45m2</p>
                           <p>- gia cho thuê: 4triệu/tháng</p>
                           <p>- địa chỉ: 12/4b hoàng hoa thám,p7,bình thạnh</p>
                           <p>-liên hệ: 0913.113.234 - 08.35.45.55.65 gặp A Phi</p>
                        </div>
                        <div class="border-bottom pb-4 mb-4" style="--bs-border-color: #f1f1f1;">
                           <h2 class="fs-5 mb-3">Đặc điểm tin đăng</h2>
                           <div class="row">
                              <div class="col-6">
                                 <div class="mb-2">
                                    <div class="dot size-5 me-2"></div>
                                    Mã tin: <span class="ms-2">593916</span>
                                 </div>
                              </div>
                              <div class="col-6">
                                 <div class="mb-2">
                                    <div class="dot size-5 me-2"></div>
                                    Gói tin: <span class="ms-2" style="color: #ff5723;">Tin VIP 2</span>
                                 </div>
                              </div>
                              <div class="col-6">
                                 <div>
                                    <div class="dot size-5 me-2"></div>
                                    Ngày đăng: <span class="ms-2">Chủ Nhật, 16:15 09/02/2025</span>
                                 </div>
                              </div>
                              <div class="col-6">
                                 <div>
                                    <div class="dot size-5 me-2"></div>
                                    Ngày hết hạn: <span class="ms-2">Thứ 4, 16:15 12/02/2025</span>
                                 </div>
                              </div>
                           </div>
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
                     <div class="bg-white shadow-sm rounded p-3 mb-3 d-none d-lg-block">
                        <div class="mb-3">
                           <img class="avatar size-100 d-block p-1 m-auto" src="https://phongtro123.com/images/default-user.svg" alt="Phi">
                           <div class="mt-3 text-center">
                              <span class="fs-5 fw-medium">Phi</span>
                              <div class="d-flex justify-content-center fs-9" author_id="112524"><i class="bg-success rounded-circle d-inline-block me-2 size-5"></i><span>Đang hoạt động</span></div>
                              <div class="fs-7 mt-1">3 tin đăng <span class="dot"></span>Tham gia từ: 26/11/2021</div>
                           </div>
                        </div>
                        <div><a class="btn btn-green btn-lg text-white d-flex justify-content-center rounded-4" rel="nofollow" href="tel:0913113234"><i class="icon telephone-fill white me-2"></i> 0913113234</a><a class="btn btn-primary btn-lg text-white d-flex justify-content-center mt-2 rounded-4" target="_blank" rel="nofollow" href="https://zalo.me/0913113234"><i class="icon chat-text white me-2"></i> Nhắn Zalo</a></div>
                        <div class="d-flex justify-content-between mt-3"><button class="btn btn-white btn__save__lg fs-7 d-flex text-nowrap js-btn-save" data-post-id="593916" title="Tin đã lưu"><i class="icon heart me-2"></i><span>Lưu tin</span></button><button class="btn btn-white fs-7 text-nowrap d-flex" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSharePost" aria-controls="offcanvasSharePost"><i class="icon share me-2"></i><span>Chia sẻ</span></button><button class="btn btn-white fs-7 text-nowrap d-flex" data-bs-toggle="offcanvas" data-bs-target="#offcanvasReportPost" aria-controls="offcanvasReportPost"><i class="icon exclamation-triangle me-2"></i><span>Báo xấu</span></button></div>
                     </div>
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
    </body>
</html>