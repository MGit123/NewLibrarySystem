package com.lib.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	public MainController() {
		// TODO Auto-generated constructor stub
	}
    
	@RequestMapping("index")
	public String index(){
		return "index";
	}
	
	@RequestMapping("welcome")
	public String welcome(){
		return "welcome";
	}
	
	@RequestMapping("list")
	public String list(){
		return "list";
	}
	

	@RequestMapping("show")
	public String show(){
		return "show";
	}
	
	@RequestMapping("bookInfo")
	public String bookInfo(){
		return "bookInfo";
	}
	
	@RequestMapping("Manage")
	public String Manage(){
		return "Manage";
	}
	
	@RequestMapping("PersonAction")
	public String PersonAction(){
		return "PersonAction";
	}
	
	@RequestMapping("AdminAction")
	public String AdminAction(){
		return "AdminAction";
	}
	
	@RequestMapping("AdminAction2")
	public String AdminAction2(){
		return "AdminAction2";
	}
	
	@RequestMapping("Editor")
	public String Editor(){
		return "Editor";
	}
}
