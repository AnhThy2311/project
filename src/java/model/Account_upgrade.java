
package model;


public class Account_upgrade {
    public String user_id;
    public float price;
    public String create_date;

    public Account_upgrade(String user_id, float price) {
        this.user_id = user_id;
        this.price = price;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public Account_upgrade() {
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Account_upgrade{" + "user_id=" + user_id + ", price=" + price + '}';
    }
    
}
