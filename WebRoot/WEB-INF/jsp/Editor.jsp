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
    
    <title>My JSP 'Editor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
  
  <script type="text/javascript">
    function announce(){
      var info=CKEDITOR.instances.content.document.getBody().getText();
      var title=$("#title").val();
      var receId=$("#receId").val();
        var k=window.confirm("确认要添加该图书吗？");
         if(k){
       $.ajax({
	    	url:"addAnnounce",
	    	type:"post",
	    	 contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	cache : true,
		    async : true,
	    	data:{
	    	"title":title,
	    	"receId":receId,
	    	"text":info,
	    	      },
	    	success:function(data){
	    		if(data=="200"){
	    		   alert("公告发布成功!");
	    			window.location.href="Manage";
	    		}else{
	    			alert("网络异常!");
	    		}
	    	}
	    });       
  return true;
  }else{
  return false;
  }
   }
  </script>

  <style type="text/css">
  span{
  margin-right:10px;
  }
  
  .in{
  width:180px;
  height:27px;
  }
  
  </style>

  </head>
  
  <body>
    <a href="Manage" target="iframe_a">返回</a>
  
   <div id="b">
    <span style="margin-left:450px;font-size:18px;">发布公告</span><p>
    <div style="margin-bottom:10px;">
    <span>标题:</span><span><input  id="title" type="text"  class="in"   placeholder="请输入标题" name="LoginPass" /></span>
    <span>收件人账号:</span><span><input  id="receId" type="text"  class="in"  placeholder="请输入账号" name="LoginPass" /></span>
    </div>
    <textarea name="content" id="content"> Hello!${user.userName }，请输入...</textarea>
     <script type="text/javascript">
      CKEDITOR.replace('content');
     </script>
      <input  type="submit" style="margin-top:10px;" value="发布" onclick="return announce()"></input>
    </div>
  </body>
</html>
