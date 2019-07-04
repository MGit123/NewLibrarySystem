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
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="userInfo"
    ,catalog="bookManage"
)

public class User  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String userId;
     private String userName;
     private String password;
     private String sex;
     private Date birthday;
     private String email;
     private String identity;
     private Integer borrowed;
     private Integer allowLend;
     private Float ownMoney;


    // Constructors

    /** default constructor */
    public User() {
    }

	/** minimal constructor */
    public User(String userId, String userName, String password, String sex, String email, String identity) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.sex = sex;
        this.email = email;
        this.identity = identity;
    }
    
    /** full constructor */
    public User(String userId, String userName, String password, String sex, Date birthday, String email, String identity, Integer borrowed, Integer allowLend, Float ownMoney) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.sex = sex;
        this.birthday = birthday;
        this.email = email;
        this.identity = identity;
        this.borrowed = borrowed;
        this.allowLend = allowLend;
        this.ownMoney = ownMoney;
    }

   
    // Property accessors
    @Id @GeneratedValue
    
    @Column(name="id", unique=true, nullable=false)

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name="userID", nullable=false, length=10)

    public String getUserId() {
        return this.userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    @Column(name="userName", nullable=false, length=10)

    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    @Column(name="password", nullable=false, length=10)

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    @Column(name="sex", nullable=false, length=3)

    public String getSex() {
        return this.sex;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="birthday", length=10)

    public Date getBirthday() {
        return this.birthday;
    }
    
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    
    @Column(name="email", nullable=false, length=20)

    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    @Column(name="identity", nullable=false, length=10)

    public String getIdentity() {
        return this.identity;
    }
    
    public void setIdentity(String identity) {
        this.identity = identity;
    }
    
    @Column(name="borrowed")

    public Integer getBorrowed() {
        return this.borrowed;
    }
    
    public void setBorrowed(Integer borrowed) {
        this.borrowed = borrowed;
    }
    
    @Column(name="allowLend")

    public Integer getAllowLend() {
        return this.allowLend;
    }
    
    public void setAllowLend(Integer allowLend) {
        this.allowLend = allowLend;
    }
    
    @Column(name="ownMoney", precision=5, scale=0)

    public Float getOwnMoney() {
        return this.ownMoney;
    }
    
    public void setOwnMoney(Float ownMoney) {
        this.ownMoney = ownMoney;
    }
   








}