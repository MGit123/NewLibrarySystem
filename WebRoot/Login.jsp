<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	 <link rel="stylesheet" type="text/css" href="css/leftLogin.css">
     <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
     <script type="text/javascript">
     
     function checkLogin(){
     
       var userID=$("#userID").val();
       var pass=$("#pass").val();
       var identity=$("#identity").val();
       if(userID==""){
          alert("您还未输入账号")
       }
       else if(pass==""){
         alert("您还未输入密码")
       }
       else{
         $.ajax({
	    	url:"checkLogin",
	    	type:"post",
	    	 contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	cache : true,
		    async : true,
	    	data:{"userID":userID,
	    	      "password":pass,
	    	      "identity":identity
	    	      },
	    	success:function(data){
	    		if(data=="1"){
	    			window.location.href="index";
	    		}else if(data==2){
	    			alert("用户身份错误!");
	    		}else{
	    		 alert("用户名或密码错误!");
	    		}
	    	}
	    })       
       }
     }
     </script>
  </head>
  
  <body>
    <div id="bg">
       
         <ul>
         <li style="text-align:center;font-size:24px; ">用户登录</li>
         
        <li>
        <img src="images/yonghu.png" alt=" User icon" class="icon">
        <input type="text" name="userID"  id="userID" class="te" placeholder="请输入用户名"> </input>
        </li>
        
        <li>
       <img src="images/mi.png" alt="Mima icon" class="icon">
       <input type="password" name="pass" id="pass"  class="te" placeholder="请输入用户密码"> </input>
       </li>
       
       <li>
       <img src="images/shenfen.png" alt="Key icon" class="icon">
       <select class="ic" id="identity">
       <option value="学生">学生</option>
       <option value="管理员">管理员</option>
       </select>
       </li>
         
       <li>
       <input  type="submit"  value="登录" class="lo" onclick="checkLogin()"></input>
       </li>  
      </ul>
    
    </div>
  </body>
</html>
