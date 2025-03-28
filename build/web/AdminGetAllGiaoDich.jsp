<%@ page import="model.Transaction" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, model.Withdrawals, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>
            Wallet Page
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
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
    </head>
    <body>
        <%
   ArrayList<Withdrawals> list = (ArrayList<Withdrawals>) request.getAttribute("list");
   SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        %>
        <div class="bg-gray-200 text-gray-800 flex items-center justify-center min-h-screen">
            <div class="w-full max-w-3xl p-6 bg-white shadow-lg rounded-lg">
                <h1 class="text-2xl font-bold mb-6 text-blue-600">Transaction List</h1>
                <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
                    <thead class="bg-blue-500 text-white">
                        <tr>
                            <th class="py-3 px-4 text-left">Số tài khoản</th>
                            <th class="py-3 px-4 text-left">Ngày Giao dịch</th>
                            <th class="py-3 px-4 text-left">Số tiền giao dịch</th>
                            <th class="py-3 px-4 text-left">Tên Ngân Hàng</th>
                            <th class="py-3 px-4 text-left">Tên Tài Khoản</th>
                            <th class="py-3 px-4 text-left">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (list != null && !list.isEmpty()) { %>
                        <% for (Withdrawals wd : list) { %>
                        <tr class="border-b border-gray-200 hover:bg-gray-100">
                            <td class="py-3 px-4"><%= wd.getAccount_number() %></td>
                            <td class="py-3 px-4"><%= wd.getDate() %></td>
                            <td class="py-3 px-4"><%= wd.getPrice() %> VNĐ</td>
                            <td class="py-3 px-4"><%= wd.getBank_name() %></td>
                            <td class="py-3 px-4"><%= wd.getRecipient_name() %></td>
                            <td>
                                <div class="d-flex gap-2">
                                    <form action="ApproveWithdrawalServlet" method="get">
                                        <input type="hidden" name="user_id" value="<%= wd.getUser_id() %>">
                                         <input type="hidden" name="price" value="<%= wd.getPrice() %>">
                                        <button type="submit" class="btn btn-success btn-sm">
                                            Đồng ý
                                        </button>
                                    </form>
                                </div>
                            </td>


                        </tr>
                        <% } %>
                        <% } else { %>
                        <tr>
                            <td colspan="5" class="py-3 px-4 text-center">Không có giao dịch nào.</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>
