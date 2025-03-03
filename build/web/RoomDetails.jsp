<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Room" %>
<%@ page import="model.Position" %>
<%@ page import="model.Customer" %>
<%@ page import="model.Feedback" %>
<%@ page import="java.time.Duration" %>
<%@ page import="java.time.LocalDateTime" %>
<%
    ArrayList<Feedback> feedbacks = (ArrayList<Feedback>) request.getAttribute("feedbacks");
    Room room = (Room) request.getAttribute("room");
%>
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
    </head>
    <body>

        <%
                                       HttpSession sessionUser = request.getSession(false); // Không tạo session mới nếu chưa tồn tại
                                      int userRole = (sessionUser != null && sessionUser.getAttribute("state") != null) 
               ? (int) sessionUser.getAttribute("state") 
               : -1; // Mặc định -1 nếu không có giá trị
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
                        <% 
     if (username != null) { 
                        %>
                        <span class="me-2">👤 <%= username %></span>
                        <a href="Register.jsp">
                            <button class="btn btn-outline-secondary me-2">Thông tin</button>
                        </a>
                        <a href="Logout.jsp">
                            <button class="btn btn-outline-secondary me-2">Logout</button>
                        </a>
                        <button class="btn btn-outline-danger me-2">Nâng câp tài khoản</button>
                        <% 
                            } else { 
                        %>
                        <a href="Register.jsp">
                            <button class="btn btn-outline-secondary me-2">Đăng ký</button>
                        </a>
                        <a href="Loggin.jsp">
                            <button class="btn btn-outline-secondary me-2">Đăng nhập</button>
                        </a>
                        <% } %>

                        <button class="btn btn-outline-danger me-2">Đăng tin</button>
                    </div>
                </div>
            </div>
        </header>
        <main>
            <div class="container mt-4">
                <div class="row mt-3">
                    <div class="col-md-9 col-lg-8">
                        <div class="post__photos mb-3">
                            <div id="carousel_Photos" class="carousel photos bg-white shadow-sm slide pointer-event rounded" data-bs-touch="true"
                                 style="background-color: lightgray; border-radius: 8px; height: 400px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
                                <div class="carousel-inner bg-dark rounded" style="width: 100%; height: 100%;">
                                    <div class="carousel-item active">
                                        <img class="d-block mx-auto lazy_done" 
                                             style="width: 70%; height: 400px;"
                                             alt="Cho thuê căn hộ mini đầy đủ tiện nghi ngay đường Hoàng Hoa Thám, Quận Bình Thạnh"
                                             src="${pageContext.request.contextPath}/images/<%= room.getImage() %>">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="bg-white shadow-sm rounded p-4 mb-3">
                            <h2 class="fs-5 fw-semibold lh-sm mb-3 text-center" style="color:#ff5723">Chi tiết phòng</h2>

                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <th class="table-secondary">Tên phòng</th>
                                        <td><%= room.getRoomName() %></td>
                                    </tr>
                                    <tr>
                                        <th class="table-secondary">Mô tả chi tiết</th>
                                        <td><%= room.getPosition().getDescription() %></td>
                                    </tr>
                                    <tr>
                                        <th class="table-secondary">Địa chỉ</th>
                                        <td>
                                            số nhà:  <%= room.getPosition().getNumber_house() %>, 
                                            <%= room.getPosition().getStreet() %>, 
                                            <%= room.getPosition().getWard() %>, 
                                            <%= room.getPosition().getDistrict() %>, 
                                            <%= room.getPosition().getCity() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="table-secondary">Mô tả chi tiết vị trí</th>
                                        <td><%= room.getPosition().getDescription() %></td>
                                    </tr>
                                    <tr>
                                        <th class="table-secondary">Giá thuê</th>
                                        <td class="fw-bold text-danger"><%= room.getPrice() %> triệu/tháng</td>
                                    </tr>

                                    <tr>
                                        <th class="table-secondary">Mã tin</th>
                                        <td>#<%= room.getRoomId() %></td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="alert alert-warning mt-4 p-3">
                                <ul class="fs-10">
                                    <li class="pb-2 fw-bold">Lưu ý:</li>
                                    <li class="pb-2">
                                        Chỉ đặt khi cọc xác định được chủ nhà và có thỏa thuận biên nhận rõ ràng. Kiểm tra mọi điều khoản và yêu cầu liệt kê tất cả chi phí hàng tháng vào hợp đồng. 
                                        <a rel="nofollow" target="_blank" class="text-link text-decoration-underline" href="/kinh-nghiem-c822.html">Xem thêm</a>
                                    </li>
                                    <li>
                                        Mọi thông tin liên quan đến tin đăng này chỉ mang tính chất tham khảo. Nếu bạn thấy rằng tin đăng này không đúng hoặc có dấu hiệu lừa đảo, 
                                        <span class="text-link text-decoration-underline" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasReportPost" aria-controls="offcanvasReportPost">
                                            hãy phản ánh với chúng tôi.
                                        </span>
                                    </li>
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
                                   target="_blank" rel="nofollow" href="Chatbox?roomid=<%= room.getRoomId()%>"
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
                                <% if ((Boolean) request.getAttribute("canFeedback")) { %>
                                <form action="BadnewsRoom" method="get" onsubmit="return checkLogin(event) && confirm('Bạn có chắc muốn báo cáo phòng trọ này không?')"
                                      >
                                    <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
                                    <button type="submit" class="btn btn-white fs-7 text-nowrap d-flex" 
                                            data-bs-toggle="offcanvas" data-bs-target="#offcanvasReportPost" 
                                            aria-controls="offcanvasReportPost">
                                        <i class="icon exclamation-triangle me-2"></i>
                                        <span>Báo xấu</span>
                                    </button>
                                </form>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bg-white shadow-sm rounded p-3 mb-3">
                    <h2 class="fs-5 mb-3">Đánh giá khách thuê</h2>
                    <!-- Feedback Input Section -->

                    <div class="mb-4">
                        <% if ((Boolean) request.getAttribute("canFeedback")) { %>
                        <!-- Show textarea and submit button if user can provide feedback -->
                        <form id="AddFeedbackServlet" method="get" action="AddFeedbackServlet">
                            <div class="form-group">
                                <input type="hidden" name="usename" value="<%= username %>">
                                <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
                                <textarea id="feedbackContent" 
                                          name="content" 
                                          class="form-control" 
                                          style="min-height: 100px; resize: vertical;" 
                                          placeholder="Write your feedback here..."></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary mt-2">Submit Feedback</button>
                        </form>

                        <div id="feedbackMessage" class="mt-2" style="display: none;"></div>
                        <% } else { %>
                        <!-- Show message if user cannot provide feedback -->
                        <label class="text-danger fw-bold">You can only provide feedback if you booked this room.</label>
                        <a class="btn btn-success text-white d-flex justify-content-center rounded-4 flex-grow-1 px-3 py-2" 
                           href="#" onclick="return checkLogin(event)">
                            <i class="icon house white me-2"></i> Thuê Trọ
                        </a>
                        <% } %>
                    </div>


                    <!-- Feedback Cards -->
                    <div class="feedback-cards">
                        <% 
                            if (feedbacks != null && !feedbacks.isEmpty()) { 
                                for (Feedback fb : feedbacks) { 
                                    Customer customer = fb.getCustomer();
                                    LocalDateTime creationDate = fb.getCreationDate();
                                    LocalDateTime now = LocalDateTime.now();

                                    long secondsAgo = Duration.between(creationDate, now).getSeconds();
                                    long minutesAgo = secondsAgo / 60;
                                    long hoursAgo = minutesAgo / 60;
                                    long daysAgo = hoursAgo / 24;
                                    long monthsAgo = daysAgo / 30;
                                    long yearsAgo = daysAgo / 365;

                                    String timeAgo;
                                    if (secondsAgo < 60) {
                                        timeAgo = "few seconds ago";
                                    } else if (minutesAgo < 60) {
                                        timeAgo = minutesAgo + " minutes ago";
                                    } else if (hoursAgo < 24) {
                                        timeAgo = hoursAgo + " hours ago";
                                    } else if (daysAgo < 30) {
                                        timeAgo = daysAgo + " days ago";
                                    } else if (monthsAgo < 12) {
                                        timeAgo = monthsAgo + " months ago";
                                    } else {
                                        timeAgo = yearsAgo + " years ago";
                                    }
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
                                                <span class="text-muted ms-2">• Posted <%= timeAgo %></span>
                                            </div>
                                            <div class="dropdown">
                                                <button class="btn btn-link p-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="fa-solid fa-ellipsis"></i>
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <% if (username != null && customer != null && (username.equals(customer.getEmail()) || userRole == 1)) { %>
                                                    <li>
                                                        <form action="DeleteFeedBack" method="get" onsubmit="return confirm('Bạn có chắc muốn xóa không?')">
                                                            <input type="hidden" name="roomid" value="<%=room.getRoomId() %>">
                                                            <input type="hidden" name="feedback" value="<%=fb.getFeedbackId() %>">
                                                            <button type="submit" class="dropdown-item delete-feedback-btn">Delete</button>
                                                        </form>
                                                    </li>
                                                    <% } else if(userRole == 1 || userRole == 2|userRole == 3) { %>
                                                    <form action="DeleteFeedBack" method="post" onsubmit="return confirm('Bạn có chắc muốn report không?')">
                                                        <input type="hidden" name="roomid" value="<%=room.getRoomId() %>">
                                                        <input type="hidden" name="feedback" value="<%=fb.getFeedbackId() %>">
                                                        <button type="submit" class="dropdown-item delete-feedback-btn">Report</button>
                                                    </form>
                                                    <% } else{%>
                                                    <li>You must login</li>
                                                    <% } %>
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
        </main>
        <!-- Modal để hiển thị lịch -->
        <form action="RoomAppointmentServlet?COMMAND=CREATE_APPOINTMENT" method="post">
            <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
            <div id="datePickerModal" class="modal fade" tabindex="-1" aria-labelledby="datePickerModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="datePickerModalLabel">Chọn ngày đặt lịch</h5>
                            <input type="date" id="datePickerInput" name="view_date" class="form-control" required>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <%
            String reportSuccess = request.getParameter("reportSuccess");
            if ("true".equals(reportSuccess)) {
        %>
        <script>
            alert("You have reported successfully!");
        </script>
        <%
            }
        %>

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
        <script>
            $(document).ready(function () {
                $("#submitFeedback").click(function () {
                    var content = $("#feedbackContent").val().trim();
                    var roomId = <%= room.getRoomId() %>;
                    var userEmail = "<%= username %>";

                    if (content === "") {
                        alert("Feedback cannot be empty!");
                        return;
                    }

                    $.ajax({
                        type: "POST",
                        url: "AddFeedbackServlet",
                        data: {
                            userEmail: userEmail,
                            roomId: roomId,
                            content: content,
                            rating: 5
                        },
                        success: function (response) {
                            if (response.trim() === "success") {
                                alert("Feedback submitted successfully!");
                                location.reload();
                            } else {
                                alert("Failed to submit feedback. Please try again.");
                            }
                        },
                        error: function () {
                            alert("Error occurred while submitting feedback.");
                        }
                    });
                });
            });
            $(document).ready(function () {
                // Handle feedback deletion
                $(".delete-feedback-btn").click(function (e) {
                    e.preventDefault();
                    var feedbackId = $(this).data("id");

                    if (confirm("Are you sure you want to delete this feedback?")) {
                        $.ajax({
                            type: "POST",
                            url: "DeleteFeedbackServlet",
                            data: {feedbackId: feedbackId},
                            success: function (response) {
                                if (response.trim() === "success") {
                                    alert("Feedback deleted successfully!");
                                    location.reload();
                                } else {
                                    alert("Failed to delete feedback. Please try again.");
                                }
                            },
                            error: function () {
                                alert("Error occurred while deleting feedback.");
                            }
                        });
                    }
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/your_code.js" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </body>
</html>