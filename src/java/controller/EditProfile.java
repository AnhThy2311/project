/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDao;
import dao.InformationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Information;

/**
 *
 * @author son
 */
@WebServlet(name = "EditProfile", urlPatterns = {"/EditProfile"})
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
            out.println("<h1>Servlet EditProfile at " + request.getContextPath() + "</h1>");
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
        String cccd = request.getParameter("cccd");
        String date = request.getParameter("date");
        Date IssueDate = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            IssueDate = sdf.parse(date); // Chuyển String thành Date
        } catch (ParseException e) {
            e.printStackTrace(); // In lỗi nếu sai định dạng
        }

        String placeOfIssue = request.getParameter("placeOfIssue");
        String permanentAddress = request.getParameter("permanentAddress");
        InformationDAO ifd = new InformationDAO();

        CustomerDao cd = new CustomerDao();
        String id = cd.getUserIdByEmail(email);
        int id1=Integer.parseInt(id);
        System.out.println(cccd);
        System.out.println(date);
        System.out.println(placeOfIssue);
        System.out.println(permanentAddress);
        System.out.println("id1:"+id1);
        Information info = new Information(id1, cccd, IssueDate, placeOfIssue, permanentAddress);
        System.out.println(info);
        try {
            ifd.updateInformation(info);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        cd.UpdateCustomer(email, phone, dob, fullname);
        response.sendRedirect("Profile");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
