package dao;

import database.database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.BookingRoom;
import model.Contract;
import model.Customer;
import model.Information;
import model.Position;
import model.Room;

public class BookingRoomDao {

    public void InsertIntoBookingRoom(String user_id, String room_id, String date, String month) {
        String sql = "INSERT INTO Booking (user_id, room_id, start_date, months, status)\n"
                + "VALUES (?,?,?,?,?)";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        int status = 0;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, user_id);
            pr.setString(2, room_id);
            pr.setString(3, date);
            pr.setString(4, month);
            pr.setInt(5, status);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Room getRoomById(String roomId) {
        String sql = "select r.image, u.full_name, r.price  from Rooms as r , Users as u where u.user_id = r.user_id and r.room_id =?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, roomId);
            rs = pr.executeQuery();
            if (rs.next()) {
                Room r = new Room();
                r.setImage(rs.getString("image"));
                r.setPrice(Float.parseFloat(rs.getString("price")));

                Customer c = new Customer();
                c.setFullName(rs.getString("full_name"));
                r.setCustomer(c);
                return r;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public String getBookingId(String roomID) {
        String sql = "select  MAX(booking_id) from Booking where room_id = ?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, roomID);
            rs = pr.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<BookingRoom> getPendingBooking(String ownerId) {
        ArrayList<BookingRoom> list = new ArrayList<>();
        String sql = "select u.email,u.full_name, b.room_id,r.room_name,b.start_date,b.end_date,b.status,c.room_price from Booking as b , Users as u , Rooms as r,Contract as c where b.user_id = u.user_id and b.room_id =r.room_id and c.booking_id=b.booking_id and (b.status=0 or b.status=2) and r.user_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, ownerId);
            rs = pr.executeQuery();
            while (rs.next()) {
                BookingRoom br = new BookingRoom();
                Customer c = new Customer();
                c.setEmail(rs.getString(1));
                c.setFullName(rs.getString(2));

                br.setRoom_id(rs.getString(3));
                br.setRoomName(rs.getString(4));
                br.setDate(rs.getString(5));
                br.setEnd_date(rs.getString(6));
                br.setStatus(rs.getString(7));
                br.setTotalPrice(rs.getFloat(8));
                br.setCustomer(c);
                list.add(br);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateBooking(String roomID, String customer_id, String booking_id) {
        String sql = "update Booking set status=1 where room_id=? and user_id = ? and booking_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, roomID);
            pr.setString(2, customer_id);
            pr.setString(3, booking_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
// khi đồng ý hủy tất cả còn lại 
//     public void huyTatCaConLai(String roomID ,String customer_id) {
//        String sql = "UPDATE Booking SET status = 2 WHERE room_id = ?  AND user_id <> ?";
//        Connection con = null;
//        PreparedStatement pr = null;
//        ResultSet rs = null;
//        try {
//            con = database.getConnection();
//            pr = con.prepareStatement(sql);
//            pr.setString(1, roomID);
//            pr.setString(2, customer_id);
//            pr.executeUpdate();
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//    }

    public void cancelBooking(String roomID, String customer_id) {
        String sql = "update Booking set status=2 where room_id=? and user_id = ?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, roomID);
            pr.setString(2, customer_id);

            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<BookingRoom> getNameRoombyEmail(String email) {
        ArrayList<BookingRoom> listName = new ArrayList<>();
        String sql = "SELECT r.room_name, r.room_id, b.booking_id, b.start_date , b.months, b.end_date, b.status, r.price\n"
                + "FROM Contract AS c\n"
                + "JOIN Booking AS b ON c.booking_id = b.booking_id\n"
                + "JOIN Rooms AS r ON b.room_id = r.room_id\n"
                + "JOIN Users AS u ON u.user_id = b.user_id \n"
                + "WHERE u.email = ?\n"
                + "AND (b.status = 1 or b.status =3 or b.status=4);";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, email);
            rs = pr.executeQuery();
            while (rs.next()) {
                BookingRoom b = new BookingRoom();
                Room r = new Room();
                r.setRoomName(rs.getString(1));
                r.setRoomId(rs.getString(2));

                b.setBooking_id(rs.getString(3));
                b.setDate(rs.getString(4));
                b.setMonth(rs.getString(5));
                b.setEnd_date(rs.getString(6));
                b.setStatus(rs.getString(7));
                r.setPrice(rs.getFloat(8));
                b.setRoom(r);
                listName.add(b);
            }
            return listName;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public String getOWnerID(String roomId) {
        String sql = "select r.user_id from Users as u , Rooms as r where u.user_id = r.user_id and r.room_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, roomId);
            rs = pr.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<BookingRoom> getContract(String Customer_id, String owner_id, String contract_id) {
        String sql = "		select DISTINCT  c.contract_id, u.email, u.full_name,u.date_of_birth, i.CCCD, i.issue_date, i.permanent_address, i.place_of_issue, u.phone_number \n"
                + "					from Contract as c , Information as i , Users as u, Booking as b  \n"
                + "					where c.status=1 and ((u.user_id=? or u.user_id=?) and contract_id =?) and u.user_id = i.user_id and (c.tenant_id= u.user_id or c.landlord_id= u.user_id)";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        ArrayList<BookingRoom> list = new ArrayList<>();
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, Customer_id);
            pr.setString(2, owner_id);
            pr.setString(3, contract_id);
            rs = pr.executeQuery();
            while (rs.next()) {
                BookingRoom b = new BookingRoom();
                Customer c = new Customer();
                Contract contract = new Contract();
                Information inf = new Information();
                contract.setContract_id(rs.getString(1));
                c.setEmail(rs.getString(2));
                c.setFullName(rs.getString(3));
                c.setBirthDate(rs.getString(4));
                inf.setCCCD(rs.getString(5));
                inf.setIssueDate(rs.getDate(6));
                inf.setPermanentAddress(rs.getString(7));
                inf.setPlaceOfIssue(rs.getString(8));
                c.setPhone(rs.getString(9));
                b.setC(contract);
                b.setCustomer(c);
                b.setInf(inf);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public BookingRoom getInfoContract(String customer_id, String owner_id, String contract_id) {
        String sql = "select DISTINCT  c.contract_id  ,b.booking_id, b.months,b.start_date, p.number_house, p.street, p.ward, p.district, p.city, c.room_price\n"
                + "					from Contract as c , Information as i , Users as u, Booking as b  , Rooms as r, Positions as p\n"
                + "					where c.status=1 and ((u.user_id=? or u.user_id=?) and contract_id =?) and u.user_id = i.user_id and (c.tenant_id= u.user_id or c.landlord_id= u.user_id) and r.room_id=b.room_id and p.position_id = r.position_id and b.status =1";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, customer_id);
            pr.setString(2, owner_id);
            pr.setString(3, contract_id);
            rs = pr.executeQuery();
            if (rs.next()) {
                BookingRoom br = new BookingRoom();
                Contract c = new Contract();
                Position p = new Position();

                c.setContract_id(rs.getString(1));
                br.setBooking_id(rs.getString(2));
                br.setMonth(rs.getString(3));
                br.setDate(rs.getString(4));
                p.setNumber_house(rs.getString(5));
                p.setStreet(rs.getString(6));
                p.setWard(rs.getString(7));
                p.setDistrict(rs.getString(8));
                p.setCity(rs.getString(9));
                c.setRoom_price(rs.getFloat(10));
                br.setC(c);
                br.setP(p);

                return br;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<BookingRoom> getCusTomerBooking(String ownerID) {
        String sql = "select r.room_name, b.user_id, b.start_date , b.months, b.end_date, b.status,b.booking_id,r.room_id  from Rooms as r, Booking as b where r.room_id = b.room_id and r.user_id=? and ( b.status=1 or b.status =5)";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        ArrayList<BookingRoom> list = new ArrayList<>();
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, ownerID);
            rs = pr.executeQuery();
            while (rs.next()) {
                BookingRoom b = new BookingRoom();
                Room r = new Room();
                r.setRoomName(rs.getString(1));
                b.setUser_id(rs.getString(2));
                b.setDate(rs.getString(3));
                b.setMonth(rs.getString(4));
                b.setEnd_date(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setBooking_id(rs.getString(7));
                r.setRoomId(rs.getString(8));
                b.setRoom(r);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int CheckBooking(String id_room) {
        String sql = "select count(*) from Booking as b , Rooms as r where r.room_id= b.room_id and r.room_id = ? and (b.status =1 or b.status=5) ";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, id_room);
            rs = pr.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public ArrayList<String> imaglist(String room_id) {
        String sql = "select i.image_url  from Images as i , Rooms as r where i.room_id = r.room_id and r.room_id = ?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        ArrayList<String> list = new ArrayList<>();
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, room_id);
            rs = pr.executeQuery();
            while (rs.next()) {
                String image = rs.getString(1);
                list.add(image);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void CancelBookingRoom(String bookingRoom_id) {
        String sql = "update Booking set status =3 where booking_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, bookingRoom_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void setStartDatebyBookingId(String start_date, String Booking_id) {
        String sql = "update Booking set start_date=? where booking_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, start_date);
            pr.setString(2, Booking_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void upadateMonth(String booking_id) {
        String sql = "update Booking set months =1 where booking_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, booking_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }
    // lấy ra người đang đợi đê phê duyệt gia hạn 

    public ArrayList<BookingRoom> getUserPendingExtend(String email_owner) {
        String sql = "SELECT u.full_name AS customer_name, \n"
                + "       r.room_name, \n"
                + "       b.booking_id, \n"
                + "       b.start_date, \n"
                + "       b.months, \n"
                + "       b.end_date, \n"
                + "       b.status,\n"
                + "       r.price,\n"
                + "       r.room_id\n  "
                + "FROM Booking b \n"
                + "JOIN Users u ON b.user_id = u.user_id  -- Người đặt phòng\n"
                + "JOIN Rooms r ON b.room_id = r.room_id  -- Phòng được đặt\n"
                + "JOIN Users owner ON r.user_id = owner.user_id -- Chủ phòng\n"
                + "WHERE b.status = 4 \n"
                + "AND owner.email = ?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        ArrayList<BookingRoom> list = new ArrayList<>();
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, email_owner);
            rs = pr.executeQuery();
            while (rs.next()) {
                BookingRoom b = new BookingRoom();
                Room r = new Room();
                Customer c = new Customer();
                c.setFullName(rs.getString("customer_name"));
                r.setRoomName(rs.getString("room_name"));
                b.setBooking_id(rs.getString("booking_id"));
                b.setDate(rs.getString("start_date"));
                b.setMonth(rs.getString("months"));
                b.setEnd_date(rs.getString("end_date"));
                b.setStatus(rs.getString("status"));
                r.setPrice(rs.getFloat("price"));
                r.setRoomId(rs.getString("room_id"));
                b.setCustomer(c);
                b.setRoom(r);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updatePendingContract(String booking_id) {
        String sql = "update Booking set status=4 where booking_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, booking_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void AcceptPendingContract(String booking_id) {
        String sql = "update Booking set status=1 where booking_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, booking_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public String getIdCustomer(String booking_id) {
        String sql = "select user_id from Booking where booking_id = ?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, booking_id);
            rs = pr.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void viPhamHopDong(String booking_id) {
        String sql = "update Booking set status = 5  where  booking_id= ?";
        Connection con = null;
        PreparedStatement pr = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, booking_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<BookingRoom> getListViPham() {
        String sql = "   select r.room_name, b.user_id, b.start_date , b.months, b.end_date , b.status,b.booking_id, r.room_id\n"
                + "from Rooms as r, Booking as b where r.room_id = b.room_id and b.status =5";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        ArrayList<BookingRoom> list = new ArrayList<>();
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            rs = pr.executeQuery();
            while (rs.next()) {
                BookingRoom b = new BookingRoom();
                Room r = new Room();
                r.setRoomName(rs.getString(1));
                b.setUser_id(rs.getString(2));
                b.setDate(rs.getString(3));
                b.setMonth(rs.getString(4));
                b.setEnd_date(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setBooking_id(rs.getString(7));
                r.setRoomId(rs.getString(8));
                b.setRoom(r);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void xulyvipham(String booking_id) {
        String sql = "update Booking set status = 2  where  booking_id= ?";
        Connection con = null;
        PreparedStatement pr = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, booking_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void tuChoiXuLyViPham(String booking_id) {
        String sql = "update Booking set status = 1  where  booking_id= ?";
        Connection con = null;
        PreparedStatement pr = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, booking_id);
            pr.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // lấy ra booking id lớn nhất khi 
    public String booking_ID_Max(String user_id) {
        String sql = "SELECT Top 1* FROM Booking WHERE user_id = ? ORDER BY booking_id DESC ";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, user_id);
            rs = pr.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public String Contract_id(String Booking_id) {
        String sql = "select contract_id from Contract where booking_id=?";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, Booking_id);
            rs = pr.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public String Booking_id(String Room_id) {
        String sql = "select booking_id from Booking where room_id = ? and status=1";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = database.getConnection();
            pr = con.prepareStatement(sql);
            pr.setString(1, Room_id);
            rs = pr.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
