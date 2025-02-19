/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ChatBoxDao;
import dao.CustomerDao;
import dao.RoomDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ChatBox;

/**
 *
 * @author son
 */
@WebServlet(name = "Chatbox", urlPatterns = {"/Chatbox"})
public class Chatbox extends HttpServlet {

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
            out.println("<title>Servlet Chatbox</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Chatbox at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomId = request.getParameter("roomid");
        System.out.println("roomId: " + roomId);
        RoomDao rd = new RoomDao();
        String reveivedId = rd.getOwnerId(roomId);
        System.out.println("reveiveId:"+reveivedId);
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        CustomerDao csd = new CustomerDao();
        String sendId = csd.getUserIdByEmail(email);
        System.out.println("sendID:" + sendId);
        ChatBoxDao cbd = new ChatBoxDao();
        ArrayList<ChatBox> list;
        try {
            list = cbd.getAllChatBox(sendId, reveivedId);
            // Đặt sendId và receivedId vào request attribute
            request.setAttribute("sendId", sendId);
            request.setAttribute("reveivedId", reveivedId);
            request.setAttribute("list", list);
            request.setAttribute("roomId", roomId);
            System.out.println("list là: " + list);

            request.getRequestDispatcher("ChatBox.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Chatbox.class.getName()).log(Level.SEVERE, null, ex);
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
