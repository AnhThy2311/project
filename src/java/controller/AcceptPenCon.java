/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author son
 */
@WebServlet(name = "AcceptPenCon", urlPatterns = {"/AcceptPenCon"})
public class AcceptPenCon extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AcceptPenCon</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AcceptPenCon at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        CustomerDao csd = new CustomerDao();
        String owner_id = csd.getUserIdByEmail(email);

        WalletDAO wd = new WalletDAO();
        String room_id = request.getParameter("roomId");
        System.out.println("rooid:" + room_id);
        RoomDao rd = new RoomDao();
        String booking_id = request.getParameter("booking_id");
        BookingRoomDao rkd = new BookingRoomDao();
        String customerId = rkd.getIdCustomer(booking_id);
        float price_owner = wd.getPrice(owner_id);
        System.out.println("tiền owner " + price_owner);
        float balance = wd.getPrice(customerId);
        System.out.println("tiền customer: " + balance);
        String startDate = LocalDate.now().toString(); // Lấy ngày hôm nay theo format "yyyy-MM-dd"
        System.out.println("Ngày bắt đầu: " + startDate);
        BookingRoomDao brd = new BookingRoomDao();
        String price = request.getParameter("price");
        float price1 = Float.parseFloat(price); // tiền trọ 
        System.out.println("tiền trọ : " + price1);
        brd.setStartDatebyBookingId(startDate, booking_id);
        brd.upadateMonth(booking_id);
        wd.updatePrice(balance - price1, customerId);
        wd.updatePrice(price_owner + price1, owner_id);
        brd.AcceptPendingContract(booking_id);
        ArrayList<model.BookingRoom> list = brd.getUserPendingExtend(email);
        request.setAttribute("list", list);
        request.getRequestDispatcher("GetCustomerExten.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
