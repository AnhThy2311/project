package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (newPassword.equals(confirmPassword)) {
            // Update the user's password in the database
            // (Assuming you have a method updateUserPassword(email, newPassword))

            // Redirect to success page or login page
            response.sendRedirect("login.jsp");
        } else {
            // Handle password mismatch
            response.sendRedirect("change-password.jsp?email=" + email + "&error=Passwords do not match");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
