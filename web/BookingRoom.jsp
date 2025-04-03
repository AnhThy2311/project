<%@ page import="model.Room" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <% Room r = (Room) request.getAttribute("r"); %>
        <% String id = (String) request.getAttribute("id"); %>
        <form action="ConfirmBooking" method="get">
            <input type="hidden" name="id" value="<%= id %>">
            <div class="bg-gray-200 flex items-center justify-center min-h-screen">
                <div class="bg-white shadow-lg rounded-lg overflow-hidden w-full max-w-4xl lg:max-w-7xl">
                    <div class="flex flex-col lg:flex-row">
                        <div class="lg:w-1/2">
                            <img alt="Room Image"
                                 class="w-full h-full object-cover"
                                 height="500"
                                 src="<%=request.getContextPath()%>/images/<%=r.getImage()%>"
                                 width="900"/>
                        </div>

                        <div class="lg:w-1/2 p-10 bg-gray-100">
                            <h2 class="text-2xl font-semibold mb-6 text-blue-700 text-center">
                                <%=r.getCustomer().getFullName()%>
                            </h2>
                            <p class="text-xl text-gray-700 mb-8 text-center" id="price">
                                Giá thuê: <%= r.getPrice() %> VND / tháng
                            </p>

                            <div class="mb-6">
                                <label class="block text-gray-700 text-lg" for="date">
                                    Ngày thuê:
                                </label>
                                <input 
                                    class="mt-2 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500 text-lg p-3"
                                    id="date" type="date" name="date" required />
                            </div>


                            <div class="mb-6">
                                <label class="block text-gray-700 text-lg" for="duration">
                                    Thời hạn thuê (tháng):
                                </label>
                                <input class="mt-2 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500 text-lg p-3"
                                       id="duration" type="number" name="month" oninput="calculateTotal()" required/>
                            </div>
                            <div class="mb-6">
                                <label class="block text-gray-700 text-lg mb-2">
                                    Hình thức thanh toán:
                                </label>
                                <label class="block text-gray-700 text-lg mb-4">
                                    Thanh toán tháng đầu tiên
                                </label>
                            </div>
                            <div class="mb-6">
                                <label class="block text-gray-700 text-lg" for="total">
                                    Số tiền cần thanh toán 
                                </label>
                                <input class="mt-2 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500 text-lg p-3"
                                       id="total" type="text"  value="<%=r.getPrice() %>"name="totalPrice" readonly/>
                            </div>
                            <%
    String error = (String) session.getAttribute("error11");
    if (error != null) {
                            %>
                            <div class="bg-red-500 text-white text-center p-4 rounded-lg mb-4">
                                <%= error %>
                            </div>
                            <%
                                session.removeAttribute("error11"); // Xóa session sau khi hiển thị
                                }
                            %>
                            <button class="w-full bg-blue-500 text-white py-4 rounded-lg hover:bg-blue-600 text-xl transition duration-300"
                                    type="submit">
                                Xác nhận Thuê
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <script>
            const today = new Date();
            const tomorrow = new Date(today);
            tomorrow.setDate(today.getDate() + 9);

            const dateInput = document.getElementById('date');
            dateInput.min = today.toISOString().split('T')[0];
            dateInput.max = tomorrow.toISOString().split('T')[0];
        </script>
    </body>
</html>
