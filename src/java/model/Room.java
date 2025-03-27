/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Room {

    private String roomId;
    private String roomName;
    private String description;
    private double price;
    private String state;
    private Position position;
    private Customer customer;
    private String image;
    private double electricity_price;
    private double water_price;
    private double area;

    public Room() {
    }

    public Room(String roomId, String roomName, String description, double price, Position position, Customer customer, String image) {
        this.roomId = roomId;
        this.roomName = roomName;
        this.description = description;
        this.price = price;
        this.position = position;
        this.customer = customer;
        this.image = image;
    }

    public Room(String roomId, String roomName, String description, double price, String state, Position position, Customer customer, String image, double electricity_price, double water_price, double area) {
        this.roomId = roomId;
        this.roomName = roomName;
        this.description = description;
        this.price = price;
        this.state = state;
        this.position = position;
        this.customer = customer;
        this.image = image;
        this.electricity_price = electricity_price;
        this.water_price = water_price;
        this.area = area;
    }

    public double getElectricity_price() {
        return electricity_price;
    }

    public void setElectricity_price(double electricity_price) {
        this.electricity_price = electricity_price;
    }

    public double getWater_price() {
        return water_price;
    }

    public void setWater_price(double water_price) {
        this.water_price = water_price;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public Room(String roomId, String roomName, String description, double price, String state, Position position, Customer customer, String image) {
        this.roomId = roomId;
        this.roomName = roomName;
        this.description = description;
        this.price = price;
        this.state = state;
        this.position = position;
        this.customer = customer;
        this.image = image;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
