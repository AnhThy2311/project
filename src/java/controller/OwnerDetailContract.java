/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookingRoomDao;
import dao.CustomerDao;
import dao.RoomDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author son
 */
@WebServlet(name = "OwnerDetailContract", urlPatterns = {"/OwnerDetailContract"})
public class OwnerDetailContract extends HttpServlet {

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
            out.println("<title>Servlet OwnerDetailContract</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OwnerDetailContract at " + request.getContextPath() + "</h1>");
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
        String roomID = request.getParameter("roomId");
        System.out.println("roomid: " + roomID);
        String customer_id = request.getParameter("user_id");
        CustomerDao cd = new CustomerDao();
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String Owner_id = cd.getUserIdByEmail(email);
        BookingRoomDao bd = new BookingRoomDao();

        String boo_id = bd.Booking_id(roomID);
        System.out.println("booking_id: " + boo_id);
        String contract_id = bd.Contract_id(boo_id);
        System.out.println("contract id: " + contract_id);
        ArrayList<model.BookingRoom> list = bd.getContract(customer_id, Owner_id, contract_id);
        model.BookingRoom br = bd.getInfoContract(customer_id, Owner_id, contract_id);
        request.setAttribute("br", br);
        request.setAttribute("list", list);
        request.getRequestDispatcher("DetailContract.jsp").forward(request, response);
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
