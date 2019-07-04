/**
 * 
 */

  function show(){
     var loc=location.href;
     var n1=loc.length;//地址的总长度
     var n2=loc.indexOf("=");//取得=号的位置
     var choice=loc.substr(n2+1, n1-n2);//从=号后面的内容

     if(choice==1){
        $("#a").css('display','block');  //显示
     } 
     if(choice==2){
        $("#b").css('display','block'); //显示
        
        $.ajax({
	    	url:"getAnnounce",
	    	type:"post",
	    	 contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	cache : true,
		    async : true
	    });       
     } 
     if(choice==3){
       $("#c").css('display','block'); //显示
     }
     if(choice==4){
        $("#d").css('display','block'); //显示
     }
    }
  
  
  function pay(){
      $.ajax({
      type : "post",
		url : "RefundMoney",
      contentType:"application/x-www-form-urlencoded; charset=utf-8",
		cache : true,
		async : true,
		success: function (data ,textStatus, jqXHR){
	        	if(data== 200){
	        	 alert("您已缴清欠费!");
                window.location.href="Manage";
	        	    }
	        	},
	    error:function(){
         alert("您的余额不足");
     }
	        });
}

 