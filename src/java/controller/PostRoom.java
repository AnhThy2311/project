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

/**
 *
 * @author son
 */
@WebServlet(name = "PostRoom", urlPatterns = {"/PostRoom"})
@MultipartConfig
public class PostRoom extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PostRoom</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostRoom at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8"); // Đảm bảo hỗ trợ tiếng Việt
        //
        Part photo = request.getPart("image");
        String uploadDir = "D:\\FPT-university\\chuyên ngành 4\\javawedd\\code\\DoAnSWP1\\web\\images";
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
        String[] parts = filePath.split("/");
        // Lấy tên file (phần cuối của mảng parts)
        String fileNameWithExtension = parts[parts.length - 1]; // tên file
        // Phản hồi lại cho người dùng
//        response.getWriter().println("File uploaded successfully at: " + fileNameWithExtension);

        // Lấy dữ liệu từ form
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String street = request.getParameter("street");
        String descriptionlocation= request.getParameter("descriptionlocation");
        String houseNumber = request.getParameter("houseNumber");
        String roomName = request.getParameter("room_name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");

        // Xử lý giá (chuyển đổi từ String sang số)
        float price = 0;
        if (priceStr != null && !priceStr.isEmpty()) {
            price = Float.parseFloat(priceStr);
        }
        System.out.println(price);

        // Kiểm tra dữ liệu nhận được
        System.out.println("City: " + city);
        System.out.println("District: " + district);
        System.out.println("Ward: " + ward);
        System.out.println("Street: " + street);
        System.out.println("House Number: " + houseNumber);
        System.out.println("Room Name: " + roomName);
        System.out.println("Description: " + description);
        System.out.println("Price: " + price);
        PostRoomsDao prd = new PostRoomsDao();
        int position_id = prd.getCountRoom() + 1;
        System.out.println("position: "+position_id);
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        CustomerDao cd= new CustomerDao();
        int user_id= cd.getUserId(email);
        System.out.println("used_id"+user_id);
        prd.insertPosition(houseNumber, street, ward, district, city, descriptionlocation);
        prd.insertRooms(roomName, description, price, position_id, user_id, fileNameWithExtension);
        response.sendRedirect("GetPendingapproval");
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

}
