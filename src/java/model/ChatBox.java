/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;


public class ChatBox {
    public String id;
    public String sender;
    public String receiver;
    public String content;
    public String  time;
    public String imange;

    public String name;

    public ChatBox(String sender, String imange, String name) {
        this.sender = sender;
        this.imange = imange;
        this.name = name;
    }
    
    public ChatBox(String id, String sender, String receiver, String content, String time, String imange) {
        this.id = id;
        this.sender = sender;
        this.receiver = receiver;
        this.content = content;
        this.time = time;
        this.imange = imange;
    }

    public ChatBox(String sender, String content, String time, String imange) {
        this.sender = sender;
        this.content = content;
        this.time = time;
        this.imange = imange;
    }

    public String getImange() {
        return imange;
    }

    public void setImange(String imange) {
        this.imange = imange;
    }

    public ChatBox() {
    }

    public String getId() {
        return id;
    }

    public ChatBox(String name) {
        this.name = name;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
}
