/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author son
 */
public class ReportFeedback {
    public String feedbackId;
    public String email;
    public String fullname;
    public String room_name;
    public String content;

    public ReportFeedback() {
    }

    public ReportFeedback(String feedbackId, String email, String fullname, String room_name, String content) {
        this.feedbackId = feedbackId;
        this.email = email;
        this.fullname = fullname;
        this.room_name = room_name;
        this.content = content;
    }

    public String getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(String feedbackId) {
        this.feedbackId = feedbackId;
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

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "ReportFeedback{" + "feedbackId=" + feedbackId + ", email=" + email + ", fullname=" + fullname + ", room_name=" + room_name + ", content=" + content + '}';
    }
    
}
