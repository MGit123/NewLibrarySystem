package com.lib.service;

import java.util.List;

import com.lib.entity.Book;

public interface BookService {
	public List<Book> ListBook(int pageNum);
	
	//��������
	public List<Book> ListBook(int pageNum,int selectType,String val);
    
	//��ȡ�б�ҳ��
	public int getPage();
	
	public int getPage(int selectType,String val);
	
	public Book findBookByNum(int bookNum);
	
	public boolean addBook(Book book);
	
	public boolean updateBook(Book book);
}
