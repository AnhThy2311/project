/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author son
 */
@WebServlet(name="EditProfile", urlPatterns={"/EditProfile"})
public class EditProfile extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProfile</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfile at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String email = request.getParameter("email");
       String fullname = request.getParameter("name");
       String phone = request.getParameter("phone");
       String dob = request.getParameter("dob");
       CustomerDao cd = new CustomerDao();
       cd.UpdateCustomer(email, phone, dob, fullname);
       response.sendRedirect("Profile");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}