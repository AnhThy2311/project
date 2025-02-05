/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.Customer;
import model.UserDAO;
import static util.HelperUtil.getCurrentUser;


/**
 *
 * @author ADMIN
 */
public class profile_edit extends HttpServlet {

    private static final String MESSAGE_LABEL = "message";
    private static final String MESSAGE_WRONG_PASSWORD = "Mật khẩu xác nhận sai!";
    private static final String MESSAGE_EXISTED_EMAIL = "Email đã tồn tại!";
    private static final String MESSAGE_EDIT_PROFILE_SUCCESSFULLY = "Thay đổi thành công.";
    private static final String MESSAGE_PASSWORD_NOT_MATCHING = "Xác nhận mật khẩu sai";
    private static final String MESSAGE_CHANGE_PASSWORD_SUCCESSFULLY = "Đổi mật khẩu thành công. Đăng nhập lại để tiếp tục!";

    private UserDAO dao = new UserDAO();

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
            out.println("<title>Servlet profile_edit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet profile_edit at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
         String command = request.getParameter("COMMAND");
        switch (command) {
            case "EDIT_PROFILE" -> {
                editProfile(request, response);
                break;
            }
            case "CHANGE_PASSWORD" -> {
                changePassword(request, response);
                break;
            }
            
        }
    }

       private void editProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String phone = request.getParameter("phone");
        String fullname = request.getParameter("fullname");
        String dob = request.getParameter("birthDate");
        Customer tempUser = new Customer();
        tempUser.setPhone(phone);
        tempUser.setFullName(fullname);
        tempUser.setBirthDate(dob);
            
        dao.updateUser(phone, fullname, dob);
            
        request.setAttribute(MESSAGE_LABEL, MESSAGE_EDIT_PROFILE_SUCCESSFULLY);
        request.getRequestDispatcher("Change_profile.jsp").forward(request, response);
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String rePass = request.getParameter("reNewPass");
        String currentUser = getCurrentUser(request);

        if (dao.checkAuth(currentUser, oldPass) == null) {
            request.setAttribute(MESSAGE_LABEL, MESSAGE_WRONG_PASSWORD);
            request.getRequestDispatcher("Change_password.jsp").forward(request, response);

        } else if (!newPass.equals(rePass)) {
            request.setAttribute(MESSAGE_LABEL, MESSAGE_PASSWORD_NOT_MATCHING);
            request.getRequestDispatcher("Change_password.jsp").forward(request, response);

        } else {
            dao.changePassword(currentUser, newPass);
            request.setAttribute(MESSAGE_LABEL, MESSAGE_CHANGE_PASSWORD_SUCCESSFULLY);
            request.getRequestDispatcher("Change_password.jsp").forward(request, response);

        }

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
