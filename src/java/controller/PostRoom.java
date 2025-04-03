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
import java.util.List;
import java.util.ArrayList;

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
        request.setCharacterEncoding("UTF-8");

// Thư mục upload ảnh
        String uploadDir = "D:\\FPT-university\\chuyên ngành 4\\javawedd\\code\\DoAnSWP1\\web\\images";
        Path path = Path.of(uploadDir);

        if (!Files.exists(path)) {
            Files.createDirectories(path); // Tạo thư mục nếu chưa có
        }

        if (!Files.isWritable(path)) {
            System.out.println("Thư mục upload không có quyền ghi.");
            response.sendRedirect("GetPendingapproval?error=upload_directory_not_writable");
            return;
        }

// Lấy tất cả ảnh từ form upload
        List<Part> photos = request.getParts().stream()
                .filter(part -> "image".equals(part.getName()) && part.getSize() > 0) // Đảm bảo name="image"
                .toList();

        List<String> imageFileNames = new ArrayList<>();

        if (photos.isEmpty()) {
            System.out.println("Không có file ảnh nào được tải lên.");
            response.sendRedirect("GetPendingapproval?error=no_images");
            return;
        }

        for (Part photo : photos) {
            String filename = Path.of(photo.getSubmittedFileName()).getFileName().toString();
            String filePath = uploadDir + "\\" + filename;

            // Kiểm tra và ghi file ảnh
            try {
                photo.write(filePath);
                imageFileNames.add(filename);
                System.out.println("File đã lưu tại: " + filePath);
            } catch (IOException e) {
                System.out.println("Lỗi khi lưu file: " + e.getMessage());
                response.sendRedirect("GetPendingapproval?error=file_write_error");
                return;
            }
        }

// Kiểm tra danh sách ảnh đã upload
        System.out.println("Danh sách ảnh đã upload: " + imageFileNames);

// Lấy dữ liệu từ form
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String street = request.getParameter("street");
        String descriptionlocation = request.getParameter("descriptionlocation");
        String houseNumber = request.getParameter("houseNumber");
        String roomName = request.getParameter("room_name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String price_el = request.getParameter("price_el");
        String price_water = request.getParameter("price_water");
        String area = request.getParameter("area");
// Xử lý giá (chuyển đổi từ String sang số)
        float price = 0;
        float price_water1 = 0;
        float price_el1 = 0;
        float area1 = 0;
        if (priceStr != null && !priceStr.isEmpty()) {
            try {
                price = Float.parseFloat(priceStr);
            } catch (NumberFormatException e) {
                System.out.println("Lỗi chuyển đổi giá: " + e.getMessage());
                response.sendRedirect("GetPendingapproval?error=invalid_price");
                return;
            }
        }
        if (price_water != null && !price_water.isEmpty()) {
            try {
                price_water1 = Float.parseFloat(price_water);
            } catch (NumberFormatException e) {
                System.out.println("Lỗi chuyển đổi giá: " + e.getMessage());
                response.sendRedirect("GetPendingapproval?error=invalid_price");
                return;
            }
        }
        if (price_el != null && !price_el.isEmpty()) {
            try {
                price_el1 = Float.parseFloat(price_el);
            } catch (NumberFormatException e) {
                System.out.println("Lỗi chuyển đổi giá: " + e.getMessage());
                response.sendRedirect("GetPendingapproval?error=invalid_price");
                return;
            }
        }
        if (area != null && !area.isEmpty()) {
            try {
                area1 = Float.parseFloat(area);
            } catch (NumberFormatException e) {
                System.out.println("Lỗi chuyển đổi giá: " + e.getMessage());
                response.sendRedirect("GetPendingapproval?error=invalid_price");
                return;
            }

// Lấy Room ID và User ID
            PostRoomsDao prd = new PostRoomsDao();
            int position_id = prd.getCountRoom() + 1;
            String positionIdStr = String.valueOf(position_id);
            System.out.println("postRoom Id :" + positionIdStr);
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            CustomerDao cd = new CustomerDao();
            prd.insertPosition(houseNumber, street, ward, district, city, descriptionlocation);
            int user_id = cd.getUserId(email);
            if (!imageFileNames.isEmpty()) {
                prd.insertRooms(roomName, description, price, position_id, user_id, imageFileNames.get(0), price_el1, price_water1, area1); // Lưu ảnh đầu tiên vào Rooms
            } else {
                prd.insertRooms(roomName, description, price, position_id, user_id, "default_image.jpg", price_el1, price_water1, area1); // Ảnh mặc định nếu không có ảnh upload
            }
// Insert dữ liệu vào database

// Lưu toàn bộ ảnh vào bảng Image
// Kiểm tra danh sách ảnh trước khi ghi vào DB
            String Room_id = prd.getByRoomIdByPositionID(positionIdStr);

            System.out.println("Room_id" + Room_id);
            if (!imageFileNames.isEmpty()) {
                for (String fileName : imageFileNames) {
                    try {
                        prd.insertIntoImage(fileName, Room_id);  // Gọi hàm insert để lưu ảnh vào DB
                        System.out.println("Đã thêm ảnh vào bảng Image: " + fileName);
                    } catch (Exception e) {
                        System.out.println("Lỗi khi thêm ảnh vào DB: " + e.getMessage());
                    }
                }
            } else {
                System.out.println("Không có ảnh để thêm vào bảng Image.");
            }
            response.sendRedirect("GetPendingapproval");
        }
    }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
