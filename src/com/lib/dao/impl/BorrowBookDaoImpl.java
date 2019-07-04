package com.lib.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lib.dao.BorrowBookDao;
import com.lib.entity.BorrowBook;
import com.lib.entity.User;

//注入
@Repository
@Transactional
public class BorrowBookDaoImpl implements BorrowBookDao {

	public BorrowBookDaoImpl() {
		// TODO Auto-generated constructor stub
	}
    
	//注入applicationContext.xml中配置好的sessionFactory
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public void checkOwnMoney(String userID, String identity, HttpSession session) {
		// TODO Auto-generated method stub
		List<BorrowBook> list=new ArrayList<>();
		List<BorrowBook> li=new ArrayList<>();
		Date date=new Date();
		String hql="from BorrowBook where userID=? ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,userID);
		float money=0;
		
		 li=query.list();
		 for(int i=0;i<li.size();i++){
		  int day=(int) ((date.getTime()-li.get(i).getReturnDate().getTime())/(1000*3600*24));
		  System.out.println("该书已过期:"+day+"天!");
		  if(day>0){
			  BorrowBook brow=new BorrowBook();
			  brow=li.get(i);
			  list.add(brow);
			  
			  if(identity.equals("学生"))
			  money=money+(float) (+day*0.5);
			  else
			  money=money+(float) (+day*0.2);
		  }
		}
		User user=(User) session.getAttribute("user");
		user.setOwnMoney(money);
		session.setAttribute("user", user);
		session.setAttribute("ownList",list);
		System.out.println("您已欠费:"+money+"元!");
	}

	@Override
	public List<BorrowBook> getBorrowBook(String userID) {
		// TODO Auto-generated method stub
		String hql="from BorrowBook where userID=?";
		List<BorrowBook> b=new ArrayList();
	    Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,userID);
		System.out.println("用户账号:"+userID);
		return query.list();
	}

	@Override
	public String getBookId(int bookNum) {
		// TODO Auto-generated method stub
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery("{CALL findBID(?)}");
		query.setInteger(0, bookNum);
		List<Object> list=query.list();
	
		System.out.println("bookNum:"+ list.get(0).toString());  
		return list.get(0).toString();
	}

	@Override
	public int CheckBorrow(String userID, String bookName) {
		// TODO Auto-generated method stub
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery("{CALL CheckBorrow(?,?)}");
		query.setString(0, userID);
		query.setString(1, bookName);
		List<Object> list=query.list();
	
		System.out.println("以节约过Num:"+ list.get(0).toString());
		int num=Integer.valueOf(list.get(0).toString());
		return num;
	}

	@Override
	public boolean borrowBook(BorrowBook book) {
		// TODO Auto-generated method stub
		System.out.println(book.getBookId()+" "+book.getBorrowDate()+" "+book.getReturnDate());
		sessionFactory.getCurrentSession().save(book);
		System.out.println("借阅成功!");
	    return true;
	}

	@Override
	public boolean borrowAgain(BorrowBook book) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(book);
		System.out.println(book.getBorrowDate()+" "+book.getReturnDate()+" "+book.getUserName());
		System.out.println("续借成功!");
	    return true;
	}

	@Override
	public boolean returnBook(String userID, String bookName) {
		// TODO Auto-generated method stub
		  String hql="delete BorrowBook where userID=? and bookName=?";
		  Query query=sessionFactory.getCurrentSession().createQuery(hql);
		  query.setString(0,userID);
		  query.setString(1,bookName);
		  query.executeUpdate();
		  System.out.print("userNum:"+userID+"bookName:"+bookName);
		  System.out.println("删除一条记录");
		  return true;
	}


}
