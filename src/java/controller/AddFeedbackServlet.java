
package controller;

import dao.FeedbackDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AddFeedbackServlet", urlPatterns = {"/AddFeedbackServlet"})
public class AddFeedbackServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddFeedbackServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddFeedbackServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userEmail = request.getParameter("usename");
        String content = request.getParameter("content");
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        System.out.println("roomId: " + roomId);
//        int rating = Integer.parseInt(request.getParameter("rating"));
        FeedbackDao feedbackDao = new FeedbackDao();
        boolean success = feedbackDao.addFeedback(userEmail, roomId, content);
        response.sendRedirect("RoomDetail?roomId="+roomId);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String userEmail = request.getParameter("userEmail");
        String content = request.getParameter("content");
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        int rating = Integer.parseInt(request.getParameter("rating"));

        FeedbackDao feedbackDao = new FeedbackDao();
        boolean success = feedbackDao.addFeedback(userEmail, roomId, content, rating);

        response.setContentType("text/plain");
        response.getWriter().write(success ? "success" : "failure");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
