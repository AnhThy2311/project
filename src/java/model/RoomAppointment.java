package model;
public class RoomAppointment {
     private int appointmentId;
    private Customer customer;
    private Room room;
    private String viewDate;
    private int status;
    public RoomAppointment(int appointmentId, Customer customer, Room room, String viewDate, int status) {
        this.appointmentId = appointmentId;
        this.customer = customer;
        this.room = room;
        this.viewDate = viewDate;
        this.status = status;
    }

    public RoomAppointment() {
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public String getViewDate() {
        return viewDate;
    }

    public void setViewDate(String viewDate) {
        this.viewDate = viewDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "RoomAppointment{" + "appointmentId=" + appointmentId + ", customer=" + customer + ", room=" + room + ", viewDate=" + viewDate + ", status=" + status + '}';
    }
}
