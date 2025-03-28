<%-- 
    Document   : Ugradeaccount
    Created on : Mar 2, 2025, 11:54:46 PM
    Author     : son
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>
            Nâng Cấp Tài Khoản
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
    </head>
    <body>
        <% if (request.getAttribute("error") != null) { %>
        <script>
        alert('<%= request.getAttribute("error") %>');
        </script>
        <% } %>

        <div class="bg-gradient-to-r from-blue-400 to-purple-500 font-roboto">
            <div class="min-h-screen flex items-center justify-center">
                <div class="bg-white p-12 rounded-lg shadow-lg max-w-lg w-full">
                    <h1 class="text-3xl font-bold text-center mb-6 text-blue-600">
                        Nâng Cấp Tài Khoản
                    </h1>
                    <p class="text-center text-gray-700 mb-8 text-lg">
                        Bạn muốn nâng cấp tài khoản lên <b>Owner</b> để có thể đăng bài? Vui lòng đọc và đồng ý các điều khoản sau:
                    </p>

                    <div class="bg-gray-100 p-4 rounded-lg mb-6">
                        <ul class="list-decimal list-inside text-gray-700 text-sm">
                            <li>Chia <b>30%</b> tiền trọ trong tháng đầu tiên người thuê trả.</li>
                            <li>Người thuê chỉ trả tiền tháng đầu tiên. Những tháng sau, bạn và người thuê sẽ tự liên lạc để thống nhất chi phí trọ, điện, nước. Nếu có vi phạm, bạn phải báo cáo để chúng tôi xử lý.</li>
                            <li>Hợp đồng sẽ được soạn thảo. Khi thuê, cả hai bên cần tải xuống, ký tay để đảm bảo xử lý khi có rủi ro.</li>
                            <li>Bạn cần tốn <b>300,000 VND</b> để đăng ký tài khoản Owner.</li>
                        </ul>
                    </div>

                    <form action="UgradeaccountServlet" method="get">
                        <div class="flex items-center mb-6">
                            <input type="checkbox" id="agreeTerms" class="mr-2 w-5 h-5" onchange="toggleUpgradeButton()">
                            <label for="agreeTerms" class="text-gray-700 text-sm">Tôi đồng ý với các điều khoản trên</label>
                        </div>

                        <div class="flex justify-center mb-8">
                            <img alt="Hình ảnh minh họa cho việc nâng cấp tài khoản" class="rounded-full" height="120" src="https://storage.googleapis.com/a1aa/image/--A-GKR_8HbpNYauBIHjA6gcWwhvKwBZXWKFn0FXjV4.jpg" width="120"/>
                        </div>

                        <button type="submit" id="upgradeButton" class="w-full bg-blue-500 text-white py-3 rounded-lg hover:bg-blue-600 transition duration-300 text-lg" disabled>
                            Nâng Cấp Ngay
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function toggleUpgradeButton() {
                let checkbox = document.getElementById("agreeTerms");
                let button = document.getElementById("upgradeButton");
                button.disabled = !checkbox.checked;
            }
        </script>
    </body>

</html>
