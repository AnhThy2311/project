package controller;

import dao.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.Authenticator;

@WebServlet(name = "ApproveWithdrawalServlet", urlPatterns = {"/ApproveWithdrawalServlet"})
public class ApproveWithdrawalServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ApproveWithdrawalServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApproveWithdrawalServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        String price = request.getParameter("price");
        WalletDAO wd = new WalletDAO();
        wd.AcceptRutTien(user_id);
        Float price1 = Float.parseFloat(price);
        System.out.println("price: "+price);
        Float balance = wd.getPrice(user_id);
        wd.updatePrice(balance - price1, user_id);
        response.sendRedirect("AdminGetAllGiaoDich");
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
