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

/**
 *
 * @author son
 */
public class RoomDao {

    public ArrayList<Room> getAllRooms() {
        ArrayList<Room> rooms = new ArrayList<>();
        String sql = "SELECT  r.room_id,r.room_name, r.description, r.price, r.image, \n" +
"                     p.number_house,p.street,p.ward, p.district,p.city ,p.description AS position_desc, \n" +
"                     u.email, u.phone_number, u.full_name, u.date_of_birth, u.image AS user_image \n" +
"                   FROM Rooms r \n" +
"                   JOIN Positions p ON r.position_id = p.position_id \n" +
"                   JOIN Users u ON r.user_id = u.user_id";

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
}
