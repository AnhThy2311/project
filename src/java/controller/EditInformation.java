package controller;

import dao.CustomerDao;
import dao.InformationDAO;
import model.Information;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "EditInformation", urlPatterns = {"/EditInformation"})
public class EditInformation extends HttpServlet {

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    HttpSession session = request.getSession();
    
    // Get userId from session
    Integer userId = (Integer) session.getAttribute("userId");
    
    // If userId is missing, retrieve it from the email
    if (userId == null) {
        String email = (String) session.getAttribute("email"); // Get email from session
        if (email != null) {
            CustomerDao customerDao = new CustomerDao();
            userId = customerDao.getUserId(email); // Get userId from DB
            session.setAttribute("userId", userId); // Store userId in session
        }
    }

    // Check if userId is still null
    if (userId == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if userId is missing
        return;
    }

    // Get form data
    String cccd = request.getParameter("cccd");
    String issueDateString = request.getParameter("issueDate");
    String placeOfIssue = request.getParameter("placeOfIssue");
    String permanentAddress = request.getParameter("permanentAddress");

    // Convert issueDate from string to Date
    Date issueDate = null;
    try {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        issueDate = sdf.parse(issueDateString);
    } catch (ParseException ex) {
        ex.printStackTrace();
    }

    // Create Information object
    Information info = new Information(userId, cccd, issueDate, placeOfIssue, permanentAddress);

    // Update information in the database
    InformationDAO dao = new InformationDAO();
    try {
        dao.updateInformation(info);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    // Redirect back to profile page after update
    response.sendRedirect("Profile");
}

}
