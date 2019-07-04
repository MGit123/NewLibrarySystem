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
    
    <title>My JSP 'PersonAction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/PersonAction.css">
	
  
    
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
     <script type="text/javascript" src="js/PersonAction.js"></script>
    <script type="text/javascript">
     
    
    function UpdateCode(){
     var newpass=$("#newpass").val();
      if($("#user").val()==""||$("#oldpass").val()==""||$("#newpass").val()==""){
      alert("请把信息填写完整!")
     }else if($("#user").val()!=${user.password}){
        alert("原密码输入错误!");
       }else if($("#oldpass").val()==$("#newpass").val()){
       
           $.ajax({
	    	url:"updateCode",
	    	type:"post",
	    	 contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	cache : true,
		    async : true,
	    	data:{"newpass":newpass
	    	      },
	    	success:function(data){
	    		if(data=="200"){
	    		   alert("密码修改成功!");
	    			window.location.href="Manage"
	    		}else{
	    			alert("网络异常!");
	    		}
	    	}
	    });       
         
       }else{
         alert("新密码输入不一致");
       }

    }
   
    </script>
    
    
    
  </head>
  
  <body onload="show()">
   <a href="Manage" target="iframe_a">返回</a>
   <div id="a">
    <p class="u">用户:<span >${user.userName}</span></p>
    <p class="u">已借:<span >${user.borrowed}本</span></p>
    <p class="u">可借:<span>${user.allowLend }本</span></p> 
    <p class="u">欠费:<span>${user.ownMoney}元</span></p>
    <p class="u">邮箱:<span >${user.email}</span></p>      
   </div>
   
   <div id="b" class="list">
    <ul>
    <li style="font-size:18px;font-weight:bold;">系统信息</li>
    <hr></hr>
    <c:if test="${AnoList!=null}">
   <c:forEach items="${AnoList}" var="Ano">
    <li class="info">
     <span>管理员${Ano.receiveId}:</span><br>
    <span style="margin-left:25px;margin-top:5px">${Ano.text}</span>
    <p style="margin-left:250px;">发送者：${Ano.sendId}
    <p style="margin-left:250px;">日期：${Ano.releaseDate}
    <div id="cir"></div>
    </li>
     </c:forEach>
     </c:if>
    </ul>
   </div>
   
   <div id="c">

    <br style="float:left;font-size:10px;">请填写以下信息</br>
    <hr style="width:300px; margin-left:-20px"></hr>
    <li class="lc">
    <img src="images/yonghu.png" alt=" User icon" class="icon">
    <input type="text" name="user" class="te" id="user" placeholder="请输入原密码"> </input>
    </li >
    <li class="lc">
    <img src="images/mima.png" alt="Mima icon" class="icon">
    <input type="password" name="oldpass" class="te" id="oldpass" placeholder="请输入新密码"> </input>
    </li>
    <li class="lc">
    <img src="images/yanzhengma.png" alt="Mima icon" class="icon">
    <input type="password" name="newpass" id="newpass" class="te" placeholder="再次确认密码"> </input>
    </li>
    
    
       <li class="lc">
       <input  type="submit"  value="提交" class="lo" onclick="UpdateCode()"></input>
       </li>
  
   </div>
   
    
   
   <div id="d" class="list">
   <ul>
   <li style="font-size:18px;font-weight:bold;">超期书籍</li>
   <hr>
   <c:if test="${ownList!=null}">
   <c:forEach items="${ownList}" var="list">
    <li class="info">
   <span style="font-size:21px; margin-left:10px;">《${list.bookName }》</span> 
    <span style="color:red; float:right;margin-right:80px;margin-top:20px;">已超期</span>
   <br><span style="color:gray;font-size:12px;margin-left:20px;">作者:${list.author }</span>
    <br> <span style="margin-left:80px; margin-top:10px">归还日期:${list.returnDate}</span>
   <div id="ci"></div>
   </li>
   </c:forEach>
   </c:if>
   
   <input  type="submit"  value="缴费" onclick="pay()"></input>
   </ul>
   </div>
   
  </body>
</html>
