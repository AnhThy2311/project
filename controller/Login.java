package controller;

import dao.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import util.EncryptionPasword;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("loginname");
        String password = request.getParameter("password");

        CustomerDao cd = new CustomerDao();
        password = EncryptionPasword.toSHA1(password);
        Customer c = cd.getCustomer(email, password);
        System.out.println(c);
//        System.out.println("anh dai dien: " +c.getImage());
        int state = cd.getState(email);
        if (c != null) {
                    System.out.println("anh dai dien: " +c.getImage());
            HttpSession http = request.getSession();
            http.setAttribute("email", c.getEmail());
            http.setAttribute("userImage", c.getImage());  // Lưu đường dẫn ảnh
             if(state==3){
                 http.setAttribute("state", state);
             }
               response.sendRedirect("RoomServlet");
        } else {
            request.setAttribute("errorMessage", "Email or password is incorrect!");
            request.getRequestDispatcher("Loggin.jsp").forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
