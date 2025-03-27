/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import database.database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Notification;

/**
 *
 * @author son
 */
public class NotificationDao {

    public void InsertIntoNotificationRentRoom(String recied_id) {
        String sql = "INSERT INTO Notification_User (user_id, notification_id)\n"
                + "VALUES (?, 1);";
        Connection con = null;
        PreparedStatement pr = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, recied_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void InsertIntoNotificationBooRoom(String recied_id) {
        String sql = "INSERT INTO Notification_User (user_id, notification_id)\n"
                + "VALUES (?, 4);";
        Connection con = null;
        PreparedStatement pr = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, recied_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void CancelBookingRoom(String recied_id) {
        String sql = "INSERT INTO Notification_User (user_id, notification_id)\n"
                + "VALUES (?, 5);";
        Connection con = null;
        PreparedStatement pr = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, recied_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void AcceptRentRoom(String recied_id) {
        String sql = "INSERT INTO Notification_User (user_id, notification_id)\n"
                + "VALUES (?, 2);";
        Connection con = null;
        PreparedStatement pr = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, recied_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

     public void ThongBaoChoThuePhong(String recied_id) {
        String sql = "INSERT INTO Notification_User (user_id, notification_id)\n"
                + "VALUES (?, 7);";
        Connection con = null;
        PreparedStatement pr = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, recied_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    
    
    
    
    
    public void cacelRentRoom(String recied_id) {
        String sql = "INSERT INTO Notification_User (user_id, notification_id)\n"
                + "VALUES (?, 3);";
        Connection con = null;
        PreparedStatement pr = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, recied_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<Notification> getListNo(String reviced_id) {
        ArrayList<Notification> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;

        try {
            con = database.getConnection(); // Giả sử bạn có lớp kết nối DatabaseConnection
            String sql = "SELECT ns.notification_id, n.title, ns.is_read "
                    + "FROM Users u, Notification n, Notification_User ns "
                    + "WHERE u.user_id = ns.user_id "
                    + "AND ns.notification_id = n.notification_id "
                    + "AND u.user_id = ? ORDER BY ns.created_at DESC";

            pr = con.prepareStatement(sql);
            pr.setString(1, reviced_id);  // Set giá trị user_id dựa trên reviced_id
            rs = pr.executeQuery();

            while (rs.next()) {
                Notification notification = new Notification();
                notification.notification_id = rs.getString("notification_id");
                notification.title = rs.getString("title");
                notification.is_read = rs.getInt("is_read");

                list.add(notification);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pr != null) {
                    pr.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                System.out.println("Error when closing resources: " + e.getMessage());
            }
        }

        return list;
    }

    public String getCountNoti(String reviced_id) {
        String sql = "Select count(is_read) from Notification_User as nt , Users as u  where u.user_id = nt.user_id  and u.user_id=? and nt.is_read = 0";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, reviced_id);
            rs = pr.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateStateNotification(String received_id) throws ClassNotFoundException {
        String sql = "UPDATE Notification_User "
                + "SET is_read = 1 "
                + "WHERE EXISTS ("
                + "    SELECT 1 "
                + "    FROM Users u "
                + "    WHERE u.user_id = Notification_User.user_id "
                + "    AND u.user_id = ?"
                + ");";

        Connection con = null;
        PreparedStatement pr = null;

        try {
            con = database.getConnection(); // Lấy kết nối từ database
            pr = con.prepareStatement(sql);

            // Set giá trị tham số trong câu lệnh SQL
            pr.setString(1, received_id);

            int rowsUpdated = pr.executeUpdate(); // Thực thi câu lệnh cập nhật

            System.out.println("Đã cập nhật " + rowsUpdated + " dòng dữ liệu.");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và PreparedStatement
            try {
                if (pr != null) {
                    pr.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
