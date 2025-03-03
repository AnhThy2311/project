/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.InetAddress;
import java.util.UUID;
import util.PayLib;

/**
 *
 * @author admin
 */
@WebServlet("/vnpay_payment")
public class VNPayServlet extends HttpServlet {
    private final String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    private final String returnUrl = "http://localhost:8082/DoAnSWP1/vnpay_return";
    private final String tmnCode = "PBE1R802";
    private final String hashSecret = "L5LOIXX2HK3UVHHBJLLGLO65JESM39YW";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String amount = request.getParameter("amount");
            String infor = request.getParameter("user_id");

            if (amount == null || infor == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters");
                return;
            }

            PayLib pay = new PayLib();
            String txnRef = UUID.randomUUID().toString();
            String clientIp = InetAddress.getLocalHost().getHostAddress();

            pay.addRequestData("vnp_Version", "2.1.0");
            pay.addRequestData("vnp_Command", "pay");
            pay.addRequestData("vnp_TmnCode", tmnCode);
            pay.addRequestData("vnp_Amount", String.valueOf(Integer.parseInt(amount) * 100));
            pay.addRequestData("vnp_BankCode", "");
            pay.addRequestData("vnp_CreateDate", new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date()));
            pay.addRequestData("vnp_CurrCode", "VND");
            pay.addRequestData("vnp_IpAddr", clientIp);
            pay.addRequestData("vnp_Locale", "vn");
            pay.addRequestData("vnp_OrderInfo", infor);
            pay.addRequestData("vnp_OrderType", "other");
            pay.addRequestData("vnp_ReturnUrl", returnUrl);
            pay.addRequestData("vnp_TxnRef", txnRef);

            String paymentUrl = pay.createRequestUrl(vnp_PayUrl, hashSecret);

            response.sendRedirect(paymentUrl);

        } catch (Exception e) {
            response.getWriter().println("Error generating payment URL: " + e.getMessage());
        }
    }
}


