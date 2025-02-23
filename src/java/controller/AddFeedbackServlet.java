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
@WebServlet(name = "AddFeedbackServlet", urlPatterns = {"/AddFeedbackServlet"})
public class AddFeedbackServlet extends HttpServlet {
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
}

