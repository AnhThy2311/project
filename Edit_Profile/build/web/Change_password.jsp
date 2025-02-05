<%-- 
    Document   : Profile_edit
    Created on : Feb 5, 2025, 1:54:24 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Profile</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                width: 50%;
                margin: auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            label {
                display: block;
                margin-top: 10px;
            }
            input {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
            }
            button {
                margin-top: 15px;
                padding: 10px;
                width: 100%;
                background: blue;
                color: white;
                border: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        
        <div class="container">
            <div style="width: 60%;margin-left: 22%" >
                <!-- Account details card-->
                <div class="card mb-4">
                    <div class="card-header">Đổi mật khẩu</div>
                    <div class="card-body">
                        <form action="HomeController?COMMAND=CHANGE_PASSWORD" method="post">
                            <!-- Form Group (username)-->
                            <div class="mb-3">
                                <input class="form-control" type="password" placeholder="Mật khẩu cũ" name="oldPass">
                            </div>
                            <div class="mb-3">
                                <input class="form-control" type="password" placeholder="Mật khẩu mới" name="newPass">
                            </div>
                            <div class="mb-3">
                                <input class="form-control" type="password" placeholder="Xác nhận mật khẩu" name="reNewPass">
                            </div>
                            <!-- Save changes button-->
                            <br>
                            <button class="btn btn-primary mt-2" type="submit">Lưu thay đổi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
