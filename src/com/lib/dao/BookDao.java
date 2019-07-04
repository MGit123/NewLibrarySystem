package com.lib.dao;

import java.util.List;

import com.lib.entity.Book;

public interface BookDao {
	//获取图书的完整信息
		public List<Book> ListBook(int pageNum);
		
		//条件搜索
		public List<Book> ListBook(int pageNum,int selectType,String val);
	    
		//获取列表页数
		public int getPage();
		
		public int getPage(int selectType,String val);
		
		public Book findBookByNum(int bookNum);
		
		public boolean addBook(Book book);
		
		public boolean updateBook(Book book);
		
}
