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
import model.Feedback;
import model.ReportFeedback;
import model.Room;

/**
 *
 * @author son
 */
public class ReportFeedbackDAo {

    public ArrayList<ReportFeedback> getAllReportComment() {
        ArrayList<ReportFeedback> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            // Get a connection from your connection utility
            con = database.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "	  select f.feedback_id,u.email,u.full_name, r.room_name, f.content from Feedback as f, users as u  , Requests as rq ,Rooms as r where f.user_id=u.user_id and f.room_id=r.room_id\n"
                    + "				  and f.request_id=rq.request_id and f.request_id=2";

            pr = con.prepareStatement(sql);
           

            re = pr.executeQuery();
            while (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
               String id = re.getString(1);
               String email=re.getString(2);
               String fullName=re.getString(3);
               String roomName=re.getString(4);
               String content= re.getString(5);
                ReportFeedback rpb= new ReportFeedback(id, email, fullName, roomName, content);
                list.add(rpb);
            }
            return list;
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null; // Return null if no customer is found or an error occurs
    }
    public void updateReportComment(String feedbackId){
         ArrayList<ReportFeedback> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try{
            String sql=" update Feedback set request_id=2 where feedback_id =?";
            con=database.getConnection();
            pr=con.prepareStatement(sql);
            pr.setString(1, feedbackId);
            pr.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
     public void cancelReportComment(String feedbackId){
         ArrayList<ReportFeedback> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try{
            String sql=" update Feedback set request_id=null where feedback_id =?";
            con=database.getConnection();
            pr=con.prepareStatement(sql);
            pr.setString(1, feedbackId);
            pr.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
     
      public void updateReportRoom(String roomId){
         ArrayList<ReportFeedback> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try{
            String sql=" update Rooms set request_id=3 where room_id =?";
            con=database.getConnection();
            pr=con.prepareStatement(sql);
            pr.setString(1, roomId);
            pr.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
      public ArrayList<Room> getReportRoom (){
          ArrayList<Room> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try{
            String sql = "select r.image, r.room_name, u.email, u.full_name, u.phone_number from Rooms as r , Users as u where u.user_id=r.user_id and r.request_id=3";
            con=database.getConnection();
            pr=con.prepareStatement(sql);
            re=pr.executeQuery();
            while(re.next()){
                Customer c = new Customer();
                c.setEmail(re.getString("email"));
                c.setFullName(re.getString("full_name"));
                c.setPhone(re.getString("phone_number"));
                
                Room r =  new Room();
                r.setCustomer(c);
                r.setImage(re.getString("image"));
                r.setRoomName(re.getString("room_name"));
                list.add(r);
            }
            return list;
            
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
      }
}
