<%-- 
    Document   : profile.jsp
    Created on : Feb 5, 2025, 6:01:11 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            font-family: 'Poppins', sans-serif;
        }
        .profile-container {
            max-width: 500px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }
        .profile-container:hover {
            transform: scale(1.02);
        }
        .profile-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 5px solid #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: 0.3s;
        }
        .profile-img:hover {
            transform: scale(1.1);
        }
        .profile-card h3 {
            font-weight: bold;
            color: #333;
        }
        .profile-card p {
            color: #555;
            margin-bottom: 5px;
        }
        .btn-custom {
            background: #007bff;
            color: white;
            border-radius: 25px;
            padding: 10px 20px;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">🏠 Trang chủ</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="#">🔒 Đổi mật khẩu</a>
                <a class="nav-link" href="#">⚙️ Cài đặt</a>
                <a class="nav-link btn btn-danger text-white ms-2" href="#">🚪 Đăng xuất</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="profile-container">
            <img src="<%= session.getAttribute("avatar") != null ? session.getAttribute("avatar") : "uploads/default-avatar.png" %>" 
                 alt="Avatar" class="profile-img">
            <h3>User Profile</h3>
            <p><i class="fas fa-user"></i> <strong>FullName:</strong> Son</p>
            <p><i class="fas fa-envelope"></i> <strong>Email:</strong> sondldde170021@fpt.edu.vn</p>
            <p><i class="fas fa-phone"></i> <strong>Phone Number:</strong> 1234567890</p>
            <p><i class="fas fa-calendar-alt"></i> <strong>Date of Birth:</strong> 18/02/2025</p>
            <a href="upload.jsp" class="btn btn-custom mt-3">🖊 Edit Profile</a>
        </div>
    </div>
</body>
</html>
