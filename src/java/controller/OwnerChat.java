
package controller;

import dao.ChatBoxDao;
import dao.CustomerDao;
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


@WebServlet(name = "OwnerChat", urlPatterns = {"/OwnerChat"})
public class OwnerChat extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OwnerChat</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OwnerChat at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        CustomerDao cud = new CustomerDao();
        String sendID = cud.getUserIdByEmail(email);
        System.out.println(sendID);
//        String receiveID = request.getParameter("receiver_id");
        String receiveID = request.getParameter("receiverId");
        ChatBoxDao cbd = new ChatBoxDao();
        ArrayList<ChatBox> list;
        try {
            list = cbd.getAllChatBox(sendID, receiveID);
            request.setAttribute("sendId", sendID);
            request.setAttribute("reveivedId", receiveID);
            request.setAttribute("list", list);
            request.getRequestDispatcher("lienheOwner.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
