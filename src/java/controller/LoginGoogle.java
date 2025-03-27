/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.CustomerDao;
import model.Customer;
import util.Constants;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author son
 */
@WebServlet(name = "LoginGoogle", urlPatterns = {"/LoginGoogle"})
public class LoginGoogle extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginGoogle</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginGoogle at " + request.getContextPath() + "</h1>");
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
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            request.setAttribute("errorMessage", "Mã xác thực không hợp lệ!");
            request.getRequestDispatcher("Loggin.jsp").forward(request, response);
            return;
        }

        try {
            String accessToken = getToken(code);
            Customer customer = getUserInfo(accessToken);

            session.setAttribute("email", customer.getEmail());
            session.setAttribute("fullName", customer.getFullName());
            session.setAttribute("userImage", customer.getImage());
            session.setAttribute("isLoggedIn", true);

            CustomerDao customerDao = new CustomerDao();
            Customer existingCustomer = customerDao.exitEmail1(customer.getEmail());

            if (existingCustomer == null) {
                customer.setPassword("default_google_password"); // Gán mật khẩu mặc định
                customerDao.inserintoCustomer1(customer);
                existingCustomer = customer; // Cập nhật để sử dụng tiếp
            }

            int state = customerDao.getState(customer.getEmail());
            System.out.println("state là: "+state);
            session.setAttribute("state", state); // Lưu trạng thái vào session
            int entity_state = customerDao.getEntityState(customer.getEmail());
            if (entity_state == 1) {
                response.sendRedirect("RoomServlet");
            } else {
                request.setAttribute("errorMessage1", "Tài khoản cửa bạn đã bị khóa!");
                request.getRequestDispatcher("Loggin.jsp").forward(request, response);
            }

        } catch (IOException e) {
            Logger.getLogger(LoginGoogle.class.getName()).log(Level.SEVERE, "Login failed", e);
            request.setAttribute("errorMessage", "Đăng nhập với Google thất bại: " + e.getMessage());
            request.getRequestDispatcher("Loggin.jsp").forward(request, response);
        }
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
        processRequest(request, response);
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

    private String getToken(String code) throws IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form()
                        .add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI)
                        .add("code", code)
                        .add("grant_type", "authorization_code")
                        .build())
                .execute().returnContent().asString();

        JsonObject jsonObject = new Gson().fromJson(response, JsonObject.class);

        if (jsonObject.has("access_token")) {
            return jsonObject.get("access_token").getAsString();
        } else {
            throw new IOException("Failed to get access token: " + response);
        }
    }

    // Function to get user info from Google
    private Customer getUserInfo(String accessToken) throws IOException {
        String response = Request.Get(Constants.GOOGLE_LINK_GET_USER_INFO + accessToken)
                .execute().returnContent().asString();

        JsonObject jsonObject = new Gson().fromJson(response, JsonObject.class);

        if (!jsonObject.has("email")) {
            throw new IOException("Failed to retrieve user info: " + response);
        }

        Customer customer = new Customer();
        customer.setEmail(jsonObject.get("email").getAsString());
        customer.setFullName(jsonObject.get("name").getAsString());
        customer.setImage("default_user.jpg");

        return customer;
    }
}
