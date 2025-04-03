/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CustomerDao;
import dao.PostRoomsDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "UpdatePostRoomServlet", urlPatterns = {"/UpdatePostRoomServlet"})
@MultipartConfig
public class UpdatePostRoomServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdatePostRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePostRoomServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String room_name = request.getParameter("room_name");
        String price = request.getParameter("price");

        float price1 = 0;
        if (price != null && !price.trim().isEmpty()) {
            price1 = Float.parseFloat(price.trim());
        }
        System.out.println("ID: " + id);
        System.out.println("Room Name: " + room_name);
        System.out.println("Price: " + price1);
        PostRoomsDao prd = new PostRoomsDao();
        String fileNameWithExtension = prd.getImageRoom(id);  // Lấy ảnh hiện tại trong DB
        System.out.println("Ảnh cũ là: " + fileNameWithExtension);
        try {
            Part photo = request.getPart("image");
            // Kiểm tra nếu người dùng có tải lên ảnh mới
            if (photo != null && photo.getSize() > 0) {
                String uploadDir = "D:\\FPT-university\\chuyên ngành 4\\javawedd\\code\\DoAnSWP\\web\\images";
                if (!Files.exists(Path.of(uploadDir))) {
                    Files.createDirectories(Path.of(uploadDir));
                }
                // Lấy tên file từ Part
                String filename = Path.of(photo.getSubmittedFileName()).getFileName().toString();
                String filePath = uploadDir + "/" + filename;
                // Lưu file vào thư mục
                photo.write(filePath);
                System.out.println("File mới được lưu tại: " + filePath);
                // Cập nhật ảnh mới
                fileNameWithExtension = filename;
                System.out.println("Ảnh mới là: " + fileNameWithExtension);
            } else {
                System.out.println("Không có file mới được tải lên, giữ nguyên ảnh cũ.");
            }
            // Cập nhật thông tin phòng trong database
            prd.updatePostRoom(room_name, price1, fileNameWithExtension, id);
            response.sendRedirect("RoomServlet");

        } catch (IOException | ServletException ex) {
            ex.printStackTrace();  // In lỗi ra console để debug
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
