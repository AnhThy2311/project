/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TransactionDAO;
import dao.WalletDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import util.PayLib;

/**
 *
 * @author admin
 */
@WebServlet("/vnpay_return")
public class VNPayReturnServlet extends HttpServlet {

    private static final String HASH_SECRET = "L5LOIXX2HK3UVHHBJLLGLO65JESM39YW";
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
        String vnp_Amount = request.getParameter("vnp_Amount");
        
        if (vnp_OrderInfo == null || vnp_Amount == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters.");
            return;
        }
        
        int userId = Integer.parseInt(vnp_OrderInfo);
        double amount = Double.parseDouble(vnp_Amount) / 100.0;
        
        WalletDAO walletDAO = new WalletDAO();
        TransactionDAO transactionDAO = new TransactionDAO();
        
        String rawData = request.getQueryString();
        int hashIndex = rawData.indexOf("&vnp_SecureHash");
        if (hashIndex != -1) {
            rawData = rawData.substring(0, hashIndex);
        }
        
        boolean isValidSignature = PayLib.hmacSHA512(HASH_SECRET, rawData).equalsIgnoreCase(vnp_SecureHash);
        
        if (isValidSignature) {
            if ("00".equals(vnp_ResponseCode)) {
                boolean updateSuccess = walletDAO.updateBalance(userId, amount);
                if (updateSuccess) {
                    transactionDAO.createTransaction(userId, amount, 1);
//                    response.getWriter().write("{\"status\": \"Success\", \"message\": \"Payment completed successfully.\"}");
                    response.sendRedirect("WalletServlet");
                } else {
                    transactionDAO.createTransaction(userId, amount, 2);
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating wallet balance.");
                }
            } else {
                transactionDAO.createTransaction(userId, amount, 2);
                response.getWriter().write("{\"status\": \"Failed\", \"message\": \"Payment failed with error code: " + vnp_ResponseCode + "\"}");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid response signature.");
        }
    }
}
