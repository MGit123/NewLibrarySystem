package com.lib.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lib.dao.BookDao;
import com.lib.entity.Book;
import com.lib.service.BookService;

@Service     //自动扫描包，注入Service
@Transactional
public class BookServiceImpl implements BookService {

	public BookServiceImpl() {
		// TODO Auto-generated constructor stub
	}
   
	@Autowired             //注入Dao
	private BookDao bookDao;
	
	@Override
	public List<Book> ListBook(int pageNum) {
		// TODO Auto-generated method stub
		return bookDao.ListBook(pageNum);
	}

	@Override
	public List<Book> ListBook(int pageNum, int selectType, String val) {
		// TODO Auto-generated method stub
		return bookDao.ListBook(pageNum, selectType, val);
	}

	@Override
	public int getPage() {
		// TODO Auto-generated method stub
		return bookDao.getPage();
	}

	@Override
	public int getPage(int selectType, String val) {
		// TODO Auto-generated method stub
		return bookDao.getPage(selectType, val);
	}

	@Override
	public Book findBookByNum(int bookNum) {
		// TODO Auto-generated method stub
		return bookDao.findBookByNum(bookNum);
	}

	@Override
	public boolean addBook(Book book) {
		// TODO Auto-generated method stub
		return bookDao.addBook(book);
	}

	@Override
	public boolean updateBook(Book book) {
		// TODO Auto-generated method stub
		return bookDao.updateBook(book);
	}
   
	
}
