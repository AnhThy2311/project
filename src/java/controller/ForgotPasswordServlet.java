package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class ForgotPasswordServlet extends HttpServlet {

    private class EmailUtil {
        public static void sendEmail(String recipientEmail, String subject, String message) {
            final String username = "nghuynh5079@gmail.com"; 
            final String password = "tyAL0Tme!";  // Replace with your actual email password

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP host for Gmail
            props.put("mail.smtp.port", "587"); // Port number for TLS/STARTTLS

            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            try {
                Message mimeMessage = new MimeMessage(session);
                mimeMessage.setFrom(new InternetAddress("nghuynh5079@gmail.com"));
                mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
                mimeMessage.setSubject(subject);
                mimeMessage.setText(message);

                Transport.send(mimeMessage);
                System.out.println("Email sent successfully!");

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private String generateOtp() {
        // Method to generate a random OTP
        return "123456"; 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        // Generate OTP and send to email
        String otp = generateOtp(); // Implement generateOtp method
        EmailUtil.sendEmail(email, "Mã xác nhận", "Mã xác nhận của bạn là: " + otp); // Implement EmailUtil class and sendEmail method

        // Set email as a request attribute and forward to notification page
        request.setAttribute("email", email);
//        request.getRequestDispatcher("notification.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
