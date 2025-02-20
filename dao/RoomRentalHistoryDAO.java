/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author HP
 */
import model.RoomRentalHistory;
import database.database;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomRentalHistoryDAO {
    public List<RoomRentalHistory> getHistoryByRoomId(int roomId) throws ClassNotFoundException {
        List<RoomRentalHistory> historyList = new ArrayList<>();
        String query = "SELECT * FROM RoomRentalHistory WHERE roomId = ?";

        try (Connection conn = database.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, roomId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                historyList.add(new RoomRentalHistory(
                    rs.getInt("historyId"),
                    rs.getInt("roomId"),
                    rs.getInt("tenantId"),
                    rs.getDate("startDate"),
                    rs.getDate("endDate")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return historyList;
    }
}
