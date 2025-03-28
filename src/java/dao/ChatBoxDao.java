package dao;

import java.util.ArrayList;
import model.ChatBox;
import java.util.ArrayList;
import model.Room;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.database;
import java.lang.reflect.Array;
import java.time.LocalDateTime;
import model.Customer;
import model.Position;

/**
 *
 * @author son
 */
public class ChatBoxDao {

    public ArrayList<ChatBox> getAllChatBox(String senderID, String receiverID) throws ClassNotFoundException {
        ArrayList<ChatBox> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT \n"
                    + "    m.message_id, m.sender_id, m.receiver_id, m.content, m.sent_time, sender.image\n"
                    + "FROM Message m \n"
                    + "JOIN Users sender ON m.sender_id = sender.user_id\n"
                    + "JOIN Users receiver ON m.receiver_id = receiver.user_id\n"
                    + "WHERE \n"
                    + "    (m.sender_id = ? AND m.receiver_id = ?) \n"
                    + "    OR \n"
                    + "    (m.sender_id = ? AND m.receiver_id = ?)\n"
                    + "ORDER BY m.sent_time ASC";
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, senderID);
            pr.setString(2, receiverID);
            pr.setString(3, receiverID);
            pr.setString(4, senderID);
            rs = pr.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String senderId = rs.getString(2);
                String receiverId = rs.getString(3);
                String content = rs.getString(4);
                String sentime = rs.getString(5);
                String image = rs.getString(6);
                ChatBox cb = new ChatBox(id, senderId, receiverId, content, sentime, image);
                list.add(cb);
            }
            return list;
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public void insertIntoChatBox(String send_id, String receiver_id, String content) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            String sql = "INSERT INTO Message (sender_id, receiver_id, content) VALUES (?,?,?)";
            pr = con.prepareStatement(sql);
            pr.setString(1, send_id);
            pr.setString(2, receiver_id);
            pr.setString(3, content);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<String> getReceiverID(String sender_id) {
        ArrayList<String> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT DISTINCT sender_id  FROM Message WHERE receiver_id = ?";
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, sender_id);
            rs = pr.executeQuery();
            while (rs.next()) {
                String receicerID = rs.getString(1);
                list.add(receicerID);
            }
                return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public ArrayList<ChatBox> getSender(String sender_id){
        ArrayList<ChatBox> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT DISTINCT sender_id,u.full_name, u.image   FROM Message as m , Users as u  WHERE u.user_id=m.sender_id and  receiver_id = ?";
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, sender_id);
            rs = pr.executeQuery();
            while (rs.next()) {
                String receicerID = rs.getString(1);
                String fullName= rs.getString(2);
                String image= rs.getString(3);
                ChatBox cb = new ChatBox(receicerID, image, fullName);
                list.add(cb);
            }
                return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
