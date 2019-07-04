package com.lib.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lib.entity.Book;
import com.lib.entity.BorrowBook;
import com.lib.entity.User;
import com.lib.service.BookService;
import com.lib.service.BorrowBookService;
import com.lib.util.timeChange;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonBeanProcessor;
import net.sf.json.util.CycleDetectionStrategy;


@Controller
public class BookController {
    
	@Autowired        //注入BookService
	private BookService bookService;
	
	@Autowired        //注入BorrowBookService
	private BorrowBookService borrowBookService;
	 
	public BookController() {
		// TODO Auto-generated constructor stub
	}
    
	@RequestMapping("/List")
	public String List(String bookNum,String author,String bookType,String page,HttpServletRequest request){
	 int pageNum = 1;
	 int recordCount=1;   //总页数
	 int selectType=1;    //搜索类型
	 if(page!= null && page!=""){
			pageNum=Integer.parseInt(page);
		}
	 
	 System.out.println("bookNum:"+bookNum+"  author:"+author+"  bookType:"+bookType);
	 
	 java.util.List<Book> bookList=bookService.ListBook(pageNum);
	 
	 if(bookNum==null&&author==null&&bookType==null){        //全局搜索
        bookList=bookService.ListBook(pageNum);
        recordCount=bookService.getPage();
		request.setAttribute("recordCount", recordCount);
	 }
	 
	 if(bookNum!=""&&bookNum!=null){                      //通过书号搜索
		 bookList=bookService.ListBook(pageNum,selectType,bookNum);
	     recordCount=bookService.getPage(selectType,bookNum);
	     request.setAttribute("recordCount", recordCount);
	 }
	 
	 if(author!=""&&author!=null){                        //通过作者搜索
		 selectType=2;
		 bookList=bookService.ListBook(pageNum,selectType,author);
	     recordCount=bookService.getPage(selectType,author);
	     request.setAttribute("recordCount", recordCount);
	 }
	 
	 if(bookType!=""&&bookType!=null){                    //通过书籍类型搜索
		 selectType=3;
		 bookList=bookService.ListBook(pageNum,selectType,bookType);
	     recordCount=bookService.getPage(selectType,bookType);
	     request.setAttribute("recordCount", recordCount);
	 }
	 
	System.out.println("一共有"+bookList.size()+"种书!");
	HttpSession session=request.getSession();  
	session.setAttribute("bookList", bookList);
	request.setAttribute("pageNum", pageNum);
     return "list";
	}
	
	@RequestMapping("/BookInfo")
	public void findBookByNum(int bookNum,HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		Book book=bookService.findBookByNum(bookNum);
		System.out.println("bookName:"+book.getBookName());
		session.setAttribute("Book", book);
	}
	
	@RequestMapping("/BKI")
	public void BKI(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String userID=(String) session.getAttribute("userID");
		List<BorrowBook> getBook=borrowBookService.getBorrowBook(userID);
		System.out.println("getBook的长度为:"+getBook.size());
		
		session.setAttribute("getBook", getBook);
		
		JsonConfig jsonConfig=new JsonConfig();    //把Object类型转换为Date类型
		jsonConfig.registerJsonValueProcessor(Date.class, new timeChange());
		

		String json=JSONArray.fromObject(getBook,jsonConfig).toString();
		JSONArray jsonArray = JSONArray.fromObject(getBook,jsonConfig); //转换为json格式
		//System.out.println(jsonArray);
		System.out.println(json);
		
		if(getBook.size()>0){
			out.print(json);
		}
	}
	
	@RequestMapping("/Check")
	public void Check(HttpServletResponse response,HttpServletRequest request,String bookNum,String bookName,String author) throws IOException{
		
		PrintWriter out = response.getWriter();
		 //获取书籍信息
        HttpSession session=request.getSession();
        User u=(User)session.getAttribute("user");
        String userID=u.getUserId();
        String identity=u.getIdentity();
        String userName=u.getUserName();
        System.out.println(author);
      
		int num=borrowBookService.CheckBorrow(userID, bookName);
		
		if(num>=1){
			out.print(500);
		}else{
			//当前时间加一个月
			Calendar cal = new GregorianCalendar();
		    Date date = new Date();
		    cal.setTime(date);
		    if(identity.equals("管理员"))
		    cal.add(Calendar.MONTH, 3);
		    else
		    cal.add(Calendar.MONTH, 1); 
		    
		    //获取bookID
		    String bookID=borrowBookService.getBookId(Integer.valueOf(bookNum));
			System.out.print("bookID:"+bookID);
		    
			BorrowBook book=new BorrowBook(bookID,bookName,userID,userName,author,new java.sql.Date(new java.util.Date().getTime()),new java.sql.Date(cal.getTimeInMillis()));
			
		     boolean value=borrowBookService.borrowBook(book);
		  if(value==true)
			  out.print(200);
		}
	}
	
	@RequestMapping("/DeleBook")
	public void DeleBook(String userID,String bookName,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
	 boolean value=borrowBookService.returnBook(userID, bookName);
	 if(value==true){
		 out.print(200);
	 }
	}
	
	@RequestMapping("/BrowAgain")
	public void BrowAgain(HttpServletResponse response,HttpServletRequest request,String userID,String bookName) throws IOException, ParseException{
		PrintWriter out = response.getWriter();
		 HttpSession session=request.getSession();
		 String identity=(String) session.getAttribute("identity");
		 //获取书籍信息
		BorrowBook b=new BorrowBook();
       
   
        List<BorrowBook> list=(List<BorrowBook>) session.getAttribute("getBook");
        for(int i=0;i<list.size();i++){
        	if(list.get(i).getUserId().equals(userID)&&list.get(i).getBookName().equals(bookName)){
        		b=list.get(i);
        		break;
        	}
        }
      //当前时间加一个月
		Calendar cal = new GregorianCalendar();
	    Date date = new Date();
	    cal.setTime(date);
	    if(identity.equals("管理员"))
		    cal.add(Calendar.MONTH, 3);
		    else
		    cal.add(Calendar.MONTH, 1); 
	   
	    Date da=b.getBorrowDate();
	   b.setBorrowDate(new java.sql.Date(da.getTime()));
	   b.setReturnDate(new java.sql.Date(cal.getTimeInMillis()));
	   boolean value=borrowBookService.borrowAgain(b);
	   if(value==true){
			  out.print(200);
			}
	}
	
	
	@RequestMapping("/addBook")
	public void  addBook(String bookName,String author,String bookType,String remainNum,String price,String publisher,String bookContent,HttpServletResponse response) throws IOException{
		
		PrintWriter out = response.getWriter();
        float a=0;
    
		System.out.println(bookName+author+bookType+remainNum);
		Book book=new Book(bookName,author,bookType,Integer.valueOf(remainNum),a,publisher,"images/b2.jpg",bookContent);
		boolean value=bookService.addBook(book);
		if(value==true){
			out.print(200);
		}	
	}
	
	
	
	@RequestMapping("/updateBook")
	public void updateUser(String bookName,String author,String bookType,String remainNum,String price,String publisher,String bookContent,HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		System.out.println(bookName+author+bookType+remainNum);
		float a=23;
		
		Book book=new Book(bookName,author,bookType,Integer.valueOf(remainNum),a,publisher,"images/b2.jpg",bookContent);
		boolean value=bookService.updateBook(book);
		if(value==true){
			out.print(200);
	}
	}
	
	@RequestMapping("/findBook")
	public void fineBook(String bookNum,HttpServletResponse response,HttpServletRequest request) throws IOException{
		Book fBook=bookService.findBookByNum(Integer.valueOf(bookNum));
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		System.out.println("bookNum:"+fBook.getBookNum());
		session.setAttribute("fBook", fBook);
		out.print(200);
	}
}
