/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author son
 */
public class Notification {
    public String Notification_User;
    public String reviced_id;
    public String notification_id;
    public String title;
    public int is_read;

    public String getReviced_id() {
        return reviced_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setReviced_id(String reviced_id) {
        this.reviced_id = reviced_id;
    }

    public String getNotification_id() {
        return notification_id;
    }

    public void setNotification_id(String notification_id) {
        this.notification_id = notification_id;
    }

    public Notification(String Notification_User, String reviced_id, String notification_id, int is_read) {
        this.Notification_User = Notification_User;
        this.reviced_id = reviced_id;
        this.notification_id = notification_id;
        this.is_read = is_read;
    }

    public String getNotification_User() {
        return Notification_User;
    }

    public void setNotification_User(String Notification_User) {
        this.Notification_User = Notification_User;
    }

    public int getIs_read() {
        return is_read;
    }

    public void setIs_read(int is_read) {
        this.is_read = is_read;
    }

    public Notification() {
    }

    public Notification(String reviced_id, String notification_id) {
        this.reviced_id = reviced_id;
        this.notification_id = notification_id;
    }

    @Override
    public String toString() {
        return "Notification{" + "reviced_id=" + reviced_id + ", notification_id=" + notification_id + '}';
    }

}
