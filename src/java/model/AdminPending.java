/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author son
 */
public class AdminPending {
    public String email;
    public String fullname;
    public String image;
    public String roomName;
    public float price;
    public String numberHouse;
    public String street;
    public String ward;
    public String district;
    public String city;
    public String positionId;
    public String status;

    public AdminPending(String email, String fullname, String image, String roomName, float price, String numberHouse, String street, String ward, String district, String city, String positionId, String status) {
        this.email = email;
        this.fullname = fullname;
        this.image = image;
        this.roomName = roomName;
        this.price = price;
        this.numberHouse = numberHouse;
        this.street = street;
        this.ward = ward;
        this.district = district;
        this.city = city;
        this.positionId = positionId;
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getNumberHouse() {
        return numberHouse;
    }

    public void setNumberHouse(String numberHouse) {
        this.numberHouse = numberHouse;
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

    public String getPositionId() {
        return positionId;
    }

    public void setPositionId(String positionId) {
        this.positionId = positionId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "AdminPendingapproval{" + "email=" + email + ", fullname=" + fullname + ", image=" + image + ", roomName=" + roomName + ", price=" + price + ", numberHouse=" + numberHouse + ", street=" + street + ", ward=" + ward + ", district=" + district + ", city=" + city + ", positionId=" + positionId + ", status=" + status + '}';
    }
    
}
