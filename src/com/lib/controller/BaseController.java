package com.lib.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lib.entity.Announce;
import com.lib.entity.User;
import com.lib.service.BorrowBookService;
import com.lib.service.UserService;

@Controller
public class BaseController {

	public BaseController() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired        //注入UserService
	private UserService userService;
	
	@Autowired        //注入BorrowBookService
	private BorrowBookService borrowBookService;
	
	@RequestMapping("/checkLogin")
	public void checkLogin(String userID,String password,String identity,HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		List<User> users = userService.login(userID,password);
		User user=new User();
		System.out.println("user的长度为:"+users.size());
		System.out.println("身份为:"+identity);
		if(users.size()>0){
			user=users.get(0);
			HttpSession session=request.getSession();
			session.setAttribute("user",user);
			session.setAttribute("userID", userID);
		    session.setAttribute("identity",user.getIdentity());
		    borrowBookService.checkOwnMoney(userID, identity, session);
		    
		if(identity.equals(user.getIdentity())){
			out.print("1");}
			else{
				out.print("2");
			}
		} else {
			out.print("0");
		}	
	}
	
	@RequestMapping("getAnnounce")
	public void getAnnounce(HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String userID=(String) session.getAttribute("userID");
		List<Announce> AnoList=userService.getAnnonce(userID);
		
		session.setAttribute("AnoList", AnoList);
	}
	
	@RequestMapping("addAnnounce")
	public void addAnnounce(String title,String receId,String text,HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("text:"+text);
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String sendID=(String)session.getAttribute("userID");
		Announce ano=new Announce(title,sendID,receId,text,new java.sql.Date(new java.util.Date().getTime()));
		boolean value=userService.addAnnounce(ano);
		
		if(value==true){
			out.print(200);	}
			
	}
	
	@RequestMapping("Quit")
	public String Quit(){
		return "redirect:/Login.jsp";
	}

}
