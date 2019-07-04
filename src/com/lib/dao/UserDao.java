package com.lib.dao;

import java.util.List;

import com.lib.entity.Announce;
import com.lib.entity.User;

public interface UserDao {
    
	public List<User> login(String userID,String password);
	
	public List<Announce> getAnnonce(String userID);
	
	public boolean addAnnounce(Announce ano);
	
	public boolean updateCode(User user);
	
	public boolean returnMoney(User user);
	
	public boolean addUser(User user);
	
	public int findUserByID(String userID);
	
	public User findByID(String userID);
	
	public boolean updateUser(User user);
	
	public boolean deleUser(String userID);
}
