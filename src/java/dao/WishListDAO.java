/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import database.database;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Customer;
import model.Position;
import model.Room;
import model.Wishlist;

/**
 *
 * @author son
 */
public class WishListDAO {

    public ArrayList<Wishlist> getWishlist(String customerId) {
        ArrayList<Wishlist> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        String sql = "				   SELECT  r.room_id,r.room_name, r.description, r.price, r.image, \n"
                + "                     p.number_house,p.street,p.ward, p.district,p.city ,p.description AS position_desc, \n"
                + "                    u.email, u.phone_number, u.full_name, u.date_of_birth, u.image AS user_image \n"
                + "					from Rooms as r , Users as u , Positions as p , wishlist_room as w \n"
                + "					where u.user_id= w.user_id and w.room_id= r.room_id and r.position_id=  p.position_id and u.user_id=?";
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);

            pr.setString(1, customerId);
            rs = pr.executeQuery();

            while (rs.next()) {

                // Tạo đối tượng Room
                Room room = new Room();
                room.setRoomId(rs.getString("room_id"));
                room.setRoomName(rs.getString("room_name"));
                room.setDescription(rs.getString("description"));
                room.setPrice(rs.getDouble("price"));
                room.setImage(rs.getString("image"));

//                     Tạo đối tượng Position
                Position position = new Position(
                        rs.getString("number_house"),
                        rs.getString("street"),
                        rs.getString("ward"),
                        rs.getString("district"),
                        rs.getString("city"),
                        rs.getString("description")
                );

                room.setPosition(position);

                // Tạo đối tượng Customer
                Customer customer = new Customer();
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone_number"));
                customer.setFullName(rs.getString("full_name"));
                customer.setBirthDate(rs.getString("date_of_birth"));
                customer.setImage(rs.getString("user_image"));
                room.setCustomer(customer);

                Wishlist item = new Wishlist(room, customer);
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
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
    // insert into 

    public void addToWishlist(String customerId, String roomId) {
        String sql = "INSERT INTO wishlist_room (user_id, room_id) VALUES (?, ?)";

        try (Connection con = database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, customerId);
            ps.setString(2, roomId);
            ps.executeUpdate(); // Trả về true nếu thêm thành công
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deteleWishlistById(String customerId, String roomId) {
        String sql = "DELETE FROM wishlist_room where user_id = ? and room_id = ?";
        try (Connection con = database.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, customerId);
            ps.setString(2, roomId);
            ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
