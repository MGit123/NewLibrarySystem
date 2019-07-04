package com.lib.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lib.entity.User;
import com.lib.service.UserService;

@Controller
public class UserController {
    
	@Autowired        //×¢ÈëUserService
	private UserService userService;
	
	public UserController() {
		// TODO Auto-generated constructor stub
	}
    
	@RequestMapping("updateCode")
	public void updateCode(HttpServletResponse response,HttpServletRequest request,String newpass) throws IOException{
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		user.setPassword(newpass);;
		session.setAttribute("user", user);
		boolean value=userService.updateCode(user);
		
		if(value==true)
			out.print(200);
	}
	
	@RequestMapping("RefundMoney")
	public void RefundMoney(HttpServletResponse response,HttpServletRequest request) throws IOException{
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
        float m=0;
        user.setOwnMoney(m);
        userService.returnMoney(user);
        session.setAttribute("user", user);
		session.setAttribute("ownMoney",0);
		session.removeAttribute("ownList");
		out.print(200);
	}
	
	@RequestMapping("findUser")
	public void findUser(String userID,HttpServletRequest request,HttpServletResponse response) throws IOException{
		User fUser=userService.findByID(userID);
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		System.out.println("userID:"+fUser.getUserId());
		session.setAttribute("fUser", fUser);
		out.print(200);
	}
	
	@RequestMapping("addUser")
	public void addUser(String userID,String userName,String password,String sex,String Email,String identity,HttpServletResponse response,HttpServletRequest request) throws IOException{
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		
		int a= userService.findUserByID(userID);
		
		if(a>0){
			out.print("500");
		}else{
			User user=new User(userID,userName,password,sex,Email,identity);
			boolean value=userService.addUser(user);
			if(value==true)
				out.print(200);
		}
	}
	
	@RequestMapping("updateUser")
	public void updateUser(String userID,String userName,String password,String sex,String Email,String identity,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		System.out.println(userID+userName+password+sex+Email+identity);
		User user=new User(userID,userName,password,sex,Email,identity);
		boolean value=userService.updateUser(user);
		if(value==true)
			out.print(200);
	}
	
	@RequestMapping("deleUser")
	public void deleUser(String userID,HttpServletResponse response,HttpServletRequest request) throws IOException{
		
		boolean value=userService.deleUser(userID);
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		session.removeAttribute("fUser");
		if(value==true)
			out.print(200);
		
	}
}
