/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Hoang Khoi
 */
public class customer implements Serializable {

    private int cusId;
    private String fullname;
    private String email;
    private String phoneNumber;
    private int TierID;
    private int CurrentPoints;
    private int TotalSpend;
    private String password;
    private Date createdAt;
    private boolean status;
    //cac fields them vao dua tren ten cot cua bang Customer trong DB

    public customer() {
    }

    public customer(int cusId, String fullname, String email, String phoneNumber, int TierID, int CurrentPoints, int TotalSpend, String password, Date createdAt, boolean status) {
        this.cusId = cusId;
        this.fullname = fullname;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.TierID = TierID;
        this.CurrentPoints = CurrentPoints;
        this.TotalSpend = TotalSpend;
        this.password = password;
        this.createdAt = createdAt;
        this.status = status;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setTierID(int TierID) {
        this.TierID = TierID;
    }

    public void setCurrentPoints(int CurrentPoints) {
        this.CurrentPoints = CurrentPoints;
    }

    public void setTotalSpend(int TotalSpend) {
        this.TotalSpend = TotalSpend;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public int getTierID() {
        return TierID;
    }

    public int getCurrentPoints() {
        return CurrentPoints;
    }

    public int getTotalSpend() {
        return TotalSpend;
    }

    public int getCusId() {
        return cusId;
    }

    public void setCusId(int cusId) {
        this.cusId = cusId;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
