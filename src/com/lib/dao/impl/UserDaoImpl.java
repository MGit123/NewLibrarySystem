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

//ע��
@Repository
@Transactional
public class UserDaoImpl implements UserDao {

	public UserDaoImpl() {
		// TODO Auto-generated constructor stub
	}
    
	//ע��applicationContext.xml�����úõ�sessionFactory
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public List<User> login(String userID, String password) {
		// TODO Auto-generated method stub
		String hql="from User where userID=? and password=?";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, userID);
		query.setString(1, password);
		System.out.println("�û���:"+userID+"����:"+password);
		return query.list();
	}

	@Override
	public List<Announce> getAnnonce(String userID) {
		// TODO Auto-generated method stub
		String hql="from Announce where receiveID=? or receiveID=? ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,"1");
		query.setString(1,userID);
		System.out.print("�Է���"+query.list().size()+"������!");
		return query.list();
	}

	@Override
	public boolean updateCode(User user) {
		// TODO Auto-generated method stub
	sessionFactory.getCurrentSession().update(user);
    System.out.println(user.getUserName()+" "+user.getPassword());
	System.out.println("�����޸ĳɹ�!");
   return true;
	}

	@Override
	public boolean returnMoney(User user) {
		// TODO Auto-generated method stub
	sessionFactory.getCurrentSession().update(user);
	 System.out.println(user.getUserName()+" "+user.getOwnMoney());
	System.out.println("���ý��ɳɹ�!");
	   return true;
	}

	@Override
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(user);
		System.out.println(user.getUserName()+" "+user.getUserId());
		System.out.println("�û���ӳɹ�!");
		 return true;
	}

	@Override
	public int findUserByID(String userID) {
		// TODO Auto-generated method stub
		String hql="from User where userID=? ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,userID);
		System.out.print("�Ѳ��ҵ��û�");
		return query.list().size();
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(user);
		System.out.println(user.getUserName()+" "+user.getUserId());
		System.out.println("�޸��û���Ϣ�ɹ�!");
		  return true;
	}

	@Override
	public boolean addAnnounce(Announce ano) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(ano);
		System.out.println(ano.getSendId()+" "+ano.getReceiveId());
		System.out.println("���淢���ɹ�!");
		 return true;
	}

	@Override
	public User findByID(String userID) {
		// TODO Auto-generated method stub
		String hql="from User where userID=? ";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,userID);
		User user=(User)query.list().get(0);
		System.out.print("�Ѳ��ҵ��û�");
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
		  System.out.println("�û���ע��!");
		  return true;
	}

}
