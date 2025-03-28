package dao;

import database.database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.tree.ExpandVetoException;
import model.Customer;
import model.Position;
import model.Room;
import model.RoomAppointment;

public class RoomAppointmentDAO {

    public void createAppointment(String customerId, String roomId, String viewDate) {
        String sql = "INSERT INTO RoomAppointment (user_id, room_id, view_date, status)  "
                + "VALUES (?, ?, ?, ?);";
        int status = 0;
        try (Connection con = database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, customerId);
            ps.setString(2, roomId);
            ps.setString(3, viewDate);
            ps.setInt(4, status);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deteleAppointmentById(String appointmentId) {
        String sql = "DELETE FROM RoomAppointment where appointment_id = ?";
        try (Connection con = database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, appointmentId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<RoomAppointment> viewRoomAppointment_v(String customerId) {
        ArrayList<RoomAppointment> list_appointment = new ArrayList<>();
        String sql = "SELECT ra.appointment_id, ra.view_date, ra.status,\n"
                + "                            r.room_id, r.room_name, r.description, r.price, r.status AS room_status, r.image AS room_image, \n"
                + "                         p.position_id, p.number_house,p.street,p.ward,p.district,p.city, \n"
                + "                           u.user_id, u.email, u.phone_number, u.full_name, u.date_of_birth, u.image AS user_image \n"
                + "                             FROM RoomAppointment ra \n"
                + "                              JOIN Rooms r ON ra.room_id = r.room_id \n"
                + "                               JOIN Users u ON ra.user_id = u.user_id \n"
                + "                             JOIN Positions p ON r.position_id = p.position_id   "
                + "               WHERE ra.user_id = ?";
        try (Connection con = database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, customerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    RoomAppointment appointment = new RoomAppointment();
                    appointment.setAppointmentId(rs.getInt("appointment_id"));
                    appointment.setViewDate(rs.getString("view_date"));
                    appointment.setStatus(rs.getInt("status"));

                    // Tạo đối tượng Room
                    Room room = new Room();
                    room.setRoomId(rs.getString("room_id"));
                    room.setRoomName(rs.getString("room_name"));
                    room.setDescription(rs.getString("description"));
                    room.setPrice(rs.getDouble("price"));
                    room.setState(rs.getString("room_status"));
                    room.setImage(rs.getString("room_image"));
                    Position position = new Position(
                            rs.getString("number_house"),
                            rs.getString("street"),
                            rs.getString("ward"),
                            rs.getString("district"),
                            rs.getString("city"),
                            rs.getString("description")
                    );
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
                return list_appointment;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public ArrayList<RoomAppointment> viewRoomAppointment(String appointmentId) {
        ArrayList<RoomAppointment> list_appointment = new ArrayList<>();
        String sql = "SELECT ra.appointment_id, ra.view_date, ra.status,\n"
                + "                            r.room_id, r.room_name, r.description, r.price, r.status AS room_status, r.image AS room_image, \n"
                + "                         p.position_id, p.number_house,p.street,p.ward,p.district,p.city, \n"
                + "                           u.user_id, u.email, u.phone_number, u.full_name, u.date_of_birth, u.image AS user_image \n"
                + "                             FROM RoomAppointment ra \n"
                + "                              JOIN Rooms r ON ra.room_id = r.room_id \n"
                + "                               JOIN Users u ON ra.user_id = u.user_id \n"
                + "                             JOIN Positions p ON r.position_id = p.position_id  "
                + "WHERE ra.appointment_id = ?;";
        try (Connection con = database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, appointmentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    RoomAppointment appointment = new RoomAppointment();
                    appointment.setAppointmentId(rs.getInt("appointment_id"));
                    appointment.setViewDate(rs.getString("view_date"));
                    appointment.setStatus(rs.getInt("status"));

                    // Tạo đối tượng Room
                    Room room = new Room();
                    room.setRoomId(rs.getString("room_id"));
                    room.setRoomName(rs.getString("room_name"));
                    room.setDescription(rs.getString("description"));
                    room.setPrice(rs.getDouble("price"));
                    room.setState(rs.getString("status"));
//                    room.setImage(rs.getString("image"));
//                    
                    Position position = new Position(
                            rs.getString("number_house"),
                            rs.getString("street"),
                            rs.getString("ward"),
                            rs.getString("district"),
                            rs.getString("city"),
                            rs.getString("description")
                    );

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

    public String getUserIdByEmail(String email) {
        String sql = "SELECT user_id FROM Users where email=?";

        try (Connection con = database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet result = ps.executeQuery();
            while (result.next()) {
                return result.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getAppointmentId(String customerId, String roomId) {
        String sql = "SELECT appointment_id FROM RoomAppointment where user_id =? and room_id= ? ";
        try (Connection con = database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, customerId);
            ps.setString(2, roomId);

            ResultSet result = ps.executeQuery();
            while (result.next()) {
                return result.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getRoomIdByCustomerId(String customerId) {
        String sql = "SELECT room_id FROM RoomAppointment where user_id = ?";

        try (Connection con = database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, customerId);
            ResultSet result = ps.executeQuery();
            while (result.next()) {
                return result.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<RoomAppointment> getAllCustomerApp(String owner_id) {
        ArrayList<RoomAppointment> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            String sql = "SELECT u.user_id,u.email, u.full_name,u.phone_number, b.room_id,r.room_name,b.appointment_id, b.view_date, b.status\n"
                    + "FROM RoomAppointment b\n"
                    + "JOIN Rooms r ON b.room_id = r.room_id\n"
                    + "JOIN Users u ON b.user_id = u.user_id\n"
                    + "WHERE r.user_id = ?";
            pr = con.prepareStatement(sql);
            pr.setString(1, owner_id);
            rs = pr.executeQuery();
            while (rs.next()) {
                RoomAppointment appointment = new RoomAppointment();
                appointment.setAppointmentId(rs.getInt("appointment_id"));
                appointment.setViewDate(rs.getString("view_date"));
                appointment.setStatus(rs.getInt("status"));

                Room room = new Room();
                room.setRoomId(rs.getString("room_id"));
                room.setRoomName(rs.getString("room_name"));

                Customer customer = new Customer();
                customer.setEmail(rs.getString("email"));
                customer.setFullName(rs.getString("full_name"));

                appointment.setRoom(room);
                appointment.setCustomer(customer);
                list.add(appointment);

            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public void updateStatusApp(String appointmentId){
        Connection con = null;
        PreparedStatement pr = null;
        try{
            con=database.getConnection();
            String sql= "update RoomAppointment set status=1 where appointment_id=?";
            pr=con.prepareStatement(sql);
            pr.setString(1, appointmentId);
            pr.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
     public void updatedeleteStatusApp(String appointmentId){
        Connection con = null;
        PreparedStatement pr = null;
        try{
            con=database.getConnection();
            String sql= "update RoomAppointment set status=2 where appointment_id=?";
            pr=con.prepareStatement(sql);
            pr.setString(1, appointmentId);
            pr.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
