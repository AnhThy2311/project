package dao;

import database.database;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ContractDao {

    public void insertIntoContract(String booking_id, String customerId, String OwnerID,float room_price,  float admin_fee ) {
        String sql = "INSERT INTO Contract (booking_id, tenant_id, landlord_id, status,room_price,admin_fee)\n"
                + "VALUES (?,?,?,?,?,?)";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        int status=0;
        try{
            con=database.getConnection();
            pr=con.prepareStatement(sql);
            pr.setString(1, booking_id);
            pr.setString(2, customerId);
            pr.setString(3, OwnerID);
            pr.setInt(4, status);
            pr.setFloat(5,room_price);
            pr.setFloat(6, admin_fee);
            pr.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
    public void updateContract(String booking_id){
        String sql="update Contract set status = 1 where booking_id=?";
         Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try{
            con=database.getConnection();
            pr=con.prepareStatement(sql);
            pr.setString(1, booking_id);
            pr.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
