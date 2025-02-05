/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author HP
 */
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.CustomerDAO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UploadAvatarServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email"); // Lấy email từ form

        Part filePart = request.getPart("avatar"); // Lấy file tải lên
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Đường dẫn thư mục lưu ảnh
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Lưu file vào thư mục uploads
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Đường dẫn ảnh để lưu vào database
        String imagePath = UPLOAD_DIR + "/" + fileName;

        // Cập nhật avatar trong database
        CustomerDAO customerDAO = new CustomerDAO();
        boolean updateSuccess = customerDAO.updateAvatar(email, imagePath);

        if (updateSuccess) {
            response.sendRedirect("profile.jsp?email=" + email + "&success=true");
        } else {
            response.sendRedirect("profile.jsp?email=" + email + "&error=true");
        }
    }
}
