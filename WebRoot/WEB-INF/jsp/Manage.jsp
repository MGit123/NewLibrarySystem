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
    
    <title>My JSP 'Manage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/Manage.css">

	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/Manage.js"></script>
    
    <script type="text/javascript">
    
    function change5(){
     $("#a1").click(function(){
         window.location.href = "AdminAction";
         });
    }
    
    function change6(){
     $("#b1").click(function(){
         window.location.href = "Editor";
         });
    }
    
     function change7(){
     $("#c1").click(function(){
         window.location.href ="AdminAction2";
         });
    
    }
    </script>
     
       <% String identity=(String)session.getAttribute("identity"); 
     if(identity.equals("管理员")){ %>
      <script type="text/javascript" language="javascript">
      function show(){
      $(".blo").css('display','block');
      }
     </script> 
     <%} %> 
    
   </head>
  
  <body onload="show()">
  <div >
  <ul>
   <li class="block"  id="la">
  <img src="images/gere.png" alt="个人信息" class="ima" id="a" onclick="change1()"><p class="in">个人信息</p>
  </li>
 
  
   <li class="block"  id="la">
  <img src="images/xiaoxi.png" alt="系统公告" class="ima"  id="b" onclick="change2()"><p class="in" onclick="change2();">系统公告</p>
  </li>


  <li class="block"  id="lb">
   <img src="images/mi.png" alt="修改密码" class="ima" id="c" onclick="change3()"><p class="in">修改密码</p>
   </li>
   
   <li class="block"  id="lb">
   <img src="images/jiaofei.png" alt="缴费" class="ima" id="d" onclick="change4()"><p class="in">图书缴费</p>
   </li>
   
    
    <li class="blo"  id="lc">
   <img src="images/tianjia.png" alt="用户管理" class="ima" id="a1" onclick="change5()"><p class="in">用户管理</p>
   </li>
   
    <li class="blo"  id="lc">
   <img src="images/fb.png" alt="发布公告" class="ima" id="b1" onclick="change6()"><p class="in">发布公告</p>
   </li>
   
   <li class="blo"  id="lc">
   <img src="images/tushuguan.png" alt="图书管理" class="ima" id="c1" onclick="change7()"><p class="in">图书管理</p>
   </li>
  </ul>
 
   </div>
  </body>
</html>
