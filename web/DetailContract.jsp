<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BookingRoom" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        </link>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
            }
        </style>
    </head>

    <body class="bg-gray-100 text-gray-800 p-8">
        <div class="max-w-2xl mx-auto bg-white p-8 rounded-lg shadow-lg">
            <div class="text-center mb-8">
                <p class="font-bold text-blue-600">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</p>
                <p class="text-blue-600">Độc Lập-Tự Do-Hạnh Phúc</p>
                <p class="mt-4 text-gray-600">-----o0o-----</p>
                <h1 class="font-bold text-2xl mt-4 text-blue-800">HỢP ĐỒNG CHO THUÊ PHÒNG TRỌ</h1>
            </div>
            <%
ArrayList<BookingRoom> list = (ArrayList<BookingRoom>) request.getAttribute("list");
if (list != null && list.size() >= 2) {
    BookingRoom brA = list.get(0); // BÊN A
    BookingRoom brB = list.get(1); // BÊN B
            %>
            <div class="mb-8">
                <h2 class="font-bold text-lg text-blue-700">BÊN A: BÊN CHO THUÊ PHÒNG TRỌ</h2>
                <p>Họ và Tên: <%= brA.getCustomer().getFullName() %></p>
                <p>Năm sinh: <%= brA.getCustomer().getBirthDate() %></p>
                <p>CCCD số: <%= brA.getInf().getCCCD() %> Ngày cấp: <%= brA.getInf().getIssueDate() %> Nơi cấp: <%= brA.getInf().getPlaceOfIssue() %></p>
                <p>Thường Trú: <%= brA.getInf().getPermanentAddress() %></p>
                <p>Số điện thoại: <%= brA.getCustomer().getPhone() %></p>
            </div>
            <div class="mb-8">
                <h2 class="font-bold text-lg text-blue-700">BÊN B: BÊN THUÊ PHÒNG TRỌ</h2>
                <p>Họ và Tên: <%= brB.getCustomer().getFullName() %></p>
                <p>Năm sinh: <%= brB.getCustomer().getBirthDate() %></p>
                <p>CCCD số: <%= brB.getInf().getCCCD() %> Ngày cấp: <%= brB.getInf().getIssueDate() %> Nơi cấp: <%= brB.getInf().getPlaceOfIssue() %></p>
                <p>Thường Trú: <%= brB.getInf().getPermanentAddress() %></p>
                <p>Số điện thoại: <%= brB.getCustomer().getPhone() %></p>
            </div>
            <% } else{ %>
            <p>không có dữ kiện </p>
            <% } %>
          <%  BookingRoom br = (BookingRoom) request.getAttribute("br"); %>
            <div class="mb-8">
                <p>Hai bên cùng thỏa thuận và đồng ý với nội dung sau :</p>
                <p class="font-bold text-blue-700">Điều 1:</p>
                <p>Bên A đồng ý cho bên B thuê một phòng trọ thuộc địa chỉ: số: <%= br.getP().getNumber_house()%>, <%= br.getP().getStreet()%>, <%= br.getP().getWard()%>, <%= br.getP().getDistrict()%>, <%= br.getP().getCity()%>                  ..........................</p>
                <p>Thời hạn thuê phòng trọ là:... <%=br.getMonth()%>....  tháng kể từ ngày <%= br.getDate() %> .....
                </p>
                <p class="font-bold text-blue-700">Điều 2:</p>
                <p>Giá thuê phòng trọ là:  <%=br.getC().getRoom_price()%> ...... VND
                </p>
               
                <p>Bên A sẽ thanh toán lại cho bên B số tiền đặt cọc khi bên B kết thúc hợp đồng thuê phòng trọ và đã thanh toán
                    đầy đủ tiền điện, nước, phí vệ sinh và các khoản phí khác.</p>
                <p>Bên A không hoàn trả lại tiền đặt cọc nếu bên B chấm dứt hợp đồng trước thời hạn.</p>
                <p>Bên B ngừng hợp đồng, phải báo trước 1 tháng cho bên A biết.</p>
                <p>Bên A ngừng hợp đồng, phải báo trước 1 tháng cho bên B biết.</p>
                <p class="font-bold text-blue-700">Điều 3: Trách nhiệm của bên A</p>
                <p>Giao phòng trọ, trang thiết bị trong phòng cho bên B đúng ngày ký hợp đồng.</p>
                <p>Đảm bảo quyền sử dụng hợp pháp của bên B trong thời gian thuê phòng, nếu bên B thực hiện đúng các cam kết của
                    hợp đồng.</p>
                <p class="font-bold text-blue-700">Điều 4: Trách nhiệm của bên B</p>
                <p>Trả tiền thuê phòng đúng hạn theo hợp đồng.</p>
                <p>Sử dụng phòng trọ đúng mục đích, giữ gìn vệ sinh, bảo quản tài sản, các thiết bị của chủ nhà.</p>
                <p>Chấp hành đầy đủ các quy định của địa phương, đảm bảo an ninh trật tự.</p>
                <p>Không được tự ý sửa chữa, cải tạo phòng trọ nếu chưa có sự đồng ý của bên A.</p>
                <p class="font-bold text-blue-700">Điều 5: Điều khoản chung</p>
                <p>Hai bên A và B tự thỏa thuận các điều khoản ghi trên hợp đồng.</p>
                <p>Trong quá trình thực hiện hợp đồng, nếu phát sinh vấn đề mới, hai bên cùng nhau bàn bạc và thống nhất giải
                    quyết trên tinh thần hợp tác.</p>
                <p>Hợp đồng được lập thành 02 bản có giá trị ngang nhau, mỗi bên giữ 01 bản.</p>
            </div>
           
        </div>
       

    </body>
</html>
