/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.ChatBoxDao;
import dao.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;


@WebServlet(name="OwnerGetMess", urlPatterns={"/OwnerGetMess"})
public class OwnerGetMess extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OwnerGetMess</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OwnerGetMess at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        CustomerDao cud= new CustomerDao();
        String sendID= cud.getUserIdByEmail(email);
        System.out.println(sendID);
        ChatBoxDao cbd = new ChatBoxDao();
        ArrayList<String> listreceicer= cbd.getReceiverID(sendID);
        System.out.println(listreceicer);
        session.setAttribute("list", listreceicer);
        response.sendRedirect("RoomServlet");
//        request.getRequestDispatcher("Header1.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
