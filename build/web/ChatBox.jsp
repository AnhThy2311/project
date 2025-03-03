<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.ChatBox"%>
<!doctype html>
<html lang="en">
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
        <!--        <style>
                    .chat-box {
                        max-width: 600px;
                        margin: 50px auto;
                        border: 1px solid #ccc;
                        border-radius: 10px;
                        padding: 20px;
                        background-color: #f9f9f9;
                    }
                    .message {
                        margin-bottom: 15px;
                    }
                    .message.sender {
                        text-align: right;
                    }
                    .message.receiver {
                        text-align: left;
                    }
                    .message .msg-content {
                        display: inline-block;
                        max-width: 80%;
                        padding: 10px;
                        border-radius: 15px;
                    }
                    .message.sender .msg-content {
                        background-color: #d1f7d6;
                    }
                    .message.receiver .msg-content {
                        background-color: #f0f0f0;
                    }
                    .input-group {
                        margin-top: 20px;
                    }
                    .input-group input {
                        border-radius: 10px;
                    }
                    .avatar {
                        width: 30px;  /* Giảm kích thước ảnh */
                        height: 30px;
                        border-radius: 50%; /* Làm tròn ảnh */
                        margin-right: 5px;
                    }
        
                </style>-->
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

        <div class="h-screen flex flex-col items-center justify-center bg-gray-200">
              <header class="navbar-custom sticky-top w-100">
                <div class="container-fluid">
                    <div class="d-flex justify-content-between align-items-center py-2">
                        <div class="d-flex align-items-center">
                            <a href="/" class="navbar-brand">
                                <img src="https://static.muonnha.com.vn/images/logo.png?w=384&p=100" alt="Muôn Nhà" width="160" height="46" />
                            </a>
                            <a class="nav-link active" href="RoomServlet" style="padding-left: 20px">Home</a>
                            <div class="d-none d-md-flex ms-3">
                                <div class="filter__bar pb-2">
                                    <div class="w-100">
                                        <div class="d-flex position-relative bg-white">
                                            <div data-bs-toggle="offcanvas" data-bs-target="#offcanvasLocation" aria-controls="offcanvasLocation" class="btn__search d-flex align-items-center">
                                                <span class="material-icons me-2">location_on</span>
                                                <span class="fw-normal flex-grow-1 line-clamp-1 text-body">Tìm theo khu vực</span>
                                            </div>
                                            <button type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasAdvance" aria-controls="offcanvasAdvance" class="btn btn__funnel ms-2">
                                                <i class="bi-funnel me-1"></i>
                                                <span>Bộ lọc</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                            <% if (username != null) { %>
                            <img class="avatar rounded-circle me-2" src="${pageContext.request.contextPath}/images/<%= userImage %>" alt="Ảnh đại diện tài khoản" width="33" height="33" />
                            <span class="me-2"><%= username %></span>
                            <a href="Profile">
                                <button class="btn btn-outline-secondary me-2">Thông tin</button>
                            </a>
                            <a href="Logout.jsp">
                                <button class="btn btn-outline-secondary me-2">Logout</button>
                            </a>
                            <% Integer state = (Integer) session.getAttribute("state"); if (state != null) { %>
                            <a href="GetPostRooms?email=<%=username%>" class="btn btn-outline-danger me-2">Đăng tin</a>
                            <% } else { %>
                            <button class="btn btn-outline-danger me-2">Nâng cấp tài khoản</button>
                            <% } } else { %>
                            <a href="Register.jsp" class="btn btn-outline-secondary me-2">Đăng ký</a>
                            <a href="Loggin.jsp" class="btn btn-outline-secondary me-2">Đăng nhập</a>
                            <button class="btn btn-outline-danger me-2">Đăng tin</button>
                            <% } %>
                        </div>
                    </div>
                </div>
            </header>
            <div class="chat-container w-full max-w-2xl h-full flex flex-col shadow-lg rounded-lg overflow-hidden bg-white">
                <div class="flex-1 overflow-y-auto p-4 bg-gray-100">
                    <% List<ChatBox> list = (List<ChatBox>) request.getAttribute("list"); String sendId = (String) request.getAttribute("sendId"); for (ChatBox chat : list) { boolean isSender = chat.getSender().equals(sendId); %>
                    <div class="flex items-end <%= isSender ? "justify-end" : "" %> mb-4">
                        <% if (!isSender) { %>
                        <img src="${pageContext.request.contextPath}/images/<%= chat.getImange() %>" alt="Avatar" class="w-8 h-8 rounded-full mr-2" />
                        <% } %>
                        <div class="<%= isSender ? "bg-green-300" : "bg-gray-300" %> rounded-lg p-1 text-sm">
                            <%= chat.getContent() %>
                        </div>
                        <% if (isSender) { %>
                        <img src="${pageContext.request.contextPath}/images/<%= chat.getImange() %>" alt="Avatar" class="w-8 h-8 rounded-full ml-2" />
                        <% } %>
                    </div>
                    <% } %>
                </div>
                <form action="SendMessageServlet" method="post" class="bg-gray-300 p-2 flex">
                    <input type="hidden" name="roomId" value="<%= request.getAttribute("roomId") %>">
                    <input type="hidden" name="senderId" value="<%= sendId %>">
                     <input type="hidden" name="receiverId" value="<%= request.getAttribute("reveivedId") %>">
                    <input type="text" name="message" class="flex-1 p-1 rounded-lg border border-gray-400 text-sm" placeholder="Type a message..." required>
                    <button type="submit" class="bg-blue-500 text-white p-1 rounded-lg ml-2 text-sm">Send</button>
                </form>
            </div>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
