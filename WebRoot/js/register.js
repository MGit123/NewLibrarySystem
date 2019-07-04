/**
 * 
 */
s = new Array("Sno", "User", "Pass", "PassTwo");

function SnoCheck()
{
	var Sno = document.getElementById("Sno");
	if(Sno.value.length<=3) document.getElementById("1").innerHTML="学号长度错误";
	else document.getElementById("1").innerHTML="";
}

function UserCheck()
{
	var User = document.getElementById("User");
	if(User.value.length <5) document.getElementById("2").innerHTML="账号长度错误";
	else document.getElementById("2").innerHTML="";
}

function PassCheck()
{
	var Pass = document.getElementById("Pass");
	if(Pass.value.length <5) document.getElementById("3").innerHTML="密码长度错误";
	else document.getElementById("3").innerHTML="";
}

function PassTwoCheck()
{
	var PassTwo = document.getElementById("PassTwo");
	if(PassTwo.value != Pass.value) document.getElementById("4").innerHTML="两次输入密码不一致";
	else document.getElementById("4").innerHTML="";
}

function SubmitCheck()
{
	var f = true;
	for(i = 0; i < 4; ++i)
		if(document.getElementById(s[i]).value == "")
		{
			f = false;
			break;
		}
	
	if(f) {
		document.getElementById("submit").disabled = false;
		document.getElementById("submit").style.background = "red";
	}
	setTimeout("SubmitCheck()", 1000);
}