/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDao;
import dao.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author son
 */
@WebServlet(name = "UgradeaccountServlet", urlPatterns = {"/UgradeaccountServlet"})
public class UgradeaccountServlet extends HttpServlet {

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
            out.println("<title>Servlet UgradeaccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UgradeaccountServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessionUser = request.getSession(false); // Không tạo session mới nếu chưa tồn tại
        String email = (sessionUser != null) ? (String) sessionUser.getAttribute("email") : null;
        System.out.println("eamil: "+email);
        CustomerDao cd = new CustomerDao();
        String id = cd.getUserIdByEmail(email);
        WalletDAO wd = new WalletDAO();
        float price = wd.getPrice(id);
        if (price < 300000) {
            request.setAttribute("error", "Tài khoản không đủ số dư để nâng cấp!");
            request.getRequestDispatcher("Ugradeaccount.jsp").forward(request, response);
        } else {
            float price1 = price - 300000;
            wd.updatePrice(price1, id);
            cd.updateRoles(email);
            cd.AccountUpdate(id, 300000);
            response.sendRedirect("RoomServlet");
        }

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
