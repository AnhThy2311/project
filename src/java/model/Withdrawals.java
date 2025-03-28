/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author son
 */
public class Withdrawals {
    public String user_id;
    public String account_number;
    public String date;
    public float price;
    public String bank_name;
    public String recipient_name;
    public int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public Withdrawals() {
    }

    public Withdrawals(String user_id, String account_number, String date, float price, String bank_name, String recipient_name, int status) {
        this.user_id = user_id;
        this.account_number = account_number;
        this.date = date;
        this.price = price;
        this.bank_name = bank_name;
        this.recipient_name = recipient_name;
        this.status = status;
    }
    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getAccount_number() {
        return account_number;
    }

    public void setAccount_number(String account_number) {
        this.account_number = account_number;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getBank_name() {
        return bank_name;
    }

    public void setBank_name(String bank_name) {
        this.bank_name = bank_name;
    }

    public String getRecipient_name() {
        return recipient_name;
    }

    public void setRecipient_name(String recipient_name) {
        this.recipient_name = recipient_name;
    }
    
}
