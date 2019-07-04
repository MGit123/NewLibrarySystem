package com.lib.entity;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Book entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="bookInfo"
    ,catalog="bookManage"
)

public class Book  implements java.io.Serializable {


    // Fields    

     private Integer bookNum;
     private String bookName;
     private String author;
     private String bookType;
     private Integer remainNum;
     private Float price;
     private String publisher;
     private String imageUrl;
     private String bookContent;


    // Constructors

    /** default constructor */
    public Book() {
    }

	/** minimal constructor */
    public Book(String bookName, String author, String bookType, Integer remainNum) {
        this.bookName = bookName;
        this.author = author;
        this.bookType = bookType;
        this.remainNum = remainNum;
    }
    
    /** full constructor */
    public Book(String bookName, String author, String bookType, Integer remainNum, Float price, String publisher, String imageUrl, String bookContent) {
        this.bookName = bookName;
        this.author = author;
        this.bookType = bookType;
        this.remainNum = remainNum;
        this.price = price;
        this.publisher = publisher;
        this.imageUrl = imageUrl;
        this.bookContent = bookContent;
    }

   
    // Property accessors
    @Id @GeneratedValue
    
    @Column(name="bookNum", unique=true, nullable=false)

    public Integer getBookNum() {
        return this.bookNum;
    }
    
    public void setBookNum(Integer bookNum) {
        this.bookNum = bookNum;
    }
    
    @Column(name="bookName", nullable=false, length=20)

    public String getBookName() {
        return this.bookName;
    }
    
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }
    
    @Column(name="author", nullable=false, length=10)

    public String getAuthor() {
        return this.author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }
    
    @Column(name="bookType", nullable=false, length=10)

    public String getBookType() {
        return this.bookType;
    }
    
    public void setBookType(String bookType) {
        this.bookType = bookType;
    }
    
    @Column(name="remainNum", nullable=false)

    public Integer getRemainNum() {
        return this.remainNum;
    }
    
    public void setRemainNum(Integer remainNum) {
        this.remainNum = remainNum;
    }
    
    @Column(name="price", precision=10)

    public Float getPrice() {
        return this.price;
    }
    
    public void setPrice(Float price) {
        this.price = price;
    }
    
    @Column(name="publisher", length=20)

    public String getPublisher() {
        return this.publisher;
    }
    
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    
    @Column(name="imageURL", length=20)

    public String getImageUrl() {
        return this.imageUrl;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    @Column(name="bookContent")

    public String getBookContent() {
        return this.bookContent;
    }
    
    public void setBookContent(String bookContent) {
        this.bookContent = bookContent;
    }
   








}