<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Contract Content</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                width: 70%;
                margin: 0 auto;
            }
            .contract-content {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <!--        <h1>Contract Content</h1>
                    <div class="contract-content">
                        <p><strong>Contract ID:</strong> ${contract.contractId}</p>
                        <p><strong>Booking ID:</strong> ${contract.bookingId}</p>
                        <p><strong>Tenant ID:</strong> ${contract.tenantId}</p>
                        <p><strong>Landlord ID:</strong> ${contract.landlordId}</p>
                        <p><strong>Landlord Name:</strong> ${contract.landlordName}</p>  New field 
                        <p><strong>Creation Date:</strong> ${contract.creationDate}</p>
                        <p><strong>Content:</strong> ${contract.content}</p>
                        <p><strong>Status:</strong> ${contract.status}</p>
                        <p><strong>Request ID:</strong> ${contract.requestId}</p>
                    </div>-->
            <h1>HỢP ĐỒNG THUÊ CĂN HỘ CHUNG CƯ</h1>
            <p>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</p>
            <p>Độc lập - Tự do - Hạnh phúc</p>
            <h2>—o0o—</h2>
            <p>Số: <input type="text" name="contractNumber" placeholder="Nhập số hợp đồng"/></p>
            <p>Ngày: <input type="date" name="contractDate"/></p>
            <p>Địa chỉ: <input type="text" name="contractAddress" placeholder="Nhập địa chỉ"/></p>

            <h2>BÊN CHO THUÊ NHÀ Ở (Bên A)</h2>
            <p>Ông (bà): <input type="text" name="landlordName" placeholder="Nhập tên"/></p>
            <p>Ngày sinh: <input type="date" name="landlordDob"/></p>
            <p>CMND/CCCD: <input type="text" name="landlordId" placeholder="Nhập số CMND/CCCD"/></p>
            <p>Cấp ngày: <input type="date" name="landlordIdDate"/></p>
            <p>Nơi cấp: <input type="text" name="landlordIdPlace" placeholder="Nhập nơi cấp"/></p>
            <p>Hộ khẩu thường trú: <input type="text" name="landlordAddress" placeholder="Nhập địa chỉ thường trú"/></p>
            <p>Điện thoại: <input type="text" name="landlordPhone" placeholder="Nhập số điện thoại"/></p>
            <p>Email: <input type="text" name="landlordEmail" placeholder="Nhập email"/></p>

            <h2>BÊN THUÊ NHÀ Ở (Bên B)</h2>
            <p>Ông (bà): <input type="text" name="tenantName" placeholder="Nhập tên"/></p>
            <p>Ngày sinh: <input type="date" name="tenantDob"/></p>
            <p>CMND/CCCD: <input type="text" name="tenantId" placeholder="Nhập số CMND/CCCD"/></p>
            <p>Cấp ngày: <input type="date" name="tenantIdDate"/></p>
            <p>Nơi cấp: <input type="text" name="tenantIdPlace" placeholder="Nhập nơi cấp"/></p>
            <p>Hộ khẩu thường trú: <input type="text" name="tenantAddress" placeholder="Nhập địa chỉ thường trú"/></p>
            <p>Điện thoại: <input type="text" name="tenantPhone" placeholder="Nhập số điện thoại"/></p>
            <p>Email: <input type="text" name="tenantEmail" placeholder="Nhập email"/></p>

            <h2>NỘI DUNG HỢP ĐỒNG</h2>
            <p><textarea name="contractContent" rows="10" cols="50" placeholder="Nhập nội dung hợp đồng tại đây..."></textarea></p>

            <p>Ký tên:</p>
            <p>Bên A: ____________________</p>
            <p>Bên B: ____________________</p>
        </div>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    </body>
</html>
