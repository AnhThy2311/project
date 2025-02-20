/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author HP
 */
import model.Landlord;
import database.database;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LandlordDAO {
    public List<Landlord> getAllLandlords() throws ClassNotFoundException {
        List<Landlord> landlords = new ArrayList<>();
        String query = "SELECT * FROM Landlords";

        try (Connection conn = database.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                landlords.add(new Landlord(
                    rs.getInt("landlordId"),
                    rs.getString("fullName"),
                    rs.getString("phoneNumber"),
                    rs.getString("email"),
                    rs.getString("address")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return landlords;
    }
}