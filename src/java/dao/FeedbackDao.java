/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author son
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.database;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Feedback;
import model.Room;

public class FeedbackDao {

    public boolean checkUserBooking(int userId, int roomId) {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        boolean hasBooked = false;

        try {
            con = database.getConnection();
            String sql = "SELECT COUNT(*) as count FROM Booking WHERE user_id = ? AND room_id = ?";
            st = con.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, roomId);

            rs = st.executeQuery();
            if (rs.next()) {
                hasBooked = rs.getInt("count") > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    database.getClose(con);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return hasBooked;
    }

    public boolean checkUserEmailBooking(String userEmail, int bookingId) {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        boolean isUserBooking = false;

        try {
            con = database.getConnection();
            String sql = "SELECT COUNT(*) as count FROM Booking b "
                    + "JOIN Users u ON b.user_id = u.user_id "
                    + "WHERE u.email = ? AND b.room_id = ? and b.status=1";

            st = con.prepareStatement(sql);
            st.setString(1, userEmail);
            st.setInt(2, bookingId);

            rs = st.executeQuery();
            if (rs.next()) {
                isUserBooking = rs.getInt("count") > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    database.getClose(con);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isUserBooking;
    }

    public List<Feedback> getAllFeedback(int roomId) {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        List<Feedback> feedbackList = new ArrayList<>();

        try {
            con = database.getConnection();
            String sql = "SELECT f.*, "
                    + "u.email, u.phone_number, u.full_name, u.date_of_birth, u.image as user_image, u.entity_state, "
                    + "r.room_name, r.description, r.price, r.status, r.image as room_image "
                    + "FROM Feedback f "
                    + "JOIN Users u ON f.user_id = u.user_id "
                    + "JOIN Rooms r ON f.room_id = r.room_id "
                    + "WHERE f.room_id = ? "
                    + "ORDER BY f.creation_date DESC";

            st = con.prepareStatement(sql);
            st.setInt(1, roomId);
            rs = st.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedback_id"));
                feedback.setContent(rs.getString("content"));
                feedback.setRating(rs.getByte("rating"));
                feedback.setCreationDate(rs.getTimestamp("creation_date").toLocalDateTime());

                // Create and set Customer object
                Customer customer = new Customer();
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone_number"));
                customer.setFullName(rs.getString("full_name"));
                customer.setBirthDate(rs.getString("date_of_birth"));
                customer.setImage(rs.getString("user_image"));
                customer.setState(rs.getInt("entity_state"));
                feedback.setCustomer(customer);

                // Create and set Room object
                Room room = new Room();
                room.setRoomId(String.valueOf(roomId));
                room.setRoomName(rs.getString("room_name"));
                room.setDescription(rs.getString("description"));
                room.setPrice(rs.getDouble("price"));
                room.setState(String.valueOf(rs.getByte("status")));
                room.setImage(rs.getString("room_image"));
                feedback.setRoom(room);

                feedbackList.add(feedback);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    database.getClose(con);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return feedbackList;
    }

    public boolean addFeedback(String userEmail, int roomId, String content) {
        Connection con = null;
        PreparedStatement st = null;
        boolean isAdded = false;

        try {
            con = database.getConnection();

            // Get user_id based on email
            String getUserIdSQL = "SELECT user_id FROM Users WHERE email = ?";
            st = con.prepareStatement(getUserIdSQL);
            st.setString(1, userEmail);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("user_id");

                // Insert feedback into the database
                String insertSQL = "INSERT INTO Feedback (user_id, room_id, content) VALUES (?,?,?)";
                st = con.prepareStatement(insertSQL);
                st.setInt(1, userId);
                st.setInt(2, roomId);
                st.setString(3, content);

                isAdded = st.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    database.getClose(con);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isAdded;
    }

    public boolean deleteFeedback(int feedbackId) {
        Connection con = null;
        PreparedStatement st = null;
        boolean isDeleted = false;

        try {
            con = database.getConnection();
            String deleteSQL = "DELETE FROM Feedback WHERE feedback_id = ?";
            st = con.prepareStatement(deleteSQL);
            st.setInt(1, feedbackId);

            isDeleted = st.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    database.getClose(con);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isDeleted;
    }

    public boolean addFeedback(String userEmail, int roomId, String content, int rating) {
        Connection con = null;
        PreparedStatement st = null;
        boolean isAdded = false;

        try {
            con = database.getConnection();

            // Get user_id based on email
            String getUserIdSQL = "SELECT user_id FROM Users WHERE email = ?";
            st = con.prepareStatement(getUserIdSQL);
            st.setString(1, userEmail);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("user_id");

                // Insert feedback into the database
                String insertSQL = "INSERT INTO Feedback (user_id, room_id, content, rating, creation_date) VALUES (?, ?, ?, ?, GETDATE())";
                st = con.prepareStatement(insertSQL);
                st.setInt(1, userId);
                st.setInt(2, roomId);
                st.setString(3, content);
                st.setInt(4, rating);

                isAdded = st.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    database.getClose(con);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isAdded;
    }
      public void deleteFeedback1(String feedbackId) {
        Connection con = null;
        PreparedStatement st = null;
        boolean isDeleted = false;

        try {
            con = database.getConnection();
            String deleteSQL = "DELETE FROM Feedback WHERE feedback_id = ?";
            st = con.prepareStatement(deleteSQL);
            st.setString(1, feedbackId);

            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (st != null) st.close();
                if (con != null) database.getClose(con);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
