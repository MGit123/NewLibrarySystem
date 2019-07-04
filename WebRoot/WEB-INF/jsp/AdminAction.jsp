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
    
    <title>My JSP 'AdminAction.jsp' starting page</title>
    
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
    left:30%;
    height:320px;
    width:320px;
    list-style:none;
    font-size:14px;
	}
	
	#b{
	position:absolute;
    top:10%;
    left:30%;
    height:320px;
    width:500px;
    list-style:none;
    display:none;
   font-size:16px;
     overflow:scroll;
	}
	
	.c{
	 width: 320px;
     height: 30px;
	}
	
	#uID{
	
	width:180px;
	height:25px;
	margin:5px;
	}
	
    .in{
        color: #ccc;
        width: 200px;
        height: 30px;
        font-size: 14px;
    }
    
    
   
   .ic{
    color: #ccc;
    width:95px;
	height:30px;
	margin-right:10px;
	float:left;
   }
   
   
   .tishi{
   width:100px;
   height:30px;
   }
   
   
   
   td{
   width:140px;
   text-align:center;
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
        $("#a").hide();  //隐藏
         $("#b").css('display','block');  //显示
     } 
   }
   
     function editor(){
	   $("#a").hide();
	   $("#b").css('display','block');
	     $("#submit2").css('background','#e4644b');
	   }
   
   function NaCheck(){
     var Sa=$("#SId").val();
     if(Sa=="")
     {
       $("#ac").html("账号不能为空");
     }
     else if(Sa.length<6){
     $("#ac").html("长度小于6");
     }else{
     $("#ac").html("");
     }
   }  
  
   function NaCheck(){
     var Sa=$("#Sna").val();
     if(Sa=="")
     {
       $("#1").html("用户名不能为空");
     }else{
     $("#1").html("");
     }
   }  
   
   function PassTwoCheck(){
   var pa=$("#Pass").val();
   var pass=$("#PassTwo").val();
    if(pass==""){
    $("#2").html("密码不能为空");
    }
     else if(pa!=pass){
     $("#2").html("密码不一致");
     }else{
     $("#2").html("");
     }
   }
   
   function EmailCheck(){
      var email=$("#Email").val();
      var isEmail =  /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
      if(email==""){
      $("#3").html("邮箱不能为空");
      }
      else if(!(isEmail.test(email))){
       $("#3").html("邮箱格式不正确");
      }else{
       $("#3").html("");
      }
   }
    
    function addUser(){
       var id=$("#SId").val();
       var pa=$("#Pass").val();
       var Sa=$("#Sna").val();
        var email=$("#Email").val();
        if(id==""||pa==""||Sa==""||email==""){
        alert(" 信息填写不完全!")
        }
        else{
         var k=window.confirm("确认要添加该用户吗？");
         if(k){
       $("#submit1").css('background','#e4644b');
        var userID=$("#SId").val();
        var userName=$("#Sna").val();
        var password=$("#Pass").val();
        var Email=$("#Email").val();
        var sex=$("#sex").val();
        var identity=$("#identity").val();
         $.ajax({
	    	url:"addUser",
	    	type:"post",
	    	 contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	cache : true,
		    async : true,
	    	data:{
	    	"userID":userID,
	    	"userName":userName,
	    	"password":password,
	    	"sex":sex,
	    	"Email":Email,
	    	"identity":identity,
	    	      },
	    	success:function(data){
	    		if(data=="200"){
	    		   alert("用户添加成功!");
	    		     window.location.href="Manage";
	    		}else{
	    			alert("该用户已存在!");
	    		}
	    	}
	    }); 
	    return true;
	    }else{
	    return false;
	    }      
      }
    }
   
   function findUser(){
    var userID=$("#uID").val();
    var a=2;
    if(userID==""){
    alert("请先输入读者账号!")
    }else{
      $.ajax({
	    	url:"findUser",
	    	type:"post",
	    	data:{
	    	"userID":userID
	    	},
	    	contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	cache : true,
		    async : true,
		    success:function(data){
		        if(data=="200"){
	    		     window.location.href="AdminAction?txt="+a;
	    		}
		    }
	    });       
    
    }
   }
   
   
   function saveChange(){
     var k=window.confirm("确认要修改该用户吗？");
         if(k){
          alert("读者信息修改成功!");
      $("#submit").css('background','#e4644b');
     
        var userID=$("#SId1").val();
        var userName=$("#Sna1").val();
        var password=$("#Pass1").val();
        var Email=$("#Email1").val();
        var sex=$("#sex1").val();
        var identity=$("#identity1").val();
         $.ajax({
	    	url:"updateUser",
	    	type:"post",
	    	 contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	cache : true,
		    async : true,
	    	data:{
	    	"userID":userID,
	    	"userName":userName,
	    	"password":password,
	    	"sex":sex,
	    	"Email":Email,
	    	"identity":identity,
	    	      },
	    	success:function(data){
	    		if(data=="200"){
	    		   alert("读者信息修改成功!");
	    		   window.location.href="Manage";
	    		}else{
	    		  alert("读者信息修改成功!");
	    		}
	    	}
	    });   
	    return true;}
	    else{
	    return false;
	    }    
      
   }
   
   function deleUser(){
    var userID=$("#SId1").val();
      var k=window.confirm("确认要删除该用户吗？");
         if(k){
    $("#submit").css('background','#e4644b');
     $.ajax({
	    	url:"deleUser",
	    	type:"post",
	    	data:{
	    	"userID":userID
	    	},
	    	contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	cache : true,
		    async : true,
		    success:function(data){
	    		 alert("该读者已注销!");
	    	 window.location.href="Manage";
		    }
	    }); 
	    return true;
	    }else{
	    return false;
	    }      
   }
   
   

   
  </script>
  
  </head>
  
  <body onload="show()">
   <a href="Manage" target="iframe_a">返回</a>
   
   <div id="a">
    <br style="float:left;font-size:10px;">请填写以下信息</br>
    <hr style="width:400px; margin-left:5px"></hr>
    
    <table>
     <tr >
    <th >读者账号: </th>
    <th class="c"><input onmouseout = "IdCheck()" placeholder="必填"  id="SId"  type="text" class="in" name="Sno" /> <span id="ac"  class="tishi"></span> </th>
    </tr>
    
    <tr >
    <th >读者姓名: </th>
    <th class="c"><input onmouseout = "NaCheck()" placeholder="必填" id="Sna"  type="text" class="in" name="Sno" /> <span id="1"  class="tishi"></span> </th>
    </tr>
    
     <tr>
     <th>读者密码:</th>
     <th> <input  id="Pass" type="password"  class="in" name="LoginPass" /></th>
     </tr>
       
    <tr>
    <th>读者密码:</th> 
    <th><input onmouseout = "PassTwoCheck()" placeholder="必填" id = "PassTwo" type="password"  class="in" name="PassTwo"  /><span id="2"  class="tishi"></span> </th>
    </tr>
    
     <tr>
       <th>用户性别:</th>
       <th> 
       <select class="in" id="sex">
       <option value="男">男</option>
       <option value="女">女</option>
       </select></th>
       </tr>
    
     <tr>
      <th>用户邮箱:</th>
      <th> <input onmouseout = "EmailCheck()" placeholder="必填" id="Email" type="text"  class="in" name="LoginUser" /><span id="3"  class="tishi"></span> </th> 
      </tr>
    
       <tr>
       <th>用户身份:</th>
       <th> 
       <select class="in" id="identity">
       <option value="学生">学生</option>
       <option value="管理员">管理员</option>
       </select></th>
       </tr>
        
    <tr>
    <td>
    <input id = "submit1"  style="width:100px;color:#fff;background: #999;" onclick="return addUser()" type="submit" value="立即注册"/>
    </td>
    <td><input id = "submit2"  style="width:100px;color:#fff;background: #999;" onclick="editor()" type="submit" value="编辑"/></td>
    </tr>
    </table>
   </div>
      
     <div id="b">
     <th>读者账号:</th><th><input type="text"  id="uID" placeholder="请输入读者账号" ></input></th>
     <th><input type="submit"  value="查询" onclick="findUser()" /></th>
     <hr style="width:400px; margin-left:5px"></hr>
     
     <table>
     <tr >
    <td>读者账号: </td>
    <th class="c"><input id="SId1" value="${fUser.userId}" type="text" class="in" name="Sno" /> <span id="ac"  class="tishi"></span> </th>
    </tr>
    
    <tr >
    <td>读者姓名: </td>
    <th class="c"><input   id="Sna1" value="${fUser.userName}" type="text" class="in" name="Sno" /> <span id="1"  class="tishi"></span> </th>
    </tr>
    
     <tr>
     <td>读者密码:</td>
     <th> <input  id="Pass1" type="password1" value="${fUser.password}" class="in" name="LoginPass" /></th>
     </tr>
       
   
     <tr>
       <td>用户性别:</td>
       <th> 
       <select class="in" value="${fUser.sex}"  id="sex1">
       <option value="男">男</option>
       <option value="女">女</option>
       </select></th>
       </tr>
    
     <tr>
      <td>用户邮箱:</td>
      <th> <input  placeholder="必填" id="Email1" value="${fUser.email}" type="text" value="" class="in" name="LoginUser" /><span id="3"  class="tishi"></span> </th> 
      </tr>
    
       <tr>
       <td>用户身份:</td>
       <th> 
       <select class="in" value="${fUser.identity}"  id="identity1">
       <option value="student">学生</option>
       <option value="admin">管理员</option>
       </select></th>
       </tr>
       </table>
     
     <tr>
    <td>
    <input id = "submit3"  style="width:100px;color:#fff;background: #999;"  onclick="return saveChange()" type="submit" value="保存修改"/>
    </td>
    <td><input id = "submit4"  style="width:100px;color:#fff;background: #999;" onclick="return deleUser()" type="submit" value="注销账户"/></td>
    </tr>
     
     </div>
  
    
  </body>
</html>
