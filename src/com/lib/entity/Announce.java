package com.lib.entity;
// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * Announce entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="SystemInfo"
    ,catalog="bookManage"
)

public class Announce  implements java.io.Serializable {


    // Fields    

     private Integer infoNum;
     private String infoName;
     private String sendId;
     private String receiveId;
     private String text;
     private Date releaseDate;


    // Constructors

    /** default constructor */
    public Announce() {
    }

    
    /** full constructor */
    public Announce(String infoName, String sendId, String receiveId, String text, Date releaseDate) {
        this.infoName = infoName;
        this.sendId = sendId;
        this.receiveId = receiveId;
        this.text = text;
        this.releaseDate = releaseDate;
    }

   
    // Property accessors
    @Id @GeneratedValue
    
    @Column(name="infoNum", unique=true, nullable=false)

    public Integer getInfoNum() {
        return this.infoNum;
    }
    
    public void setInfoNum(Integer infoNum) {
        this.infoNum = infoNum;
    }
    
    @Column(name="infoName")

    public String getInfoName() {
        return this.infoName;
    }
    
    public void setInfoName(String infoName) {
        this.infoName = infoName;
    }
    
    @Column(name="sendID", length=10)

    public String getSendId() {
        return this.sendId;
    }
    
    public void setSendId(String sendId) {
        this.sendId = sendId;
    }
    
    @Column(name="receiveID", length=10)

    public String getReceiveId() {
        return this.receiveId;
    }
    
    public void setReceiveId(String receiveId) {
        this.receiveId = receiveId;
    }
    
    @Column(name="text")

    public String getText() {
        return this.text;
    }
    
    public void setText(String text) {
        this.text = text;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="releaseDate", length=10)

    public Date getReleaseDate() {
        return this.releaseDate;
    }
    
    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }
   








}