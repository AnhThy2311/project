<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="model.Customer" %>
<%@ page import="model.Information" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
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
        <link rel="stylesheet" href="#" />
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
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
                        <button class="btn btn-outline-danger me-2">Đăng tin</button>
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
        <%
                    // Retrieve the customer object from the request attribute
                    Customer customer = (Customer) request.getAttribute("customer");
                                // Retrieve Information from session
                                Information information = (Information) request.getAttribute("information");
                    if (customer != null) {
        %>
        <div class="bg-gradient-to-r from-green-400 via-blue-500 to-purple-600 flex items-center justify-center min-h-screen">
            <div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-6xl">
                <h1 class="text-3xl font-bold text-blue-600 mb-6 text-center">
                    User Profile
                </h1>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8 items-start">
                    <div class="flex flex-col items-center">
                        <img alt="User avatar showing a person working on a laptop" class="rounded-full w-40 h-40 object-cover shadow-md mb-6" height="150" src="${pageContext.request.contextPath}/images/<%= (customer.getImage() != null) ? customer.getImage() : "default_user.jpg" %>" width="150"/>
                        <a href="upload.jsp" class="px-6 py-2 border border-blue-600 text-blue-600 rounded-lg hover:bg-blue-50 transition duration-300">
                            Edit Avatar
                        </a>
                    </div>
                    <form action="EditProfile" method="post" class="needs-validation" novalidate>
                        <div class="bg-gray-50 p-6 rounded-lg shadow-inner w-full">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <label class="block text-lg font-bold mb-2">FULL NAME:</label>
                                    <input type="text" class="form-control w-full" id="fullName" name="name" value="<%= customer.getFullName() %>" required oninvalid="this.setCustomValidity('Please fill out this field.')" oninput="setCustomValidity('')"/>
                                </div>
                                <div>
                                    <label class="block text-lg font-bold mb-2">Email:</label>
                                    <input type="email" class="form-control w-full" id="email" name="email" value="<%= customer.getEmail() %>" readonly="readonly"/>
                                </div>
                                <div>
                                    <label class="block text-lg font-bold mb-2">Phone Number:</label>
                                    <input type="text" class="form-control w-full" id="phone" name="phone" value="<%= customer.getPhone() %>" required oninvalid="this.setCustomValidity('Please fill out this field.')" oninput="setCustomValidity('')"/>
                                </div>
                                <div>
                                    <label class="block text-lg font-bold mb-2">Date of Birth:</label>
                                    <input type="date" class="form-control w-full" id="dob" name="dob" value="<%
                                        String birthDateString = customer.getBirthDate();
                                        if (birthDateString != null) {
                                            try {
                                                SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd");
                                                Date birthDate = sdfInput.parse(birthDateString);
                                                SimpleDateFormat sdfOutput = new SimpleDateFormat("yyyy-MM-dd");
                                                String formattedDate = sdfOutput.format(birthDate);
                                                out.print(formattedDate);
                                            } catch (Exception e) {
                                                out.print("");
                                            }
                                        } else {
                                            out.print("");
                                        }
                                           %>" required oninvalid="this.setCustomValidity('Please fill out this field.')" oninput="setCustomValidity('')"/>
                                </div>
                                <div>
                                    <label class="block text-lg font-bold mb-2">CCCD:</label>
                                    <input type="text" class="form-control w-full" value="<%= (information != null && information.getCCCD() != null) ? information.getCCCD() : "" %>" name="cccd" required oninvalid="this.setCustomValidity('Please fill out this field.')" oninput="setCustomValidity('')"/>
                                </div>
                                <div>
                                    <label class="block text-lg font-bold mb-2">Issue Date:</label>
                                    <input type="date" class="form-control w-full" value="<%= (information != null && information.getIssueDate() != null) ? information.getIssueDate() : "" %>" name="date" required oninvalid="this.setCustomValidity('Please fill out this field.')" oninput="setCustomValidity('')"/>
                                </div>
                                <div>
                                    <label class="block text-lg font-bold mb-2">Place of Issue:</label>
                                    <input type="text" class="form-control w-full" value="<%= (information != null && information.getPlaceOfIssue() != null) ? information.getPlaceOfIssue() : "" %>" name="placeOfIssue" required oninvalid="this.setCustomValidity('Please fill out this field.')" oninput="setCustomValidity('')"/>
                                </div>
                                <div>
                                    <label class="block text-lg font-bold mb-2">Permanent Address:</label>
                                    <input type="text" class="form-control w-full" value="<%= (information != null && information.getPermanentAddress() != null) ? information.getPermanentAddress() : "" %>" name="permanentAddress" required oninvalid="this.setCustomValidity('Please fill out this field.')" oninput="setCustomValidity('')"/>
                                </div>
                            </div>
                            <div class="mt-6 text-center">
                                <button type="submit" class="bg-gradient-to-r from-purple-500 to-blue-500 hover:from-purple-600 hover:to-blue-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline w-full">Edit Profile</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
        <script>
            document.querySelector('form').onsubmit = function (e) {
                if (!this.checkValidity()) {
                    e.preventDefault();
                    alert('Vui lòng điền đầy đủ thông tin!');
                }
            };
        </script>
    </body>
</html>
