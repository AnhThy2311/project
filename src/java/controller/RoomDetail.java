/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.FeedbackDao;
import dao.RoomDao;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Feedback;
import model.Room;

/**
 *
 * @author son
 */
@WebServlet(name = "RoomDetail", urlPatterns = {"/RoomDetail"})
public class RoomDetail extends HttpServlet { 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomIdParam = request.getParameter("roomId");
        RoomDao rd = new RoomDao();
        FeedbackDao fd = new FeedbackDao();
        HttpSession session = request.getSession();

        // Retrieve the email from the session
        String userEmail = (String) session.getAttribute("email");

        if (roomIdParam != null) {
            try {
                int roomId = Integer.parseInt(roomIdParam);
                Room room = rd.getRoomById(roomId);
                List<Feedback> fbList = fd.getAllFeedback(roomId);

                // Ensure user is logged in before checking feedback permissions
                boolean canFeedback = (userEmail != null) ? fd.checkUserEmailBooking(userEmail, roomId) : false;

                if (room != null) {
                    request.setAttribute("room", room);
                    request.setAttribute("feedbacks", fbList);
                    request.setAttribute("canFeedback", canFeedback);
                    request.setAttribute("userEmail", userEmail);  // Store email in request attribute

                    RequestDispatcher dispatcher = request.getRequestDispatcher("RoomDetails.jsp");
                    dispatcher.forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Room not found");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid room ID format");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Room ID is required");
        }
    }
}

