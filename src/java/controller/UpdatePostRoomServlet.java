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
// Kiểm tra null và chuỗi rỗng trước khi parse
        float price1 = 0;
        price1 = Float.parseFloat(price.trim());
// In kiểm tra xem đã lấy được dữ liệu đúng chưa
        System.out.println("ID: " + id);
        System.out.println("Room Name: " + room_name);
        System.out.println("Price: " + price1);
        try {
            Part photo = request.getPart("image");
            String uploadDir = "D:\\FPT-university\\chuyên ngành 4\\javawedd\\code\\DoAnSWP\\web\\images";

            if (!Files.exists(Path.of(uploadDir))) {
                Files.createDirectories(Path.of(uploadDir));
            }

            // Lấy tên file từ đối tượng Part
            String filename = Path.of(photo.getSubmittedFileName()).getFileName().toString();

            // Tạo đường dẫn đầy đủ để lưu file
            String filePath = uploadDir + "/" + filename;

            // Ghi file vào thư mục
            photo.write(filePath);

            // In ra console để kiểm tra
            System.out.println("File saved at: " + filePath);

            // Lấy tên file
            String[] parts = filePath.split("/");
            String fileNameWithExtension = parts[parts.length - 1];

            // Cập nhật thông tin phòng trong database
            PostRoomsDao prd = new PostRoomsDao();
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
