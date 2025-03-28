/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RoomAppointmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.RoomAppointment;


@WebServlet(name = "RoomAppointmentServlet", urlPatterns = {"/RoomAppointmentServlet"})
    public class RoomAppointmentServlet extends HttpServlet {
  RoomAppointmentDAO appointmentdao = new RoomAppointmentDAO();
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RoomAppointmentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoomAppointmentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String customerId = appointmentdao.getUserIdByEmail(email);
//        int roomId = appointmentdao.getRoomIdByCustomerId(customerId);
//        int appointmentId = appointmentdao.getAppointmentId(customerId, roomId);
        ArrayList<RoomAppointment> list_Appointment =appointmentdao.viewRoomAppointment_v(customerId); // Fetch rooms from database
        System.out.println(list_Appointment);
        if (list_Appointment != null && !list_Appointment.isEmpty()) {
            request.setAttribute("list_appointment", list_Appointment);
        } else {
            request.setAttribute("list_appointment", null);
        }
        request.getRequestDispatcher("RoomAppointment.jsp").forward(request, response);
    }

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

    protected void createAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        System.out.println("email: "+email);
        String customerId = appointmentdao.getUserIdByEmail(email);
        String roomId = (request.getParameter("roomId"));
        System.out.println("roomID"+ roomId);
        String viewDate = request.getParameter("view_date");
        System.out.println("viewDAte: "+viewDate);
        appointmentdao.createAppointment(customerId, roomId, viewDate);
        String appointmentId = appointmentdao.getAppointmentId(customerId, roomId);
        ArrayList<RoomAppointment> list_Appointment = appointmentdao.viewRoomAppointment(appointmentId); 
        if (list_Appointment != null && !list_Appointment.isEmpty()) {
            request.setAttribute("list_appointment", list_Appointment);
        } else {
            request.setAttribute("list_appointment", null);
        }
       response.sendRedirect("RoomAppointmentServlet");
    }

    protected void deleteAppointment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String customerId = appointmentdao.getUserIdByEmail(email);
        String roomId = (request.getParameter("roomId"));
        String appointmentId = appointmentdao.getAppointmentId(customerId, roomId);
        appointmentdao.deteleAppointmentById(appointmentId);
        ArrayList<RoomAppointment> list_Appointment = (ArrayList<RoomAppointment>) appointmentdao.viewRoomAppointment(appointmentId); // Fetch rooms from database
        if (list_Appointment != null && !list_Appointment.isEmpty()) {
            request.setAttribute("list_appointment", list_Appointment);
        } else {
            request.setAttribute("list_appointment", null);
        }
        response.sendRedirect("RoomAppointmentServlet");
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
