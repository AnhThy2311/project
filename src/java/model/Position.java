/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author son
 */
public class Position {
    public String number_house;
    public String street;
    public String ward;
    public String district;
    public String city;
    public String description;

    public Position() {
    }

    public Position(String number_house, String street, String ward, String district, String city, String description) {
        this.number_house = number_house;
        this.street = street;
        this.ward = ward;
        this.district = district;
        this.city = city;
        this.description = description;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Position{" + "number_house=" + number_house + ", street=" + street + ", ward=" + ward + ", district=" + district + ", city=" + city + ", description=" + description + '}';
    }

}
