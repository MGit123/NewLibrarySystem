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
    
    <title>My JSP 'bookInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/list.css">
	
	<style type="text/css">    
	#b{
	position:absolute;
    width:100%;
    height:400px;
    float:left;
    left:10%;
    top:8%;
	}
	
	.text{
	width:750px;
	height:60px;
	font-size:16px;
	float:left;
	text-align:left;
	text-indent:2em;
	margin-top:5px; 
	margin-left:20px;
	}
	
 table.info a{
    margin-right:10px;
 }
	</style>
	
   <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
   <script type="text/javascript" src="js/bookInfo.js"></script>
   <script type="text/javascript">
    function load(){
    $(document).ready(function(){
     var $text=$("text");
      $("button").click(function(){
      $text.toggle();
      });
  
    $.ajax({
   url:'BKI',
   type:'Post',
   asynx:'true',
   timeout:50000,
   contentType: "application/x-www-form-urlencoded; charset=utf-8", 
   success:function(data){
   var m="";
   var data=JSON.parse(data); 
   //var data = eval("("+data+")");
            $.each(data, function(i,n) {
                console.log(n);
                m+="<tr>"
                m+="<td>"+n.bookId+"</td>";
                m+="<td>"+n.bookName+"</td>";
                m+="<td>"+n.userId+"</td>";
                m+="<td>"+n.userName+"</td>";
                m+="<td>"+n.borrowDate+"</td>"; 
                m+="<td>"+n.returnDate+"</td>"; 
                m+="<td><a onclick='return broAg()'>续借</a><a onclick='return re(this)'>还书</a></td>";
                m+="</tr>";       
            });
            
            $(".info").append(m);  
   },
   error:function(){
   alert("数据获取失败");
   }
      });
  });
   }
   </script>
   
     <% 
    String identity=(String)session.getAttribute("identity");
    String a="";
    String b="";
    String c="";
    if(identity.equals("管理员")){
     a="40";
     b="三";
     c="0.2";
    }else{
     a="20";
     b="一";
     c="0.5";
    }
     %>  
   
  
  </head>
  
   <body onload="load()">
        <h2 >借阅信息</h2>
     <div id="b" >
       <table class="tab" style="margin-top:10px;">
     <tr>
     <th>书籍编号</th>
     <th>书籍</th>
     <th>借阅者账号</th>
     <th>借阅者</th>
     <th>借书日期</th>
     <th>还书日期</th>
     <th>操作</th>
     </tr>
    </table>
    <table class="info">
  
    </table>
    
     <button style="float:left; margin-top:10px; margin-left:20px;">温馨提示</button><br><br>
     <text class="text" style="display:none">尊敬的用户，欢迎使用图书管理系统。你具有<%=a %>本书的借用权限，时间为<%=b %>个月，过期未归还将收取每天<%=c %>元的费用
     </text>
    </div>
  </body>
</html>
