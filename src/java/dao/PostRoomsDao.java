package dao;

import database.database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Customer;
import model.PostRooms;
import org.apache.el.util.ConcurrentCache;

public class PostRoomsDao {

    public ArrayList<PostRooms> getAllPostRooms(String email) {
        ArrayList<PostRooms> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            // Get a connection from your connection utility
            con = database.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "select r.image,room_name,r.price, p.number_house, p.street, p.ward, p.district, p.city , r.position_id from Rooms as r, Users as u , Positions as p where u.user_id= r.user_id and r.position_id= p.position_id and u.email=? and r.status=1";

            pr = con.prepareStatement(sql);
            pr.setString(1, email);

            re = pr.executeQuery();
            while (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
                String image = re.getString(1);
                String room_name = re.getString(2);
                float price = re.getFloat(3);
                String number_house = re.getString(4);
                String street = re.getString(5);
                String ward = re.getString(6);
                String district = re.getString(7);
                String city = re.getString(8);
                String id = re.getString(9);
                PostRooms prs = new PostRooms(image, room_name, price, number_house, street, ward, district, city, id);
                list.add(prs);
            }
            return list;
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null; // Return null if no customer is found or an error occurs
    }

    public ArrayList<PostRooms> getPendingApproval(String email) {
        ArrayList<PostRooms> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            // Get a connection from your connection utility
            con = database.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "select r.image,room_name,r.price, p.number_house, p.street, p.ward, p.district, p.city , r.position_id, r.status  from Rooms as r, Users as u , Positions as p where u.user_id= r.user_id and r.position_id= p.position_id and u.email=? and (r.status=2 or r.status=0)";

            pr = con.prepareStatement(sql);
            pr.setString(1, email);

            re = pr.executeQuery();
            while (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
                String image = re.getString(1);
                String room_name = re.getString(2);
                float price = re.getFloat(3);
                String number_house = re.getString(4);
                String street = re.getString(5);
                String ward = re.getString(6);
                String district = re.getString(7);
                String city = re.getString(8);
                String id = re.getString(9);
                String status = re.getString(10);
                PostRooms prs = new PostRooms(id, image, room_name, price, number_house, street, ward, district, city, status);
                list.add(prs);
            }
            return list;
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null; // Return null if no customer is found or an error occurs
    }

    public int getCountRoom() {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            con = database.getConnection();
            // SQL query to fetch customer details based on username and password
            String sql = "SELECT TOP 1 position_id FROM Positions ORDER BY position_id DESC;";
            pr = con.prepareStatement(sql);
            re = pr.executeQuery();
            if (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
                int state = re.getInt(1);
                return state;
            }
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return 0; // Return null if no customer is found or an error occurs
    }

    public void insertPosition(String number_hourse, String street, String ward, String district, String city, String description) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            con = database.getConnection();
            String sql = "INSERT INTO Positions VALUES  (?,?,?,?,?,?)";
            pr = con.prepareStatement(sql);
            pr.setString(1, number_hourse);
            pr.setString(2, street);
            pr.setString(3, ward);
            pr.setString(4, district);
            pr.setString(5, city);
            pr.setString(6, description);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
    }

    public void insertRooms(String room_name, String description, float price, int position_id, int user_id, String image, float electricity_fee, float water_fee, float area) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        int status = 2;
        int requestion_id = 1;
        try {
            con = database.getConnection();
            String sql = "INSERT INTO Rooms VALUES (?,?, ?, ?, ?, ?, ?,?,?,?,?)";
            pr = con.prepareStatement(sql);
            pr.setString(1, room_name);
            pr.setString(2, description);
            pr.setFloat(3, price);
            pr.setInt(4, status);
            pr.setInt(5, position_id);
            pr.setInt(6, user_id);
            pr.setInt(7, requestion_id);
            pr.setString(8, image);
            pr.setFloat(9, electricity_fee);
            pr.setFloat(10, water_fee);
            pr.setFloat(11, area);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
    }

    public void deleteRoom(String id) {
        Connection con = null;
        PreparedStatement pr = null;
        String sql = "update Rooms set status =0 where position_id=?";
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            // khi thực hiện câu lệnh sql mà không tạo ra bangr thì phải sử dụng update

            // phải truyền dữ liệu vào 
            pr.setString(1, id);
            pr.executeUpdate();
            // sau khi kết nối xong thì đóng dữ liệu 

        } catch (Exception e) {
            // thực hiện câu lệnh ném ra lỗi
            e.printStackTrace();
        }
    }

    public void deleteWishList(String room_id) {
        Connection con = null;
        PreparedStatement pr = null;
        String sql = "DELETE wishlist_room WHERE room_id=?";
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            // khi thực hiện câu lệnh sql mà không tạo ra bangr thì phải sử dụng update

            // phải truyền dữ liệu vào 
            pr.setString(1, room_id);
            pr.executeUpdate();
            // sau khi kết nối xong thì đóng dữ liệu 

        } catch (Exception e) {
            // thực hiện câu lệnh ném ra lỗi
            e.printStackTrace();
        }
    }

    public void deletePosition(String id) {
        Connection con = null;
        PreparedStatement pr = null;
        String sql = "DELETE FROM Positions WHERE position_id=?";
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            // khi thực hiện câu lệnh sql mà không tạo ra bangr thì phải sử dụng update

            // phải truyền dữ liệu vào 
            pr.setString(1, id);
            pr.executeUpdate();
            // sau khi kết nối xong thì đóng dữ liệu 

        } catch (Exception e) {
            // thực hiện câu lệnh ném ra lỗi
            e.printStackTrace();
        }
    }

    public String getByRoomIdByPositionID(String positionId) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            con = database.getConnection();
            // SQL query to fetch customer details based on username and password
            String sql = "select room_id from Rooms where position_id=?";
            pr = con.prepareStatement(sql);
            pr.setString(1, positionId);
            re = pr.executeQuery();
            if (re.next()) {
                return re.getString(1);
            }
        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null;
    }

    public PostRooms getPostRoomByid(String id, String email) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet re = null;
        try {
            // Get a connection from your connection utility
            con = database.getConnection();

            // SQL query to fetch customer details based on username and password
            String sql = "select r.image,room_name,r.price, p.number_house, p.street, p.ward, p.district, p.city , r.position_id from Rooms as r, Users as u , Positions as p where u.user_id= r.user_id and r.position_id= p.position_id and u.email=? and r.position_id=?";

            pr = con.prepareStatement(sql);
            pr.setString(1, email);
            pr.setString(2, id);

            re = pr.executeQuery();
            while (re.next()) {
                // Retrieve values by their index in the table (ensure these match the table schema)
                String image = re.getString(1);
                String room_name = re.getString(2);
                float price = re.getFloat(3);
                String number_house = re.getString(4);
                String street = re.getString(5);
                String ward = re.getString(6);
                String district = re.getString(7);
                String city = re.getString(8);
                String id1 = re.getString(9);
                PostRooms prs = new PostRooms(image, room_name, price, number_house, street, ward, district, city, id1);
                return prs;
            }

        } catch (Exception e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
        return null; // Return null if no customer is found or an error occurs
    }

    public void updatePostRoom(String room_name, float price, String image, String id) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE Rooms SET room_name =?, price=? , image=?  WHERE position_id =?";
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, room_name);
            pr.setFloat(2, price);
            pr.setString(3, image);
            pr.setString(4, id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public String getImageRoom(String id_room) {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String sql = "select image from Rooms where position_id =?";
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, id_room);
            rs = pr.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertIntoImage(String image_url, String roomid) {
        String sql = "INSERT INTO Images (image_url, room_id) VALUES (?, ?)";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, image_url);
            pr.setString(2, roomid);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
