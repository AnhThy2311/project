package controller;

import dao.BookingRoomDao;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.BookingRoom;

@WebServlet(name = "ListContractCustomer", urlPatterns = {"/ListContractCustomer"})
public class ListContractCustomer extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListContractCustomer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListContractCustomer at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookingRoomDao bd = new BookingRoomDao();
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        ArrayList<BookingRoom> list = bd.getNameRoombyEmail(email);
        request.setAttribute("list", list);
        System.out.println(list);
        request.getRequestDispatcher("ListContractCustomer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookingRoomDao bd = new BookingRoomDao();
        HttpSession session = request.getSession();

        // Lấy email từ session
        String email = (String) session.getAttribute("email");
        ArrayList<BookingRoom> list = bd.getNameRoombyEmail(email);
        request.setAttribute("list", list);

        // Kiểm tra tham số submitted và booking_id
        String submitted = request.getParameter("submitted");
        String booking_id = request.getParameter("booking_id");

        if (submitted != null && submitted.equals("true") && booking_id != null) {
            bd.CancelBookingRoom(booking_id);
            System.out.println("Đã hủy booking với ID: " + booking_id);
        }

        request.getRequestDispatcher("ListContractCustomer.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
