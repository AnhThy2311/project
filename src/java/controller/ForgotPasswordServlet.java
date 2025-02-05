package controller;

import java.io.IOException;
import java.util.Properties;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;

public class ForgotPasswordServlet extends HttpServlet {

    private class EmailUtil {
        public static void sendEmail(String recipientEmail, String subject, String message) {
            final String username = "tranhuyen11311@gmail.com"; 
            final String password = "jccu uqkj sjea suhe";  

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
                mimeMessage.setContent(message, "text/html; charset=utf-8"); // Set content type to HTML

                Transport.send(mimeMessage);
                System.out.println("Email sent successfully!");

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String resetLink = "http://localhost:8080/swp201c/change-password.jsp?email=" + email;

        // Create the email message with HTML formatting
        String message = "<h1>Reset Your Password</h1>"
                       + "<p><b>Is this you or somebody trying to change your password?</b></p>"
                       + "<p>If it's you, then click the link below to change your account password or ignore!</p>"
                       + "<p><a href=\"" + resetLink + "\">Reset your password</a></p>";

        EmailUtil.sendEmail(email, "Reset Your Password", message);

        // Redirect to notification page
        request.setAttribute("email", email);
        request.getRequestDispatcher("notification.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
