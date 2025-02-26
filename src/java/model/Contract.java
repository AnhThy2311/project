package model;

import java.util.Date;

public class Contract {
    private int contractId;
    private int bookingId;
    private int tenantId;
    private int landlordId;
    private Date creationDate;
    private String content;
    private String status;
    private int requestId;

    // Constructors, getters, and setters

    public Contract() {}

    public Contract(int contractId, int bookingId, int tenantId, int landlordId, Date creationDate, String content, String status, int requestId) {
        this.contractId = contractId;
        this.bookingId = bookingId;
        this.tenantId = tenantId;
        this.landlordId = landlordId;
        this.creationDate = creationDate;
        this.content = content;
        this.status = status;
        this.requestId = requestId;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getTenantId() {
        return tenantId;
    }

    public void setTenantId(int tenantId) {
        this.tenantId = tenantId;
    }

    public int getLandlordId() {
        return landlordId;
    }

    public void setLandlordId(int landlordId) {
        this.landlordId = landlordId;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }
}
