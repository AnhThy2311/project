/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author HP
 */
import dao.LandlordDAO;
import model.Landlord;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/landlords")
public class LandlordController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LandlordDAO landlordDAO = new LandlordDAO();
        List<Landlord> landlords = null;
        try {
            landlords = landlordDAO.getAllLandlords();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LandlordController.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("landlords", landlords);
        request.getRequestDispatcher("landlords.jsp").forward(request, response);
    }
}
