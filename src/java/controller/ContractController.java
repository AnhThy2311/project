package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.ContractDAO;
import model.Contract;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/submitContract")
public class ContractController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContractDAO contractDAO;

    public void init() {
        try {
            contractDAO = new ContractDAO();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ContractController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contractId = Integer.parseInt(request.getParameter("contractId"));
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        int tenantId = Integer.parseInt(request.getParameter("tenantId"));
        int landlordId = Integer.parseInt(request.getParameter("landlordId"));
        String creationDateStr = request.getParameter("creationDate");
        String content = request.getParameter("content");
        String status = request.getParameter("status");
        int requestId = Integer.parseInt(request.getParameter("requestId"));

        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date creationDate = formatter.parse(creationDateStr);

            Contract contract = new Contract(contractId, bookingId, tenantId, landlordId, creationDate, content, status, requestId);
            contractDAO.addContract(contract);

            // Set contract as a request attribute and forward to content page
            request.setAttribute("contract", contract);
            request.getRequestDispatcher("ContractContent.jsp").forward(request, response);
        } catch (ParseException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
