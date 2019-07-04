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
    
    <title>My JSP 'AdminAction2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	
	#a{
	position:absolute;
    top:10%;
    left:20%;
    height:320px;
    width:600px;
    list-style:none;
    font-size:14px;
	}
	
	#b{
	position:absolute;
    top:10%;
    left:20%;
    height:320px;
    width:600px;
    list-style:none;
    display:none;
    font-size:14px;
	}
	
	#bID{
	margin:5px;
	width:180px;
	height:25px;
	}
    .in{
        color: #ccc;
        width: 200px;
        height: 25px;
        font-size: 14px;
        margin-bottom:10px;
    }

  
    th{
    margin-right:20px;
 
    }
   
   td{
    margin-bottom:10px;
   width:100px;
   text-align:center;
   
   }
   
   .ic{
    color: #ccc;
    width:95px;
	height:30px;
	margin-right:10px;
	float:left;
   }
   
   .x{
   
   height:100px;
   width:500px;
   }
  
  
	</style>
	
	 <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
	
	 function show(){
    var loc=location.href;
     var n1=loc.length;//地址的总长度
     var n2=loc.indexOf("=");//取得=号的位置
     var choice=loc.substr(n2+1, n1-n2);//从=号后面的内容

     if(choice==2){
          $("#a").hide();  //显示
         $("#b").css('display','block');  //显示
     } 
   }
	
	   function Edit(){
	   $("#a").hide();
	   $("#b").css('display','block');
	   }
  
    function addBook(){
      var bookName=$("#bname").val();
      var author=$("#author").val();
      var bookType=$("#type").val();
      var remainNum=$("#rnum").val();
      var price=$("#price").val();
      var publisher=$("#publisher").val();
      var bookContent=$("#textContent").val();
      if(bookName==""||author==""||bookType==""||remainNum==""){
      alert("请填写完必要信息!")
      }else{
       var k=window.confirm("确认要添加该图书吗？");
         if(k){
       $("#add").css('background','#e4644b');
        $.ajax({
	    	url:"addBook",
	    	type:"post",
	    	 contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	cache : true,
		    async : true,
	    	data:{
             "bookName":bookName,
             "author":author,
             "bookType":bookType,
             "remainNum":remainNum,
             "price":price,
             "publisher":publisher,
             "bookContent":bookContent
	    	      },
	    	success:function(data){
	    		if(data=="200"){
	    		   alert("图书入库成功!");
	    	}
	    	}
	    }); 
	    return true}
	    else{} 
	    return false;
	    }     
      }
	
	function findBook(){
    var bookNum=$("#bID").val();
    var a=2;
    if(bookNum==""){
    alert("请先输入图书序号!")
    }else{
      $.ajax({
	    	url:"findBook",
	    	type:"post",
	    	data:{
	    	"bookNum":bookNum
	    	},
	    	contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	cache : true,
		    async : true,
		    success:function(data){
		        if(data=="200"){
	    		     window.location.href="AdminAction2?txt="+a;
	    		}
		    }
	    });       
    
    }
   }
	
	function updateBook(){
      var bookName=$("#bname1").val();
      var author=$("#author1").val();
      var bookType=$("#type1").val();
      var remainNum=$("#rnum1").val();
      var price=$("#price1").val();
      var publisher=$("#publisher1").val();
      var bookContent=$("#textContent1").val();
      if(bookName==""||author==""||bookType==""||remainNum==""){
      alert("请填写完必要信息!")
      }else{
       var k=window.confirm("确认要修改该图书吗？");
         if(k){
       $("#add1").css('background','#e4644b');
        alert("图书信息修改成功!");
        $.ajax({
	    	url:"updateBook",
	    	type:"post",
	    	 contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	cache : true,
		    async : true,
	    	data:{
             "bookName":bookName,
             "author":author,
             "bookType":bookType,
             "remainNum":remainNum,
             "price":price,
             "publisher":publisher,
             "bookContent":bookContent
	    	      },
	    	success:function(data){
	    		if(data=="200"){
	    		   alert("图书信息修改成功!");
	    	}
	    	error:{
	    	 alert("图书信息修改成功!");
	    	}
	    	}
	    }); 
	    return true}
	    else{} 
	    return false;
	    }     
      }
	</script>
	
   <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
  </head>
  
  <body onload="show()">
     <a href="Manage" target="iframe_a">返回</a>
    <div id="a">
       <br style="float:left;font-size:10px;">请填写以下信息</br>
      <hr style="width:600px; margin-left:5px"></hr>
      
      <table class="t1">
       <tr >
      <td>书名: </td>
      <th ><input  placeholder="必填" id="bname"  type="text" class="in" name="Sno" /> </th>
      
      <td>作者: </td>
      <th >
      <input  placeholder="必填" id="author"  type="text" class="in" name="Sno" /> </th>
      </tr>
      
      <tr>
     <td>图书类型: </td>
      <th ><input  placeholder="必填" id="type"  type="text" class="in" name="Sno" /> </th>
      
      <td >库存: </td>
      <th><input  placeholder="必填" id="rnum"  type="text" class="in" name="Sno" />  </th>
      </tr>
      
      <tr>
      <td >价格: </td>
      <th ><input  id="price"  type="text" class="in" name="Sno" /> </th>
    
      <td>出版社: </td>
      <th ><input id="publisher"  type="text" class="in" name="Sno" />  </th>
      </tr> 
      
      <tr class="x">
      <td>书籍简介:</td>
      <th  sytle="width:300px;height:70px;">
        <textarea name="content" rows="5" cols="26"  id="textContent"></textarea>
      </th>
      </tr>
      </table>
    
       <tr>
       <th><input type="button" value="添加"  id="add" style="width:100px;height:30px;" onclick="addBook()"/></th>
        <th><input type="button" value="编辑"  id="add" style="width:100px;height:30px;" onclick="Edit()"/></th>
       </tr>
       </div>
       
       <div id="b">
       
        <th>读者账号:</th><th><input type="text"  id="bID" placeholder="请输入图书序号" ></input></th>
       <th><input type="submit"  value="查询" onclick="findBook()" /></th>
      <hr style="width:600px; margin-left:5px"></hr>
      <table class="t1">
       <tr >
      <td>书名: </td>
      <th ><input   id="bname1" value="${fBook.bookName}" type="text" class="in" name="Sno" /> </th>
      
      <td>作者: </td>
      <th >
      <input id="author1"  type="text" value="${fBook.author}" class="in" name="Sno" /> </th>
      </tr>
      
      <tr>
     <td>图书类型: </td>
      <th ><input   id="type1"  type="text" value="${fBook.bookType}" class="in" name="Sno" /> </th>
      
      <td >库存: </td>
      <th><input   id="rnum1"  type="text" value="${fBook.remainNum}" class="in" name="Sno" />  </th>
      </tr>
      
      <tr>
      <td >价格: </td>
      <th ><input  id="price1" value="${fBook.price}" type="text" class="in" name="Sno" /> </span> </th>
    
      <td>出版社: </td>
      <th ><input id="publisher1" value="${fBook.publisher}" type="text" class="in" name="Sno" /> </span> </th>
      </tr> 
      
      <tr class="x">
      <td>书籍简介:</td>
      <th  sytle="width:300px;height:70px;">
        <textarea name="content" rows="5" cols="26"  id="textContent1">${fBook.bookContent}</textarea>
      </th>
      </tr>
      </table>
    
       <tr>
       <th><input type="button" value="保存修改"  id="add1" style="width:100px;height:30px;" onclick="return updateBook()"/></th>
  
       </tr>
        </div>
  </body>
</html>
