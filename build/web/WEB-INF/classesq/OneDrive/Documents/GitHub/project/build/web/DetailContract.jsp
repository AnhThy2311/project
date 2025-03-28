<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BookingRoom" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
            }
            .form-label {
                font-weight: bold;
            }
            .form-input {
                border: 1px solid #ccc;
                padding: 8px;
                border-radius: 5px;
                width: 100%;
                background-color: #f3f4f6;
                cursor: not-allowed;
            }
        </style>
    </head>

    <body class="bg-gray-100 text-gray-800 p-8">
        <div class="max-w-2xl mx-auto bg-white p-8 rounded-lg shadow-lg">
            <div class="text-center mb-8">
                <p class="font-bold text-blue-600">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</p>
                <p class="text-blue-600">Độc Lập - Tự Do - Hạnh Phúc</p>
                <p class="mt-4 text-gray-600">-----o0o-----</p>
                <h1 class="font-bold text-2xl mt-4 text-blue-800">HỢP ĐỒNG CHO THUÊ PHÒNG TRỌ</h1>
            </div>

            <%
            ArrayList<BookingRoom> list = (ArrayList<BookingRoom>) request.getAttribute("list");
            BookingRoom br = (BookingRoom) request.getAttribute("br");

            if (list != null && br != null) {
                session.setAttribute("contractList", list);
                session.setAttribute("contractBr", br);
            }

            if (list != null && list.size() >= 2 && br != null) {
                BookingRoom brA = list.get(0);
                BookingRoom brB = list.get(1);
            %>
            <form action="DownloadContract" method="get">
                <div class="mb-8">
                    <h2 class="font-bold text-lg text-blue-700">BÊN A: BÊN CHO THUÊ PHÒNG TRỌ</h2>
                    <div class="mb-4">
                        <label class="form-label">Họ và Tên:</label>
                        <input type="text" name="fullNameA" value="<%= brA.getCustomer().getFullName() %>" class="form-input" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">CCCD số:</label>
                        <input type="text" name="cccdA" value="<%= brA.getInf().getCCCD() %>" class="form-input" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Ngày cấp:</label>
                        <input type="text" name="issueDateA" value="<%= brA.getInf().getIssueDate() %>" class="form-input" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Nơi cấp:</label>
                        <input type="text" name="placeOfIssueA" value="<%= brA.getInf().getPlaceOfIssue() %>" class="form-input" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Thường trú:</label>
                        <input type="text" name="permanentAddressA" value="<%= brA.getInf().getPermanentAddress() %>" class="form-input" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Số điện thoại:</label>
                        <input type="text" name="phoneA" value="<%= brA.getCustomer().getPhone() %>" class="form-input" readonly>
                    </div>
                </div>

                <div class="mb-8">
                    <h2 class="font-bold text-lg text-blue-700">BÊN B: BÊN THUÊ PHÒNG TRỌ</h2>
                    <div class="mb-4">
                        <label class="form-label">Họ và Tên:</label>
                        <input type="text" name="fullNameB" value="<%= brB.getCustomer().getFullName() %>" class="form-input" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">CCCD số:</label>
                        <input type="text" name="cccdB" value="<%= brB.getInf().getCCCD() %>" class="form-input" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Ngày cấp:</label>
                        <input type="text" name="issueDateB" value="<%= brB.getInf().getIssueDate() %>" class="form-input" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Nơi cấp:</label>
                        <input type="text" name="placeOfIssueB" value="<%= brB.getInf().getPlaceOfIssue() %>" class="form-input" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Thường trú:</label>
                        <input type="text" name="permanentAddressB" value="<%= brB.getInf().getPermanentAddress() %>" class="form-input" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Số điện thoại:</label>
                        <input type="text" name="phoneB" value="<%= brB.getCustomer().getPhone() %>" class="form-input" readonly>
                    </div>
                </div>

                <div class="mb-8">
                    <p>Hai bên cùng thỏa thuận và đồng ý với nội dung sau:</p>
                    <p class="font-bold text-blue-700">Điều 1:</p>
                    <p>Bên A đồng ý cho bên B thuê một phòng trọ thuộc địa chỉ: số: <%= br.getP().getNumber_house()%>, <%= br.getP().getStreet()%>, <%= br.getP().getWard()%>, <%= br.getP().getDistrict()%>, <%= br.getP().getCity() %></p>
                    <p>Thời hạn thuê phòng trọ là: <%= br.getMonth() %> tháng kể từ ngày <%= br.getDate() %></p>
                    <p class="font-bold text-blue-700">Điều 2:</p>
                    <p>Giá thuê phòng trọ là: <%= br.getC().getRoom_price() %> VND</p>
                    <p>Tiền thuê phòng bên B thanh toán cho bên A từ ngày ...... tới ngày ...... hàng tháng.</p>
                    <p>Tiền đặt cọc là ........................................... đồng (Bằng chữ: ........................................)</p>
                    <p>Bên A sẽ thanh toán lại cho bên B số tiền đặt cọc khi bên B kết thúc hợp đồng thuê phòng trọ và đã thanh toán đầy đủ tiền điện, nước, phí vệ sinh và các khoản phí khác.</p>
                    <p>Bên A không hoàn trả lại tiền đặt cọc nếu bên B chấm dứt hợp đồng trước thời hạn.</p>
                    <p>Bên B ngừng hợp đồng, phải báo trước 1 tháng cho bên A biết.</p>
                    <p>Bên A ngừng hợp đồng, phải báo trước 1 tháng cho bên B biết.</p>
                    <p class="font-bold text-blue-700">Điều 3: Trách nhiệm của bên A</p>
                    <p>Giao phòng trọ, trang thiết bị trong phòng cho bên B đúng ngày ký hợp đồng.</p>
                    <p>Đảm bảo quyền sử dụng hợp pháp của bên B trong thời gian thuê phòng, nếu bên B thực hiện đúng các cam kết của hợp đồng.</p>
                    <p class="font-bold text-blue-700">Điều 4: Trách nhiệm của bên B</p>
                    <p>Trả tiền thuê phòng đúng hạn theo hợp đồng.</p>
                    <p>Sử dụng phòng trọ đúng mục đích, giữ gìn vệ sinh, bảo quản tài sản, các thiết bị của chủ nhà.</p>
                    <p>Chấp hành đầy đủ các quy định của địa phương, đảm bảo an ninh trật tự.</p>
                    <p>Không được tự ý sửa chữa, cải tạo phòng trọ nếu chưa có sự đồng ý của bên A.</p>
                </div>
                <div class="text-center">
                    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                        Tải Hợp Đồng (PDF)
                    </button>
                </div>
            </form>
            <% } else { %>
            <p>Không có dữ liệu</p>
            <% } %>
        </div>
    </body>
</html>