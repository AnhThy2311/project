package model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class BookingRoom {

    public String booking_id;
    public String user_id;
    public String room_id;
    public String date;
    public String month;
    public String status;
    public Customer customer;
    public String end_date;
    public String RoomName;
    public float totalPrice;
    public Room room;
    public Contract c;
    public Information inf;
    public Position p;

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public BookingRoom(String user_id, String room_id, String date, String month, String status) {
        this.user_id = user_id;
        this.room_id = room_id;
        this.date = date;
        this.month = month;
        this.status = status;
    }

    public BookingRoom(String date, String end_date) {
        this.date = date;
        this.end_date = end_date;
    }

    public long getDaysLeft() {
        try {
            LocalDate today = LocalDate.now();
            LocalDate endDate = LocalDate.parse(end_date, formatter);
            return ChronoUnit.DAYS.between(today, endDate);
        } catch (Exception e) {
            e.printStackTrace();
            return -1; // Trả về -1 nếu có lỗi
        }
    }

    public BookingRoom() {
    }

    public Position getP() {
        return p;
    }

    public void setP(Position p) {
        this.p = p;
    }

    public Contract getC() {
        return c;
    }

    public Information getInf() {
        return inf;
    }

    public void setInf(Information inf) {
        this.inf = inf;
    }

    public void setC(Contract c) {
        this.c = c;
    }

    public Room getRoom() {
        return room;
    }

    public String getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(String booking_id) {
        this.booking_id = booking_id;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public String getRoomName() {
        return RoomName;
    }

    public void setRoomName(String RoomName) {
        this.RoomName = RoomName;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "BookingRoom{" + "user_id=" + user_id + ", room_id=" + room_id + ", date=" + date + ", month=" + month + ", status=" + status + '}';
    }

}
