/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.BookingRoomDao;
import dao.ContractDao;
import dao.CustomerDao;
import dao.NotificationDao;
import dao.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name="BookingActionServlet", urlPatterns={"/BookingActionServlet"})
public class BookingActionServlet extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingActionServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingActionServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String roomId = request.getParameter("idRooom");
        BookingRoomDao bd = new BookingRoomDao();
        bd.updateBooking(roomId);
        String bookingID= bd.getBookingId(roomId);
        ContractDao ctrd = new ContractDao();
        ctrd.updateContract(bookingID);
        float total = Float.parseFloat(request.getParameter("totalPrice"));
        String email_customer= request.getParameter("email_customer");
        HttpSession session = request.getSession();
        String email_owner = (String) session.getAttribute("email");
        CustomerDao cd= new CustomerDao();
        String user_id= cd.getUserIdByEmail(email_owner);
        NotificationDao nfd = new NotificationDao();
        nfd.AcceptRentRoom(user_id);
        WalletDAO wd = new WalletDAO();
        float price_user= wd.getPrice(user_id);
        float total_price = total*70/100 +price_user;
        System.out.println("total:"+total_price);
        wd.updatePrice(total_price, user_id);
        response.sendRedirect("OwnerBookingRoom");
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String roomId = request.getParameter("idRooom");
        BookingRoomDao bd = new BookingRoomDao();
        bd.cancelBooking(roomId);
        String bookingID= bd.getBookingId(roomId);
        ContractDao ctrd = new ContractDao();
        float total = Float.parseFloat(request.getParameter("totalPrice"));
        String email_customer= request.getParameter("email_customer");
       
        CustomerDao cd = new CustomerDao();
        String cusromer_id = cd.getUserIdByEmail(email_customer);
         NotificationDao nfd = new NotificationDao();
        nfd.cacelRentRoom(cusromer_id);
        WalletDAO wd = new WalletDAO();
        float price_customer= wd.getPrice(cusromer_id);
        System.out.println("toal_price:"+(price_customer+total));
        wd.updatePrice(price_customer+total, cusromer_id);
        response.sendRedirect("OwnerBookingRoom");
    }
  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
