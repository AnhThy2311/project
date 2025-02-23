package controller;

import dao.CustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;
import model.Customer;
import util.EncryptionPasword;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            int userRole = cd.getRoleByEmail(email);
            System.out.println("anh dai dien: " + c.getImage());
            HttpSession http = request.getSession();
            http.setAttribute("email", c.getEmail());
            http.setAttribute("userImage", c.getImage());
            http.setAttribute("userName", c.getFullName());
            http.setAttribute("role", userRole);
            // Lưu đường dẫn ảnh
             if(state==3){
                 http.setAttribute("state", state);
             }
               response.sendRedirect("RoomServlet");
        } else {
            request.setAttribute("errorMessage", "Email or password is incorrect!");
            request.getRequestDispatcher("Loggin.jsp").forward(request, response);
        }
    }
}
