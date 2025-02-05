/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import connect.DBContext;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;

/**
 *
 * @author bebet
 */
public class UserDAO {

    private static final Logger LOGGER = Logger.getLogger(UserDAO.class.getName());

    public List<Customer> getUsers() {
        List<Customer> users = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = "";
        try (Connection con = db.openConnection(); PreparedStatement statement = con.prepareStatement(sql);) {
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                String email = rs.getString(1);
                String pass = rs.getString(2);
                String phone = rs.getString(3);
                String fullname = rs.getString(4);
                String bod = rs.getString(5);
                String image = rs.getString(6);
                users.add(new Customer(email, pass, phone, fullname, bod, image));

            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, null, ex);
        }
        return users;
    }

   public Customer checkAuth(String emailToCheck, String passwordToCheck) {

     DBContext db = DBContext.getInstance();
      ResultSet result = null;
       String sql = "";
      try (Connection con = db.openConnection(); PreparedStatement statement = con.prepareStatement(sql);) {

          statement.setString(1, emailToCheck);
          statement.setString(2, passwordToCheck);
          result = statement.executeQuery();
          if (result.next()) {
              return new Customer(result.getString(1),
                      result.getString(2));

          }
      } catch (ClassNotFoundException | SQLException ex) {
          LOGGER.log(Level.SEVERE, null, ex);
      }
       return null;
  }



    public void updateUser(String newPhone, String newFullname,
            String newDob) {
        String sql = "UPDATE Users SET phone_number=?, full_name=?, date_of_birth=?  WHERE email = ?";
        DBContext db = DBContext.getInstance();
        try (Connection con = db.openConnection(); PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setString(1, newPhone);
            statement.setString(2, newFullname);
            statement.setString(3, newDob);
 

            statement.executeUpdate();
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, null, ex);
        }

    }

    public void changePassword(String currentUser, String newPass) {
        String sql = "UPDATE Users SET password=? WHERE email = ?";
        DBContext db = DBContext.getInstance();
        try (Connection con = db.openConnection(); PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setString(1, newPass);
            statement.setString(2, currentUser);
            statement.executeUpdate();

        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, null, ex);
        }

    }

}
