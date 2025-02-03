package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import lib.lib;
import module.Customer;

public class CustomerDao {

    public void inserintoCustomer(Customer cter) {
//        String email,String hoten,String password
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = lib.getConnection();
            // Step 2: Create SQL statement
            String sql = "INSERT INTO Users (email, password, role_id, phone_number, full_name, date_of_birth,entity_state,image)  VALUES (?,?,?,?,?,?,?,?)";
            int trangthai = 0;
            int role = 2;
            
            st = con.prepareStatement(sql);
            st.setString(1, cter.getEmail());
            st.setString(2, cter.getPassword());
            st.setInt(3, role);
            st.setString(4, cter.getPhone());
            st.setString(5, cter.getFullName());
            st.setString(6, cter.getBirthDate());
            st.setInt(7, trangthai);
            st.setString(8, cter.getImage());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateTrangThai(String email) {
        Connection con = null;
        PreparedStatement st = null;
        try {
            con = lib.getConnection();
            // Step 2: Create SQL statement
            String sql = "UPDATE Users SET entity_state = 1 WHERE email = ?";
            st = con.prepareStatement(sql);
            st.setString(1, email);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Customer getCustomer(String email, String password) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            // Get a connection from your connection utility
            con = lib.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "SELECT  email, password, phone_number, full_name, date_of_birth,image FROM Users where email=? and password=?and entity_state=1";
            pr = con.prepareStatement(sql);
            pr.setString(1, email);
            pr.setString(2, password);

            re = pr.executeQuery();
            if (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
                String email1 = re.getString(1);
                String password1 = re.getString(2);
                String phone = re.getString(3);
                String fullName = re.getString(4);
                String date = re.getString(5);
                String image = re.getString(6);
                return new Customer(email1, password1,phone, fullName, date,image);
            }
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null; // Return null if no customer is found or an error occurs
    }
    
    // check email đã tồn tại 
    public Customer exitEmail(String email){
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            // Get a connection from your connection utility
            con = lib.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "SELECT  email, password, phone_number, full_name, date_of_birth,image FROM Users where email=?";
            pr = con.prepareStatement(sql);
            pr.setString(1, email);
           

            re = pr.executeQuery();
            if (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
                String email1 = re.getString(1);
                String password1 = re.getString(2);
                String phone = re.getString(3);
                String fullName = re.getString(4);
                String date = re.getString(5);
                String image = re.getString(6);
                return new Customer(email1, password1,phone, fullName, date,image);
            }
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null; 
    }
}
