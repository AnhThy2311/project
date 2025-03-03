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
import model.Customer;
import model.Wallet;

/**
 *
 * @author admin
 */
public class WalletDAO {

    public boolean updateBalance(int userId, double amount) {
        String checkSql = "SELECT COUNT(*) FROM Wallet WHERE user_id = ?";
        String insertSql = "INSERT INTO Wallet (user_id, balance) VALUES (?, ?)";
        String updateSql = "UPDATE Wallet SET balance = balance + ? WHERE user_id = ?";

        try (Connection conn = database.getConnection()) {
            if (conn == null) {
                System.out.println("❌ Connection is null!");
                return false;
            }

            // Kiểm tra xem user đã có ví chưa
            try (PreparedStatement checkPs = conn.prepareStatement(checkSql)) {
                checkPs.setInt(1, userId);
                ResultSet rs = checkPs.executeQuery();
                if (rs.next() && rs.getInt(1) == 0) {
                    // Nếu chưa có ví, tạo mới
                    try (PreparedStatement insertPs = conn.prepareStatement(insertSql)) {
                        insertPs.setInt(1, userId);
                        insertPs.setDouble(2, amount);
                        return insertPs.executeUpdate() > 0; // Trả về true nếu thêm thành công
                    }
                } else {
                    // Nếu đã có ví, cập nhật số dư
                    try (PreparedStatement updatePs = conn.prepareStatement(updateSql)) {
                        updatePs.setDouble(1, amount);
                        updatePs.setInt(2, userId);
                        return updatePs.executeUpdate() > 0; // Trả về true nếu cập nhật thành công
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public Wallet getWallet(String userid){
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re= null;
        try{
            String sql = "select u.user_id, u.full_name, u.email, w.balance from Wallet as w, Users as u where w.user_id= u.user_id and u.user_id=?";
            con=database.getConnection();
            pr=con.prepareStatement(sql);
            pr.setString(1, userid);
            re=pr.executeQuery();
            if(re.next()){
                String id = re.getString("user_id");
                String fullName = re.getString("full_name");
                String email= re.getString("email");
                float balance = re.getFloat("balance");
                
                Wallet w = new Wallet();
                w.setUserID(id);
                w.setPrice(balance);
                
                Customer c = new Customer();
                c.setEmail(email);
                c.setFullName(fullName);
                w.setCustomer(c);
                
                return w;
                
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    
    public float getPrice(String user_id){
        String sql= "select w.balance from Users as u , Wallet as w where u.user_id= w.user_id and u.user_id =?";
         Connection con = null;
        PreparedStatement pr = null;
        ResultSet re= null;
        try{
            con=database.getConnection();
            pr=con.prepareStatement(sql);
            pr.setString(1, user_id);
            re=pr.executeQuery();
            if(re.next()){
                return re.getFloat(1);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return -1;
    }
    public void updatePrice(float price,String userID){
        String sql = "	update Wallet set balance=? where user_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re= null;
        try{
            con=database.getConnection();
            pr=con.prepareStatement(sql);
            pr.setFloat(1, price);
            pr.setString(2, userID);
            pr.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
