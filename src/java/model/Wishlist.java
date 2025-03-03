/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class Wishlist {
    private Room room;
    private Customer customer;

    public Wishlist(Room room, Customer customer) {
        this.room = room;
        this.customer = customer;
    }

    public Wishlist() {
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "Wishlist{" + "room=" + room + ", customer=" + customer + '}';
    }
    
}
