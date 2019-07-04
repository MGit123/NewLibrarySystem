package com.lib.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lib.dao.UserDao;
import com.lib.entity.Announce;
import com.lib.entity.User;

//注入
@Repository
@Transactional
public class UserDaoImpl implements UserDao {

	public UserDaoImpl() {
		// TODO Auto-generated constructor stub
	}
    
	//注入applicationContext.xml中配置好的sessionFactory
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public List<User> login(String userID, String password) {
		// TODO Auto-generated method stub
		String hql="from User where userID=? and password=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, userID);
		query.setString(1, password);
		System.out.println("用户名:"+userID+"密码:"+password);
		return query.list();
	}

	@Override
	public List<Announce> getAnnonce(String userID) {
		// TODO Auto-generated method stub
		String hql="from Announce where receiveID=? or receiveID=? ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,"1");
		query.setString(1,userID);
		System.out.print("以发布"+query.list().size()+"条公告!");
		return query.list();
	}

	@Override
	public boolean updateCode(User user) {
		// TODO Auto-generated method stub
	sessionFactory.getCurrentSession().update(user);
    System.out.println(user.getUserName()+" "+user.getPassword());
	System.out.println("密码修改成功!");
   return true;
	}

	@Override
	public boolean returnMoney(User user) {
		// TODO Auto-generated method stub
	sessionFactory.getCurrentSession().update(user);
	 System.out.println(user.getUserName()+" "+user.getOwnMoney());
	System.out.println("费用缴纳成功!");
	   return true;
	}

	@Override
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(user);
		System.out.println(user.getUserName()+" "+user.getUserId());
		System.out.println("用户添加成功!");
		 return true;
	}

	@Override
	public int findUserByID(String userID) {
		// TODO Auto-generated method stub
		String hql="from User where userID=? ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,userID);
		System.out.print("已查找到用户");
		return query.list().size();
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(user);
		System.out.println(user.getUserName()+" "+user.getUserId());
		System.out.println("修改用户信息成功!");
		  return true;
	}

	@Override
	public boolean addAnnounce(Announce ano) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(ano);
		System.out.println(ano.getSendId()+" "+ano.getReceiveId());
		System.out.println("公告发布成功!");
		 return true;
	}

	@Override
	public User findByID(String userID) {
		// TODO Auto-generated method stub
		String hql="from User where userID=? ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,userID);
		User user=(User)query.list().get(0);
		System.out.print("已查找到用户");
		return user;
	}

	@Override
	public boolean deleUser(String userID) {
		// TODO Auto-generated method stub
		String hql="delete User where userID=? ";
		  Query query=sessionFactory.getCurrentSession().createQuery(hql);
		  query.setString(0,userID);
		  query.executeUpdate();
		  System.out.print("userNum:"+userID);
		  System.out.println("用户已注销!");
		  return true;
	}

}
