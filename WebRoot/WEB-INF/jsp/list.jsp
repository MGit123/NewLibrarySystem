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
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/list.css">
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    
    <script type="text/javascript">
      function checkInfo(){
      $(document).ready(function () {  
             $("#book").on("click","tr",function(){
                var td= $(this).find("td");
                var num= td.eq(0).text();
                window.location.href="show?txt="+num;
            });  
        });  
        }
        
       function bro(){
         var k=window.confirm("确认要借阅该书吗？");
         if(k){
         $(document).ready(function(){
         $("#book").on("click","tr",function() {
		 var td= $(this).find("td");
		 var bookName= td.eq(1).text();
		 var bookNum = td.eq(0).text();
		 var author=td.eq(2).text();
		 var remainNum=td.eq(4).text();
		
		   data={
		   "bookNum":bookNum,
		   "bookName":bookName,
		   "author":author
		   }
		
		   if(${user.ownMoney}!="0"){
		    alert("您已欠费，请先缴清费用!");
		    window.location.href="Manage"
		   }else{
		   if(remainNum>0){
		    $.ajax({
           type : "post",
		  url : "Check",
		  timeout:50000,
          contentType:"application/x-www-form-urlencoded; charset=utf-8",
		  data : data,
		  cache : true,
		  async : true,
        success:function(data){
           if(data==200){
           alert("图书借阅成功!");
             window.location.href="bookInfo";
           }
           else{
              alert("您已借阅过该书!");
             window.location.href="bookInfo";
           }
         }
       });
		  }
		   else{
		  alert("图书馆中该书已被借阅完!")
		  }
		  } 
	       });
          });
       return true;
       }else{
     return false;
    }
  }
    </script>
    
  </head>
  
  <body>
   <h2 >图书信息</h2>
    <div id="bl" style="margin-top: 15px;">
     
     <table class="sou">
     <tr>
     <form action="List" method="post">
     <th>图书序号:</th><th><input type="text" name="bookNum" placeholder="请输入图书序号" ></input></th>
     <th>作者:</th><th><input type="text" name="author" placeholder="请输入作者" ></input></th>
     <th>图书类型:</th><th><input type="text" name="bookType" placeholder="请输入图书类型"></input></th>
     <th>
     <input type="submit" value="条件搜索" >
     </th>
     </form>
     
     <form action="List" method="post">
     <th> 
     <input type="submit" value="搜索" >
     </th> 
     </form>
     </tr>
     </table>
   
       
     <table class="tab" style="margin-top:20px;">
     <tr>
     <th>图书序号</th>
     <th>书名</th>
     <th>作者</th>
     <th>图书类型</th>
     <th>库存量</th>
      <th>操作</th>
     </tr>
    </table>
    
  <table class="tab" id="book">
  <c:if test="${bookList!=null}">
   <c:forEach items="${bookList}" var="b">
   <tr>
   <td >${b.bookNum}</td>
   <td >${b.bookName}</td>
   <td >${b.author }</td>
   <td >${b.bookType }</td>
   <td >${b.remainNum }</td>
   <td><a style="margin-right:10px;cursor: pointer;" target="iframe_a" onclick="checkInfo();">查看</a>
   <a style="cursor:pointer;" target="iframe_a" onclick="return bro()">借阅</a>
   </td>
   </tr>
  </c:forEach>
  </c:if>
 </table>
   
 
  <p>
  <c:if test="${pageNum>1 }">
  <a href="List?page=1" >首页</a>
  <a href="List?page=${pageNum-1 }">上一页</a>
  </c:if>
  
  <c:if test="${pageNum <recordCount }">
  <a href="List?page=${pageNum+1 }">下一页</a>
  <a href="List?page=${recordCount }">末页</a>
  </c:if>
  
   <form action="List" method="post">
   <h4 align="center">共${recordCount}页  
   <input type="text" value="${pageNum}" name="page" size="1">页
   <input type="submit" value="到达">
   </h4>
   </form>
   </div>
  </body>
</html>
