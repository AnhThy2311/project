package model;

public class Contract {
    public String contract_id;
    public String booking_id;
    public String  Customer_id;
    public String Owner_id;
    public String create_date;
    public String status;
    public float Room_price;
    public float Admin_price;

    public Contract(String contract_id, String booking_id, String Customer_id, String Owner_id, String create_date, String status, float Room_price, float Admin_price) {
        this.contract_id = contract_id;
        this.booking_id = booking_id;
        this.Customer_id = Customer_id;
        this.Owner_id = Owner_id;
        this.create_date = create_date;
        this.status = status;
        this.Room_price = Room_price;
        this.Admin_price = Admin_price;
    }

    public Contract() {
    }

    public float getRoom_price() {
        return Room_price;
    }

    public void setRoom_price(float Room_price) {
        this.Room_price = Room_price;
    }

    public float getAdmin_price() {
        return Admin_price;
    }

    public void setAdmin_price(float Admin_price) {
        this.Admin_price = Admin_price;
    }

   

    public String getContract_id() {
        return contract_id;
    }

    public void setContract_id(String contract_id) {
        this.contract_id = contract_id;
    }

    public String getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(String booking_id) {
        this.booking_id = booking_id;
    }

    public String getCustomer_id() {
        return Customer_id;
    }

    public void setCustomer_id(String Customer_id) {
        this.Customer_id = Customer_id;
    }

    public String getOwner_id() {
        return Owner_id;
    }

    public void setOwner_id(String Owner_id) {
        this.Owner_id = Owner_id;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Contract{" + "contract_id=" + contract_id + ", booking_id=" + booking_id + ", Customer_id=" + Customer_id + ", Owner_id=" + Owner_id + ", create_date=" + create_date + ", status=" + status + ", Room_price=" + Room_price + ", Admin_price=" + Admin_price + '}';
    }

   
}
