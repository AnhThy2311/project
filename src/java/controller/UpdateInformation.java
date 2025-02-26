package controller;

import dao.CustomerDao;
import dao.InformationDAO;
import model.Information;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "UpdateInformation", urlPatterns = {"/UpdateInformation"})
public class UpdateInformation extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve email from request
        String email = request.getParameter("userId"); // This is actually the email, not userId

        // Get the user ID from the database
        CustomerDao customerDao = new CustomerDao();
        int userId = customerDao.getUserId(email); // Convert email to userId

        InformationDAO dao = new InformationDAO();
        Information info = null;
        try {
            info = dao.getInformation(userId);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateInformation.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("information", info);
        request.getRequestDispatcher("EditInformation.jsp").forward(request, response);
    }
}
