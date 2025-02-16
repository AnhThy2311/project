/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RoomDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Room;

/**
 *
 * @author anleq
 */
public class RoomDetail extends HttpServlet {

    private RoomDAO roomDAO = new RoomDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomIdParam = request.getParameter("roomId");
        if (roomIdParam != null) {
            try {
                int roomId = Integer.parseInt(roomIdParam);
                Room room = roomDAO.getRoomById(roomId);
                if (room != null) {
                    request.setAttribute("room", room);
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
