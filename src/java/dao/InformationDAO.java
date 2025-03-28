package dao;

import model.Information;
import database.database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author son
 */
public class InformationDAO {

    public Information getInformation(int userId) throws ClassNotFoundException, SQLException {
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
        String sql1 = "SELECT COUNT(*) AS total FROM Information WHERE user_id = ?";
        String sqlUpdate = "UPDATE Information SET CCCD = ?, issue_date = ?, place_of_issue = ?, permanent_address = ? WHERE user_id = ?";
        String sqlInsert = "INSERT INTO Information (user_id, CCCD, issue_date, place_of_issue, permanent_address) VALUES (?, ?, ?, ?, ?)";

        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            // Bước 1: Kiểm tra COUNT
            pr = con.prepareStatement(sql1);
            pr.setInt(1, info.getUserId());
            rs = pr.executeQuery();
            int count = 0;
            if (rs.next()) {
                count = rs.getInt("total");
            }
            if (count > 0) {
                // Nếu user_id đã tồn tại -> Cập nhật
                pr = con.prepareStatement(sqlUpdate);
                pr.setString(1, info.getCCCD());
                pr.setDate(2, new java.sql.Date(info.getIssueDate().getTime()));
                pr.setString(3, info.getPlaceOfIssue());
                pr.setString(4, info.getPermanentAddress());
                pr.setInt(5, info.getUserId());
                pr.executeUpdate();
                System.out.println("Update thành công!");
            } else {
                // Nếu user_id chưa tồn tại -> Thêm mới
                pr = con.prepareStatement(sqlInsert);
                pr.setInt(1, info.getUserId());
                pr.setString(2, info.getCCCD());
                pr.setDate(3, new java.sql.Date(info.getIssueDate().getTime()));
                pr.setString(4, info.getPlaceOfIssue());
                pr.setString(5, info.getPermanentAddress());
                pr.executeUpdate();
                System.out.println("Insert thành công!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pr != null) {
                    pr.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
