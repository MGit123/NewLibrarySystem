package com.lib.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lib.dao.BorrowBookDao;
import com.lib.entity.BorrowBook;
import com.lib.service.BorrowBookService;

@Service     //自动扫描包，注入Service
public class BorrowBookServiceImpl implements BorrowBookService  {

	public BorrowBookServiceImpl() {
		// TODO Auto-generated constructor stub
	}
    
	@Autowired             //注入Dao
	private BorrowBookDao borrowBookDao;
	
	@Override
	public void checkOwnMoney(String userID, String identity, HttpSession session) {
		// TODO Auto-generated method stub
		borrowBookDao.checkOwnMoney(userID, identity, session);
	}

	@Override
	public List<BorrowBook> getBorrowBook(String userID) {
		// TODO Auto-generated method stub
		return borrowBookDao.getBorrowBook(userID);
	}

	@Override
	public String getBookId(int bookNum) {
		// TODO Auto-generated method stub
		return borrowBookDao.getBookId(bookNum);
	}

	@Override
	public int CheckBorrow(String userID, String bookName) {
		// TODO Auto-generated method stub
		return borrowBookDao.CheckBorrow(userID, bookName);
	}

	@Override
	public boolean borrowBook(BorrowBook book) {
		// TODO Auto-generated method stub
		return borrowBookDao.borrowBook(book);
	}

	@Override
	public boolean borrowAgain(BorrowBook book) {
		// TODO Auto-generated method stub
		return borrowBookDao.borrowAgain(book);
	}

	@Override
	public boolean returnBook(String userID, String bookName) {
		// TODO Auto-generated method stub
		return borrowBookDao.returnBook(userID, bookName);
	}

}
