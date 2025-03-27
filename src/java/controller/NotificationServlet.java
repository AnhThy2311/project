/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ChatBoxDao;
import dao.CustomerDao;
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
import model.ChatBox;
import model.Notification;
import model.Room;

/**
 *
 * @author son
 */
@WebServlet(name = "NotificationServlet", urlPatterns = {"/NotificationServlet"})
public class NotificationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NotificationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NotificationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RoomDao roomDao = new RoomDao();
            ArrayList<Room> rooms = roomDao.getAllRooms();
            System.out.println("room la: " + rooms);
            System.out.println(rooms);
            if (rooms != null && !rooms.isEmpty()) {
                request.setAttribute("rooms", rooms);
            } else {
                request.setAttribute("rooms", null);
            }

            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            System.out.println("email: " + email);
            CustomerDao cud = new CustomerDao();
            String sendID = cud.getUserIdByEmail(email);
            System.out.println("senid: " + sendID);
            System.out.println(sendID);
            ChatBoxDao cbd = new ChatBoxDao();
            ArrayList<ChatBox> listreceicer = cbd.getSender(sendID); // đây là danh sách id của người gửi do nhầm lẫn
            System.out.println(listreceicer);
            session.setAttribute("list", listreceicer);
            NotificationDao ntd = new NotificationDao();
            ArrayList<Notification> ListNotification = ntd.getListNo(sendID);
            ntd.updateStateNotification(sendID);
            String countNotification = ntd.getCountNoti(sendID);
            System.out.println("count:" + countNotification);
            request.setAttribute("countNotification", countNotification);
            request.setAttribute("ListNotification", ListNotification);

            RequestDispatcher dispatcher = request.getRequestDispatcher("GetAllRoom.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // In ra stack trace để kiểm tra
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
