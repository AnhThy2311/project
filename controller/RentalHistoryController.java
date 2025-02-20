/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author HP
 */
import dao.RoomRentalHistoryDAO;
import model.RoomRentalHistory;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/rental-history")
public class RentalHistoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomIdStr = request.getParameter("roomId");

        if (roomIdStr != null && !roomIdStr.isEmpty()) {
            int roomId = Integer.parseInt(roomIdStr);
            RoomRentalHistoryDAO historyDAO = new RoomRentalHistoryDAO();
            List<RoomRentalHistory> historyList = null;
            try {
                historyList = historyDAO.getHistoryByRoomId(roomId);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(RentalHistoryController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            request.setAttribute("historyList", historyList);
        }

        request.getRequestDispatcher("rental-history.jsp").forward(request, response);
    }
}
