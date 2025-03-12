/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Room;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.database;
import model.Customer;
import model.Position;


public class RoomDao {

    public ArrayList<Room> getAllRooms() {
        ArrayList<Room> rooms = new ArrayList<>();
        String sql = "SELECT  r.room_id,r.room_name, r.description, r.price, r.image, \n"
                + "                     p.number_house,p.street,p.ward, p.district,p.city ,p.description AS position_desc, \n"
                + "                     u.email, u.phone_number, u.full_name, u.date_of_birth, u.image AS user_image \n"
                + "                   FROM Rooms r \n"
                + "                   JOIN Positions p ON r.position_id = p.position_id \n"
                + "                   JOIN Users u ON r.user_id = u.user_id and r.status=1 ";
        try (Connection con = database.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Position position = new Position(
                        rs.getString("number_house"),
                        rs.getString("street"),
                        rs.getString("ward"),
                        rs.getString("district"),
                        rs.getString("city"),
                        rs.getString("description")
                );

                Customer customer = new Customer();
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone_number"));
                customer.setFullName(rs.getString("full_name"));
                customer.setBirthDate(rs.getString("date_of_birth"));
                customer.setImage(rs.getString("user_image"));

                Room room = new Room(
                        rs.getString("room_id"),
                        rs.getString("room_name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        position,
                        customer,
                        rs.getString("image")
                );
                rooms.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rooms;
    }

    public ArrayList<Room> searchGetRoom(String city, String ward, String district, String street) {
        ArrayList<Room> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String sql = "			   SELECT  \n"
                    + "    r.room_id, \n"
                    + "    r.room_name, \n"
                    + "    r.description, \n"
                    + "    r.price, \n"
                    + "    r.image, \n"
                    + "    p.number_house, \n"
                    + "    p.street, \n"
                    + "    p.ward, \n"
                    + "    p.district, \n"
                    + "    p.city, \n"
                    + "    p.description AS position_desc, \n"
                    + "    u.email, \n"
                    + "    u.phone_number, \n"
                    + "    u.full_name, \n"
                    + "    u.date_of_birth, \n"
                    + "    u.image AS user_image \n"
                    + "FROM  \n"
                    + "    Rooms r \n"
                    + "JOIN  \n"
                    + "    Positions p ON r.position_id = p.position_id \n"
                    + "JOIN  \n"
                    + "    Users u ON r.user_id = u.user_id\n"
                    + "WHERE  \n"
                    + "    p.city LIKE ? \n"
                    + "	 and p.district like ?\n"
                    + "    AND p.ward LIKE ? \n"
                    + "    AND p.street LIKE ? \n"
                    + "AND r.status=1";
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, "%" + city + "%");
            pr.setString(2, "%" + district + "%");
            pr.setString(3, "%" + ward + "%");
            pr.setString(4, "%" + street + "%");

            rs = pr.executeQuery();
            while (rs.next()) {
                Position position = new Position(
                        rs.getString("number_house"),
                        rs.getString("street"),
                        rs.getString("ward"),
                        rs.getString("district"),
                        rs.getString("city"),
                        rs.getString("description")
                );

                Customer customer = new Customer();
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone_number"));
                customer.setFullName(rs.getString("full_name"));
                customer.setBirthDate(rs.getString("date_of_birth"));
                customer.setImage(rs.getString("user_image"));

                Room room = new Room(
                        rs.getString("room_id"),
                        rs.getString("room_name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        position,
                        customer,
                        rs.getString("image")
                );
                list.add(room);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Room getRoomById(int roomId) {
        String sql = "SELECT r.room_id, r.room_name, r.description, r.price, r.status, r.image, \n"
                + "                p.position_id, p.number_house,p.street, p.ward,p.district,p.city, p.description AS position_desc, \n"
                + "               u.user_id, u.email, u.phone_number, u.full_name, u.date_of_birth, u.image AS user_image \n"
                + "               FROM Rooms r \n"
                + "               JOIN Positions p ON r.position_id = p.position_id \n"
                + "               JOIN Users u ON r.user_id = u.user_id \n"
                + "               WHERE r.room_id = ?";

        try (Connection con = database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, roomId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Position position = new Position(
                            rs.getString("number_house"),
                            rs.getString("street"),
                            rs.getString("ward"),
                            rs.getString("district"),
                            rs.getString("city"),
                            rs.getString("description")
                    );

                    Customer customer = new Customer();
                    customer.setEmail(rs.getString("email"));
                    customer.setPhone(rs.getString("phone_number"));
                    customer.setFullName(rs.getString("full_name"));
                    customer.setBirthDate(rs.getString("date_of_birth"));
                    customer.setImage(rs.getString("user_image"));

                    return new Room(
                            rs.getString("room_id"),
                            rs.getString("room_name"),
                            rs.getString("description"),
                            rs.getDouble("price"),
                            rs.getString("status"),
                            position,
                            customer,
                            rs.getString("image")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
// lấy owner bằng cách dựa vào roomid

    public String getOwnerId(String roomid) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String sql = "select u.user_id from Users as u , Rooms as r where u.user_id=r.user_id and r.room_id=?";
            con = database.getConnection();
            pr = con.prepareCall(sql);
            pr.setString(1, roomid);
            rs = pr.executeQuery();
            if (rs.next()) {
                String idOwner = rs.getString(1);
                return idOwner;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
 
   
}
