package com.lib.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.lib.dao.BookDao;
import com.lib.entity.Book;

//注入
@Repository
public class BookDaoImpl implements BookDao {

	public BookDaoImpl() {
		// TODO Auto-generated constructor stub
	}
    
	//注入applicationContext.xml中配置好的sessionFactory
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public List<Book> ListBook(int pageNum) {
		// TODO Auto-generated method stub
		int pageSize=5;        //列表5行
		int page=(pageNum-1)*5; //第n-1页
		
		String hql="from Book order by bookNum";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(page);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public List<Book> ListBook(int pageNum, int selectType, String val) {
		// TODO Auto-generated method stub
		int pageSize=5;        //列表5行
		int page=(pageNum-1)*5; //第n-1页
		String hql="";
		
		if(selectType==1){
			hql="from Book where bookNum=? order by bookNum";
		}
		else if(selectType==2){
			hql="from Book where author=? order by bookNum";
		}else{
			hql="from Book where bookType=? order by bookNum";
		}
		
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, val);
		query.setFirstResult(page);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int getPage() {
		// TODO Auto-generated method stub
		int recordCount=0;        
	    int t1=0;   //余数
	    int t2=0;   //页数
	    
	    String hql="from Book";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		recordCount=query.list().size();
		System.out.println("查询到:"+recordCount+"条记录!");
		t1=recordCount%5;
		t2=recordCount/5;  
		
		if(t1 != 0){
			t2=t2+1;
			}
		return t2;
	}

	@Override
	public int getPage(int selectType, String val) {
		// TODO Auto-generated method stub
		int recordCount=0;        
	    int t1=0;   //整数
	    int t2=0;   //对5求余数
	    String  hql="";
	    
	    if(selectType==1){
			hql="from Book where bookNum=?";
		}
		else if(selectType==2){
			hql="from Book where author=?";
		}else{
			hql="from Book where bookType=?";
		}
	    
	    Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, val);
		recordCount=query.list().size();
		System.out.println("查询到:"+recordCount+"条记录!");
		t1=recordCount%5;
		t2=recordCount/5;  
		
		if(t1 != 0){
			t2=t2+1;
			}
		
		return t2;
	}

	@Override
	public Book findBookByNum(int bookNum) {
		// TODO Auto-generated method stub
		String hql="from Book where bookNum=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0, bookNum);
		return (Book) query.list().get(0);
	}

	@Override
	public boolean addBook(Book book) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(book);
		System.out.println(book.getBookName()+" "+book.getBookNum());
		System.out.println("图书入库成功!");
		 return true;
	}

	@Override
	public boolean updateBook(Book book) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(book);
		System.out.println(book.getBookName()+" "+book.getBookNum());
		System.out.println("图书信息修改成功!");
		 return true;
	}

}
