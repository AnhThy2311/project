package controller;

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
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

@WebServlet(name = "LoginGoogle", urlPatterns = {"/LoginGoogle"})
public class LoginGoogle extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            Customer existingCustomer = customerDao.exitEmail(customer.getEmail());
            if (existingCustomer == null) {
                customer.setPassword("default_google_password"); // Gán mật khẩu mặc định
                customerDao.inserintoCustomer(customer);
            }

            response.sendRedirect("search.jsp");
        } catch (IOException e) {
            Logger.getLogger(LoginGoogle.class.getName()).log(Level.SEVERE, "Login failed", e);
            request.setAttribute("errorMessage", "Đăng nhập với Google thất bại: " + e.getMessage());
            request.getRequestDispatcher("Loggin.jsp").forward(request, response);
        }
    }

    // Function to get access_token from Google
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
        customer.setImage(jsonObject.get("picture").getAsString());

        return customer;
    }
}
