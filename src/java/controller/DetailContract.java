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
import model.BookingRoom;
/**
 *
 * @author son
 */
@WebServlet(name="DetailContract", urlPatterns={"/DetailContract"})
public class DetailContract extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet DetailContract</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailContract at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String roomID= request.getParameter("roomId");
          HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        CustomerDao cd = new CustomerDao();
        String customer = cd.getUserIdByEmail(email);
         String id= request.getParameter("roomid");
        RoomDao rd = new RoomDao();
        String ownerId= rd.getOwnerId(id);
        CustomerDao csd = new CustomerDao();
        String customerId= csd.getUserIdByEmail(email);
        BookingRoomDao bd = new BookingRoomDao();
        String owner_id = bd.getOWnerID(roomID);
        ArrayList<BookingRoom> list = bd.getContract(customerId, owner_id);
        BookingRoom br = bd.getInfoContract(customerId, owner_id);
        request.setAttribute("br", br);
        request.setAttribute("list", list);
         request.getRequestDispatcher("DetailContract.jsp").forward(request, response);
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
