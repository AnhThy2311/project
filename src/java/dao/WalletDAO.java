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
import model.Customer;
import model.Wallet;
import model.Withdrawals;

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
                System.out.println(" Connection is null!");
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

    public Wallet getWallet(String userid) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            String sql = "select u.user_id, u.full_name, u.email, w.balance from Wallet as w, Users as u where w.user_id= u.user_id and u.user_id=?";
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, userid);
            re = pr.executeQuery();
            if (re.next()) {
                String id = re.getString("user_id");
                String fullName = re.getString("full_name");
                String email = re.getString("email");
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
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public float getPrice(String user_id) {
        String sql = "select w.balance from Users as u , Wallet as w where u.user_id= w.user_id and u.user_id =?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, user_id);
            re = pr.executeQuery();
            if (re.next()) {
                return re.getFloat(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    public void updatePrice(float price, String userID) {
        String sql = "update Wallet set balance=? where user_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setFloat(1, price);
            pr.setString(2, userID);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void insertintoRuttien(String user_id, String account_number, float amount, String bank_name, String recipient_name) {
        String sql = "INSERT INTO Withdrawals (user_id, account_number, amount, bank_name, recipient_name) "
                + "VALUES (?, ?, ?, ?, ?)";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, user_id);
            pr.setString(2, account_number);
            pr.setFloat(3, amount);
            pr.setString(4, bank_name);
            pr.setString(5, recipient_name);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<Withdrawals> getGiaoDich(String user_id) {
        String sql = "SELECT * FROM Withdrawals where user_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        ArrayList<Withdrawals> list = new ArrayList<>();
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, user_id);
            re = pr.executeQuery();
            while (re.next()) {
                String user_id1 = re.getString(2);
                String account_number = re.getString(3);
                String transaction_dat = re.getString(4);
                Float price = re.getFloat(5);
                String bank_name = re.getString(6);
                String recip_name = re.getString(7);
                int status = re.getInt(8);
                Withdrawals w = new Withdrawals(user_id1, account_number, transaction_dat, price, bank_name, recip_name, status);
                list.add(w);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void AcceptRutTien(String user_id) {
        String sql = "	update Withdrawals set status =1 where user_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, user_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public ArrayList<Withdrawals> getAllGiaoDich() {
        String sql = "SELECT * FROM Withdrawals where status = 0";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        ArrayList<Withdrawals> list = new ArrayList<>();
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            re = pr.executeQuery();
            while (re.next()) {
                String user_id1 = re.getString(2);
                String account_number = re.getString(3);
                String transaction_dat = re.getString(4);
                Float price = re.getFloat(5);
                String bank_name = re.getString(6);
                String recip_name = re.getString(7);
                int status = re.getInt(8);
                Withdrawals w = new Withdrawals(user_id1, account_number, transaction_dat, price, bank_name, recip_name, status);
                list.add(w);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
