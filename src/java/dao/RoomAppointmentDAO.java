/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import database.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Position;
import model.Room;
import model.RoomAppointment;


/**
 *
 * @author ADMIN
 */
public class RoomAppointmentDAO {
    public void createAppointment(int customerId, int roomId, String viewDate, int status){
        String sql = "INSERT INTO RoomAppointment (user_id, room_id, view_date, status)  " +
"VALUES (?, ?, ?, ?);";
    try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            ps.setInt(2,  roomId);
            ps.setString(3, viewDate);
            ps.setInt(4, status);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
     public void deteleAppointmentById(int appointmentId){
         String sql = "DELETE FROM RoomAppointment where appointment_id = ?";
         try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
         ps.setInt(1,appointmentId);
         ps.executeQuery();
         }catch (Exception e) {
            e.printStackTrace();
        }
    }
    
     public List<RoomAppointment> viewRoomAppointment(int appointmentId) {
        List<RoomAppointment> list_appointment = new ArrayList<>();
        String sql = "SELECT ra.appointment_id, ra.view_date, ra.status, "
               + "r.room_id, r.room_name, r.description, r.price, r.status AS room_status, r.image AS room_image, "
               + "p.position_id, p.position_name, "
               + "u.user_id, u.email, u.phone_number, u.full_name, u.date_of_birth, u.image AS user_image "
               + "FROM RoomAppointment ra "
               + "JOIN Rooms r ON ra.room_id = r.room_id "
               + "JOIN Users u ON ra.user_id = u.user_id "
               + "JOIN Positions p ON r.position_id = p.position_id "
                + "WHERE ra.appointment_id = ?;";

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, appointmentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    RoomAppointment appointment = new RoomAppointment();
                    appointment.setAppointmentId(rs.getInt("appointment_id"));
                    appointment.setViewDate(rs.getString("view_date"));
                    appointment.setStatus(rs.getInt("status"));
                    
                    // Tạo đối tượng Room
                    Room room = new Room();
                    room.setRoomId(rs.getInt("room_id"));
                    room.setRoomName(rs.getString("room_name"));
                    room.setDescription(rs.getString("description"));
                    room.setPrice(rs.getDouble("price"));
                    room.setStatus(rs.getInt("status"));
//                    room.setImage(rs.getString("image"));
//                    
                    Position position = new Position();
                    position.setPositionId(rs.getInt("position_id"));
                    position.setPositionName(rs.getString("position_name"));
                    room.setPosition(position);
                    
                    // Tạo đối tượng Customer
                    Customer customer = new Customer();
                    customer.setEmail(rs.getString("email"));
                    customer.setPhone(rs.getString("phone_number"));
                    customer.setFullName(rs.getString("full_name"));
                    customer.setBirthDate(rs.getString("date_of_birth"));
//                    customer.setImage(rs.getString("image"));
                    room.setCustomer(customer);

                    appointment.setRoom(room);
                    list_appointment.add(appointment);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list_appointment;
    }
     
    public int getUserIdByEmail(String email) {
        String sql = "SELECT user_id FROM Users where email=?";

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet result = ps.executeQuery();
            while (result.next()) {
                return result.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public int getAppointmentId(int customerId, int roomId){
    String sql ="SELECT appointment_id FROM RoomAppointment where user_id =? and room_id= ? ";
    try(Connection con = Database.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)){
        ps.setInt(1, customerId);
        ps.setInt(2, roomId);
        
        ResultSet result = ps.executeQuery();
            while (result.next()) {
                        return result.getInt(1);
            }
    }catch (Exception e) {
            e.printStackTrace();
        }
    return -1;
    }
    
    public int getRoomIdByCustomerId(int customerId){
    String sql ="SELECT room_id FROM RoomAppointment where user_id = ?";
    
    try(Connection con = Database.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)){
        ps.setInt(1, customerId);
        ResultSet result = ps.executeQuery();
            while (result.next()) {
                        return result.getInt(1);
            }
    }catch (Exception e) {
            e.printStackTrace();
        }
    return -1;
    }
}
