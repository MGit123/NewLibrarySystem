  
   
   function re($this){
    var k=window.confirm("确认要归还该书吗？");
    var data="";
    var userID="";
    var bookName="";
       if(k){
         $(document).ready(function(){
         $(".info").on("click","tr",function() {
         $($this).parent().parent().remove();
         var td= $(this).find("td");
		 userID= td.eq(2).text();
		 bookName= td.eq(1).text();
		 data={
		   "userID":userID,
		   "bookName":bookName
		 }
	$.ajax({
        type : "post",
		url : "DeleBook",
		timeout:50000,
        contentType:"application/x-www-form-urlencoded; charset=utf-8",
		data : data,
		cache : true,
		async : true,
		success: function (data ,textStatus, jqXHR){
	        	if(data== 200){
	        	alert("图书归还成功!");
	        	    }
	        	}
	        });
         });
         
    });
       return true;
   }
   else{
       return false;
       }
   }
  

   function broAg(){
       var k=window.confirm("您要续借该书吗？");
       if(k){
         $(document).ready(function(){
         $(".info").on("click","tr",function() {
         var td= $(this).find("td");
       //  $(this).find("td").eq(5).html("2019-7-29");
		 var userID= td.eq(1).text();
		var bookName= td.eq(2).text();
		 data={
		   "userID":userID,
		   "bookName":bookName
		 }
		 $.ajax({
        type : "post",
		url : "BrowAgain",
		timeout:50000,
        contentType:"application/x-www-form-urlencoded; charset=utf-8",
		data : data,
		cache : true,
		async : true,
		success: function (data ,textStatus, jqXHR){
	        	if(data== 200){
	        	 alert("续借成功!");
	        	    }
	        	}
	        });
      });
  });
       return true;}
       else{
       return false;
       }
    }
   