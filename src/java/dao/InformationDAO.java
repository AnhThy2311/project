package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.database;
import java.util.Date;
import model.Information;

public class InformationDAO {

    public Information getInformation(int userId) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            String sql = "SELECT CCCD, issue_date, place_of_issue, permanent_address FROM Information WHERE user_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                String CCCD = rs.getString("CCCD");
                Date issueDate = rs.getDate("issue_date");
                String placeOfIssue = rs.getString("place_of_issue");
                String permanentAddress = rs.getString("permanent_address");
                return new Information(userId, CCCD, issueDate, placeOfIssue, permanentAddress);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateInformation(Information info) throws ClassNotFoundException {
        Connection con = null;
        PreparedStatement pr = null;
        try {
            con = database.getConnection();
            String sql = "UPDATE Information SET CCCD = ?, issue_date = ?, place_of_issue = ?, permanent_address = ? WHERE user_id = ?";
            pr = con.prepareStatement(sql);
            pr.setString(1, info.getCCCD());
            pr.setDate(2, new java.sql.Date(info.getIssueDate().getTime()));
            pr.setString(3, info.getPlaceOfIssue());
            pr.setString(4, info.getPermanentAddress());
            pr.setInt(5, info.getUserId());
            pr.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
