package com.lib.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lib.dao.UserDao;
import com.lib.entity.Announce;
import com.lib.entity.User;
import com.lib.service.UserService;

@Service     //自动扫描包，注入Service
public class UserServiceImpl implements UserService {

	public UserServiceImpl() {
		// TODO Auto-generated constructor stub
	}
    
	@Autowired             //注入Dao
	private UserDao userDao;
	
	
	@Override
	public List<User> login(String userID, String password) {
		// TODO Auto-generated method stub
		return userDao.login(userID, password);
	}


	@Override
	public List<Announce> getAnnonce(String userID) {
		// TODO Auto-generated method stub
		return userDao.getAnnonce(userID);
	}


	@Override
	public boolean updateCode(User user) {
		// TODO Auto-generated method stub
		return userDao.updateCode(user);
	}


	@Override
	public boolean returnMoney(User user) {
		// TODO Auto-generated method stub
		return userDao.returnMoney(user);
	}


	@Override
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		return userDao.addUser(user);
	}


	@Override
	public int findUserByID(String userID) {
		// TODO Auto-generated method stub
		return userDao.findUserByID(userID);
	}


	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}


	@Override
	public boolean addAnnounce(Announce ano) {
		// TODO Auto-generated method stub
		return userDao.addAnnounce(ano);
	}


	@Override
	public User findByID(String userID) {
		// TODO Auto-generated method stub
		return userDao.findByID(userID);
	}


	@Override
	public boolean deleUser(String userID) {
		// TODO Auto-generated method stub
		return userDao.deleUser(userID);
	}
   
	
}
