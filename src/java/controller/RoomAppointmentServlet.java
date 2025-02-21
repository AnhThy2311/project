/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RoomAppointmentDAO;
import model.RoomAppointment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RoomAppointment", urlPatterns = {"/RoomAppointment"})
public class RoomAppointmentServlet extends HttpServlet {
    RoomAppointmentDAO appointmentdao = new RoomAppointmentDAO();
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
            out.println("<title>Servlet RoomAppointment</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoomAppointment at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        int customerId = appointmentdao.getUserIdByEmail(email);
        int roomId = appointmentdao.getRoomIdByCustomerId(customerId);
        int appointmentId = appointmentdao.getAppointmentId(customerId, roomId);
        List<RoomAppointment> list_Appointment =appointmentdao.viewRoomAppointment(appointmentId); // Fetch rooms from database
        if (list_Appointment != null && !list_Appointment.isEmpty()) {
            request.setAttribute("list_appointment", list_Appointment);
        } else {
            request.setAttribute("list_appointment", null);
        }
        request.getRequestDispatcher("RoomAppointment.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String command = request.getParameter("COMMAND");
        switch (command) {
            case "CREATE_APPOINTMENT" -> {
                createAppointment(request, response);
            }
            case "DELETE_APPOINTMENT" -> {
                deleteAppointment(request, response);
                break;
            }  
        }
    }
protected void createAppointment (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        int customerId = appointmentdao.getUserIdByEmail(email);
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        int status = Integer.parseInt(request.getParameter("status"));
        String viewDate = request.getParameter("viewDate");
        appointmentdao.createAppointment(customerId, roomId, viewDate, status);
        int appointmentId = appointmentdao.getAppointmentId(customerId, roomId);
        List<RoomAppointment> list_Appointment =appointmentdao.viewRoomAppointment(appointmentId); // Fetch rooms from database
        if (list_Appointment != null && !list_Appointment.isEmpty()) {
            request.setAttribute("list_appointment", list_Appointment);
        } else {
            request.setAttribute("list_appointment", null);
        }
        request.getRequestDispatcher("RoomAppointment.jsp").forward(request, response);
        }
    
    protected void deleteAppointment (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        int customerId = appointmentdao.getUserIdByEmail(email);
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        int appointmentId = appointmentdao.getAppointmentId(customerId, roomId);
        appointmentdao.deteleAppointmentById(appointmentId);
        List<RoomAppointment> list_Appointment =appointmentdao.viewRoomAppointment(appointmentId); // Fetch rooms from database
        if (list_Appointment != null && !list_Appointment.isEmpty()) {
            request.setAttribute("list_appointment", list_Appointment);
        } else {
            request.setAttribute("list_appointment", null);
        }
        request.getRequestDispatcher("RoomAppointment.jsp").forward(request, response);
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
