
package controller;

import dao.BookingRoomDao;
import dao.ContractDao;
import dao.CustomerDao;
import dao.RoomDao;
import dao.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "ConfirmBooking", urlPatterns = {"/ConfirmBooking"})
public class ConfirmBooking extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConfirmBooking</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmBooking at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        RoomDao rd = new RoomDao();
        String ownerId = rd.getOwnerId(id);
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        CustomerDao csd = new CustomerDao();
        String customerId = csd.getUserIdByEmail(email);

        WalletDAO wd = new WalletDAO();
        float balance = wd.getPrice(customerId);

        String date = request.getParameter("date");
        ContractDao ctrd = new ContractDao();
        String month = request.getParameter("month");
        String totalprice = request.getParameter("totalPrice");
        float total = 0;

        if (totalprice != null && !totalprice.isEmpty()) {
            try {
                total = Float.parseFloat(totalprice.replace(",", "").replace(" VND", "").trim());
                System.out.println("total: " + total);
            } catch (NumberFormatException e) {
                e.printStackTrace(); // Xử lý lỗi nếu chuyển đổi thất bại
            }
        }
        if (balance < total) {
            System.out.println("balance:"+balance);
            session.setAttribute("error11", "Số dư tài khoản không đủ để thực hiện giao dịch!");
            request.setAttribute("id", id); // Truyền lại id phòng
            response.sendRedirect("BookingRoom?roomid="+id);
            return; // Dừng không cho đặt phòng
        }
        wd.updatePrice(balance-total,customerId);
        BookingRoomDao bd = new BookingRoomDao();
        bd.InsertIntoBookingRoom(customerId, id, date, month);
        String booking_id = bd.getBookingId(id);
        float admin_price = total * 30 / 100; //        .insertIntoContract(ownerId, customerId, ownerId, 0, 0);
        ctrd.insertIntoContract(booking_id, customerId, ownerId, total, admin_price);
        response.sendRedirect("RoomServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
