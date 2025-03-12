package dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.database;
import model.Account_upgrade;
import model.AdminPending;
import model.BookingRoom;
import model.Contract;
import model.Customer;
import model.Room;

public class AdminDao {

    public ArrayList<Customer> getAllUser() {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        ArrayList<Customer> list = new ArrayList<>();
        try {
            con = database.getConnection();
            String sql = "select u.email, u.phone_number,u.full_name, u.date_of_birth, u.image, u.entity_state from Users as u ";
            pr = con.prepareStatement(sql);
            rs = pr.executeQuery();
            while (rs.next()) {
                String email = rs.getString(1);
                String phonenumber = rs.getString(2);
                String fullname = rs.getString(3);
                String date_birth = rs.getString(4);
                String image = rs.getString(5);
                int state = rs.getInt(6);
                Customer a = new Customer(email, phonenumber, fullname, date_birth, image, state);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    // block một user
    public void BlokUser(String email) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            String sql = "UPDATE Users SET entity_state = 0 WHERE email = ?";
            pr = con.prepareStatement(sql);
            pr.setString(1, email);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void unLockUser(String email) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            String sql = "UPDATE Users SET entity_state = 1 WHERE email = ?";
            pr = con.prepareStatement(sql);
            pr.setString(1, email);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<AdminPending> getAdminGetPendingapp() {
        ArrayList<AdminPending> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            // Get a connection from your connection utility
            con = database.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "select u.email,u.full_name, r.image,room_name,r.price, p.number_house, p.street, p.ward, p.district, p.city , r.position_id, r.status  from Rooms as r, Users as u , Positions as p where u.user_id= r.user_id and r.position_id= p.position_id  and r.status=2";
            pr = con.prepareStatement(sql);
            re = pr.executeQuery();
            while (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
                String email = re.getString(1);
                String fullName = re.getString(2);
                String image = re.getString(3);
                String room_name = re.getString(4);
                float price = re.getFloat(5);
                String number_house = re.getString(6);
                String street = re.getString(7);
                String ward = re.getString(8);
                String district = re.getString(9);
                String city = re.getString(10);
                String id = re.getString(11);
                String status = re.getString(12);
                AdminPending adg = new AdminPending(email, fullName, image, room_name, price, number_house, street, ward, district, city, id, status);
                list.add(adg);
            }
            return list;
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null; // Return null if no customer is found or an error occurs
    }

    // duyêtj bài post của owner
    public void accpectPost(String positionId) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            String sql = "update Rooms set status=1 where position_id=?";
            pr = con.prepareStatement(sql);
            pr.setString(1, positionId);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void CancelPost(String positionId) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            String sql = "update Rooms set status=0 where position_id=?";
            pr = con.prepareStatement(sql);
            pr.setString(1, positionId);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<Customer> getAccount_upgrade() {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String sql = "select a.user_id,u.email , u.full_name, a.created_at, a.price from account_upgrade as a , Users as u where a.user_id = u.user_id";
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            rs = pr.executeQuery();
            ArrayList<Customer> list = new ArrayList<>();
            while (rs.next()) {
                Customer c = new Customer();
                Account_upgrade acc = new Account_upgrade();
                acc.setUser_id(rs.getString(1));
                c.setEmail(rs.getString(2));
                c.setFullName(rs.getString(3));
                acc.setCreate_date(rs.getString(4));
                acc.setPrice(rs.getFloat(5));
                c.setAccount_upgrade(acc);
                list.add(c);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<BookingRoom> getmanager_financial() {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String sql = "select u.email , u.full_name, r.room_name ,b.start_date,b.months,b.end_date, c.room_price, c.admin_fee from Contract as c , Users as u , Booking as b , Rooms as r \n"
                    + "where c.status=1 and c.tenant_id =u.user_id and c.booking_id=b.booking_id and r.room_id =b.room_id";
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            rs = pr.executeQuery();
            ArrayList<BookingRoom> list = new ArrayList<>();
            while (rs.next()) {
                BookingRoom b = new BookingRoom();
                Contract c = new Contract();
                Customer customer = new Customer();
                Room r = new Room();
                customer.setEmail(rs.getString(1));
                customer.setFullName(rs.getString(2));
                r.setRoomName(rs.getString(3));
                b.setDate(rs.getString(4));
                b.setMonth(rs.getString(5));
                b.setEnd_date(rs.getString(6));
                c.setRoom_price(rs.getFloat(7));
                c.setAdmin_price(rs.getFloat(8));
                b.setCustomer(customer);
                b.setC(c);
                b.setRoom(r);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
