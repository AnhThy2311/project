/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author HP
 */
import dao.PostRoomsDao;
import model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 * Servlet để lấy thông tin chủ sở hữu của một phòng dựa trên room_id.
 * Khi người dùng click vào một phòng, servlet này sẽ nhận room_id từ request,
 * tìm kiếm thông tin chủ sở hữu trong database và trả về dưới dạng JSON.
 */
@WebServlet("/owner-info")
public class OwnerInfoServlet extends HttpServlet {
    
    /**
     * Xử lý request GET để lấy thông tin chủ sở hữu dựa trên room_id.
     * @param request HTTP request chứa tham số room_id.
     * @param response HTTP response trả về thông tin chủ sở hữu hoặc lỗi.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        // Lấy room_id từ request
        String roomId = request.getParameter("room_id");
        if (roomId == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.write("{\"error\": \"Missing room_id\"}");
            return;
        }
        
        // Gọi DAO để lấy thông tin chủ sở hữu dựa trên room_id
        PostRoomsDao postRoomsDao = new PostRoomsDao();
        Customer owner = postRoomsDao.getOwnerByRoomId(roomId);
        
        // Kiểm tra nếu không tìm thấy chủ sở hữu
        if (owner == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            out.write("{\"error\": \"Owner not found\"}");
            return;
        }
        
        // Tạo đối tượng JSON chứa thông tin chủ sở hữu
        JSONObject json = new JSONObject();
        json.put("fullName", owner.getFullName());
        json.put("phone", owner.getPhone());
        json.put("email", owner.getEmail());
        json.put("image", owner.getImage());
        
        // Gửi phản hồi về client
        out.write(json.toString());
    }
}

