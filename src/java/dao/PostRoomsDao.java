/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import database.database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Customer;
import model.PostRooms;

/**
 *
 * @author son
 */
public class PostRoomsDao {
    public ArrayList<PostRooms> getAllPostRooms(String email){
        ArrayList<PostRooms> list = new ArrayList<>();
         Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            // Get a connection from your connection utility
            con = database.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "select r.image,room_name,r.price, p.number_house, p.street, p.ward, p.district, p.city  from Rooms as r, Users as u , Positions as p where u.user_id= r.user_id and r.position_id= p.position_id and u.email=?" ;

            pr = con.prepareStatement(sql);
            pr.setString(1, email);

            re = pr.executeQuery();
            while (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
                String image = re.getString(1);
                String room_name = re.getString(2);
                float price = re.getFloat(3);
                String number_house=re.getString(4);
                String street = re.getString(5);
                String ward= re.getString(6);
                String district= re.getString(7);
                String city = re.getString(8);
                PostRooms prs= new PostRooms(image, room_name, price, number_house, street, ward, district, city);
                list.add(prs);
            }
            return list;
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null; // Return null if no customer is found or an error occurs
    }
}
