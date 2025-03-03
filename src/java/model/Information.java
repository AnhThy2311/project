/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author son
 */
public class Information {

    private int userId;
    private String CCCD;
    private Date issueDate;
    private String placeOfIssue;
    private String permanentAddress;

    public Information() {
    }

    public Information(int userId, String CCCD, Date issueDate, String placeOfIssue, String permanentAddress) {
        this.userId = userId;
        this.CCCD = CCCD;
        this.issueDate = issueDate;
        this.placeOfIssue = placeOfIssue;
        this.permanentAddress = permanentAddress;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCCCD() {
        return CCCD;
    }

    public void setCCCD(String CCCD) {
        this.CCCD = CCCD;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public String getPlaceOfIssue() {
        return placeOfIssue;
    }

    public void setPlaceOfIssue(String placeOfIssue) {
        this.placeOfIssue = placeOfIssue;
    }

    public String getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    @Override
    public String toString() {
        return "Information{" + "userId=" + userId + ", CCCD=" + CCCD + ", issueDate=" + issueDate + ", placeOfIssue=" + placeOfIssue + ", permanentAddress=" + permanentAddress + '}';
    }
}
