package com.lib.service;

import java.util.List;

import com.lib.entity.Announce;
import com.lib.entity.User;

public interface UserService {

	public List<User> login(String userID, String password);
	
	public List<Announce> getAnnonce(String userID);
	
    public boolean updateCode(User user);
	
	public boolean returnMoney(User user);
	
	public boolean addUser(User user);
	
	public int findUserByID(String userID);
	
	public boolean updateUser(User user);
	
	public boolean addAnnounce(Announce ano);
	
	public User findByID(String userID); 
	
	public boolean deleUser(String userID);
}
