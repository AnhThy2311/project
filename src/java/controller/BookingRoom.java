package controller;

import dao.BookingRoomDao;
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
import model.Room;
import java.util.ArrayList;

@WebServlet(name = "BookingRoom", urlPatterns = {"/BookingRoom"})
public class BookingRoom extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingRoom</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingRoom at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("roomid");
        BookingRoomDao bd = new BookingRoomDao();
        Room r = bd.getRoomById(id);
        request.setAttribute("r", r);
        request.setAttribute("id", id);
        request.getRequestDispatcher("BookingRoom.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        CustomerDao csd = new CustomerDao();
        String customerId = csd.getUserIdByEmail(email);

        WalletDAO wd = new WalletDAO();
        float balance = wd.getPrice(customerId);

//        String startDate = LocalDate.now().toString(); // Lấy ngày hôm nay theo format "yyyy-MM-dd"
//        System.out.println("Ngày bắt đầu: " + startDate);
        String booking_id = request.getParameter("booking_id");
        BookingRoomDao brd = new BookingRoomDao();

        String price = request.getParameter("price");
        float price1 = Float.parseFloat(price);
        if (balance < price1) {
            // Số dư không đủ => Trả về trang ListContractCustomer.jsp với thông báo lỗi
            request.setAttribute("errorMessage", "Số dư tài khoản không đủ để thanh toán!");
            BookingRoomDao bd = new BookingRoomDao();
            ArrayList<model.BookingRoom> list = bd.getNameRoombyEmail(email);
            request.setAttribute("list", list);
            request.getRequestDispatcher("ListContractCustomer.jsp").forward(request, response);
            return;
        }
//        String room_id = request.getParameter("roomId");
        RoomDao rd = new RoomDao();
//        String owner_id= rd.getOwnerId(room_id);
//        float price_owner = wd.getPrice(owner_id);
//        brd.setStartDatebyBookingId(startDate, booking_id);
//        brd.upadateMonth(booking_id);
//        wd.updatePrice(balance - price1, customerId);
//        wd.updatePrice(price_owner+price1, owner_id);
        BookingRoomDao bd = new BookingRoomDao();
        CustomerDao cd = new CustomerDao();
        String owner_id = cd.getUserIdByEmail(email);
        ArrayList<model.BookingRoom> list = bd.getCusTomerBooking(owner_id);
        request.setAttribute("list", list);
        System.out.println(list);
        response.sendRedirect("ListContractCustomer");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
