/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.FeedbackDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author anleq
 */
@WebServlet(name = "DeleteFeedbackServlet", urlPatterns = {"/DeleteFeedbackServlet"})
public class DeleteFeedbackServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String feedbackIdParam = request.getParameter("feedbackId");

        if (feedbackIdParam != null) {
            try {
                int feedbackId = Integer.parseInt(feedbackIdParam);
                FeedbackDao feedbackDao = new FeedbackDao();
                boolean success = feedbackDao.deleteFeedback(feedbackId);

                response.setContentType("text/plain");
                response.getWriter().write(success ? "success" : "failure");
            } catch (NumberFormatException e) {
                response.getWriter().write("invalid");
            }
        } else {
            response.getWriter().write("missing");
        }
    }
}

