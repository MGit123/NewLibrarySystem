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
 * BorrowBook entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="borrowInfo"
    ,catalog="bookManage"
)

public class BorrowBook  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String bookId;
     private String bookName;
     private String userId;
     private String userName;
     private String author;
     private Date borrowDate;
     private Date returnDate;


    // Constructors

    /** default constructor */
    public BorrowBook() {
    }

	/** minimal constructor */
    public BorrowBook(String bookId, String bookName, String userId, String userName, String author) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.userId = userId;
        this.userName = userName;
        this.author = author;
    }
    
    /** full constructor */
    public BorrowBook(String bookId, String bookName, String userId, String userName, String author, Date borrowDate, Date returnDate) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.userId = userId;
        this.userName = userName;
        this.author = author;
        this.borrowDate = borrowDate;
        this.returnDate = returnDate;
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
    
    @Column(name="bookID", nullable=false, length=20)

    public String getBookId() {
        return this.bookId;
    }
    
    public void setBookId(String bookId) {
        this.bookId = bookId;
    }
    
    @Column(name="bookName", nullable=false, length=10)

    public String getBookName() {
        return this.bookName;
    }
    
    public void setBookName(String bookName) {
        this.bookName = bookName;
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
    
    @Column(name="author", nullable=false, length=10)

    public String getAuthor() {
        return this.author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="borrowDate", length=10)

    public Date getBorrowDate() {
        return this.borrowDate;
    }
    
    public void setBorrowDate(Date borrowDate) {
        this.borrowDate = borrowDate;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="returnDate", length=10)

    public Date getReturnDate() {
        return this.returnDate;
    }
    
    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }
   








}