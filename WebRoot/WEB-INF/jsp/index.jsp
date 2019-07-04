<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	
	<link rel="stylesheet" type="text/css" href="css/main.css">   <!-- 框架主体css -->
	<link rel="stylesheet" type="text/css" href="css/head.css">
	<link rel="stylesheet" type="text/css" href="css/leftStu.css">
    <link rel="stylesheet" href="css/menu.css" media="screen" type="text/css" />
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    
     <% 
    String identity=(String)session.getAttribute("identity");
    String a="";
    String b="";
    if(identity.equals("管理员")){
     a="管理员";
    }else{
      b="同学!";
    }
     %>  
  </head>
  
  <body>
    <div id="container">
    <!-- 头部 -->
  <div id="header">
 <div id="h">
  <h1 class="biao">图书管理系统</h1>
   <p class="huan">欢迎进入图书管理系统</p>
   </div>
   <div id="tx">
  <img src="images/tx.png" alt="TouXian icon" class="icon">
   <p class="p">HELLO,<%=a %>${user.userName}<%=b %></p>
   </div>
   </div>
   
   <!-- 左部 -->
   <div id="left">
   <div id="menu">
     <ul>
            <li class="active"><i class="fa fa-home fa-lg"></i> <a href="welcome" target="iframe_a">首页</a></li>
            <li><i class="fa fa-envelope fa-lg"></i><a href="list" target="iframe_a">图书信息</a></li>
            <li><i class="fa fa-user fa-lg"></i><a href="bookInfo" target="iframe_a" >借阅信息</a></li>
            <li><i class="fa fa-cogs fa-lg"></i><a href="Manage" target="iframe_a" >管理</a></li>
            <li><i class="fa fa-power-off fa-lg"></i><a href="Quit">退出</a></li>
        </ul>
    </div>
   </div>
      
   <!-- 内容 -->
    <div id="content">
        <iframe src="welcome" name="iframe_a" height="100%" width="98%" position="absolute" left="10px" frameborder="0" scrolling="no"></iframe>
  </div>
  
  <!-- 页脚-->
  <div id="footer">
   </div>
   
   </div>
  </body>
</html>
