/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author son
 */
public class Wallet {

    public String userID;
    public Customer customer;
    public float price;

    public Wallet() {
    }

    public Wallet(String userID, Customer customer, float price) {
        this.userID = userID;
        this.customer = customer;
        this.price = price;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Wallet{" + "userID=" + userID + ", customer=" + customer + ", price=" + price + '}';
    }
    
    

}
