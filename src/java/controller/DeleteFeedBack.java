package controller;

import dao.FeedbackDao;
import dao.ReportFeedbackDAo;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteFeedBack", urlPatterns = {"/DeleteFeedBack"})
public class DeleteFeedBack extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteFeedBack</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteFeedBack at " + request.getContextPath() + "</h1>");
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
        String feed_backid = request.getParameter("feedback");
        String roomid = request.getParameter("roomid");
        FeedbackDao fb = new FeedbackDao();
        fb.deleteFeedback1(feed_backid);
        response.sendRedirect("RoomDetail?roomId=" + roomid);
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
        String feed_backid = request.getParameter("feedback");
        String roomid = request.getParameter("roomid");
        ReportFeedbackDAo efp = new ReportFeedbackDAo();
        efp.updateReportComment(feed_backid);
         response.sendRedirect("RoomDetail?roomId=" + roomid + "&reportSuccess=true");  
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
