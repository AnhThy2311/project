package controller;
import dao.CustomerDao;
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


@WebServlet(name="OwnerRoomAppointment", urlPatterns={"/OwnerRoomAppointment"})
public class OwnerRoomAppointment extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OwnerRoomAppointment</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OwnerRoomAppointment at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        CustomerDao csd = new CustomerDao();
        String owner_id = csd.getUserIdByEmail(email);
        System.out.println("owner: "+owner_id);
        RoomAppointmentDAO rap = new RoomAppointmentDAO();
        ArrayList<RoomAppointment> list = rap.getAllCustomerApp(owner_id);
        request.setAttribute("list", list);
        request.getRequestDispatcher("GetCustomerAppRoom.jsp").forward(request, response);
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
