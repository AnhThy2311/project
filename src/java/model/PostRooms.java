/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author son
 */
public class PostRooms {

    public String id;
    public String image;
    public String room_name;
    public float price;
    public String number_house;
    public String street;
    public String ward;
    public String district;
    public String city;
    
    public PostRooms(String image, String room_name, float price, String number_house, String street, String ward, String district, String city) {
        this.image = image;
        this.room_name = room_name;
        this.price = price;
        this.number_house = number_house;
        this.street = street;
        this.ward = ward;
        this.district = district;
        this.city = city;
    }

    public PostRooms(String image, String room_name, float price, String number_house, String street, String ward, String district, String city, String id) {

        this.image = image;
        this.room_name = room_name;
        this.price = price;
        this.number_house = number_house;
        this.street = street;
        this.ward = ward;
        this.district = district;
        this.city = city;
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public String getNumber_house() {
        return number_house;
    }

    public void setNumber_house(String number_house) {
        this.number_house = number_house;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "PostRooms{" + "image=" + image + ", room_name=" + room_name + ", price=" + price + ", number_house=" + number_house + ", street=" + street + ", ward=" + ward + ", district=" + district + ", city=" + city + '}';
    }

}
