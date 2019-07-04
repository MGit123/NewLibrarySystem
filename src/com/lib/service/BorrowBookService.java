package com.lib.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lib.entity.BorrowBook;

public interface BorrowBookService {
    
	public List<BorrowBook> getBorrowBook(String userID);
	
	public void checkOwnMoney(String userID, String identity, HttpSession session);
	
	public String getBookId(int bookNum);
	
	public int CheckBorrow(String userID, String bookName);
	
    public boolean borrowBook(BorrowBook book);
	
	public boolean borrowAgain(BorrowBook book);
	
	public boolean returnBook(String userID,String bookName);
}
