package controller;

import dao.BookingRoomDao;
import dao.CustomerDao;
import dao.FeedbackDao;
import dao.NotificationDao;
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
import java.util.ArrayList;
import model.Feedback;
import model.Notification;
import model.Room;


@WebServlet(name = "RoomDetail", urlPatterns = {"/RoomDetail"})
public class RoomDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RoomDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoomDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomIdParam = request.getParameter("roomId");
        RoomDao rd = new RoomDao();
        FeedbackDao fd = new FeedbackDao();
        HttpSession session = request.getSession();
        CustomerDao cd = new CustomerDao();
        // Retrieve the email from the session
        String userEmail = (String) session.getAttribute("email");
        BookingRoomDao brd = new BookingRoomDao();
        
        if (roomIdParam != null) {
            try {
                ArrayList<String> listimage= brd.imaglist(roomIdParam);
                request.setAttribute("listimage", listimage);
                System.out.println("listimage:"+listimage);
                int count_checkBooking = brd.CheckBooking(roomIdParam);
                request.setAttribute("count_checkBooking", count_checkBooking);
                int count = cd.getCountCCCD(userEmail);
                request.setAttribute("countCCCD", count);
                int roomId = Integer.parseInt(roomIdParam);
                System.out.println("roomid la: "+roomId);
                Room room = rd.getRoomById(roomId);
                System.out.println("room: " + room);
                ArrayList<Feedback> fbList = (ArrayList<Feedback>) fd.getAllFeedback(roomId);
                
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
