<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.spring.controller.LoginController" %>
<%
    LoginController controller = new LoginController();
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String user = controller.user2;
    String pass = controller.pass2;
%>
    
    
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<style>
* {
	margin: 0;
	padding: 0;
}
html {
	width: 100%;
	height: 100%;
}
body {
	width: 100%;
	height: 100%;
	font-family: "微软雅黑";
	background-color: #004080;
	background-size:100% ;
}

.footer {
	height: 200px;
	background-color: #004080;
	margin-top: 30px;
	text-align: center;
	color: #FFF;
}
.footer table {
	margin: auto;
}
.footer a {
	color: #fff;
}

.loginbox{
	line-height:35px;	
}
.in1{
	height:40px;
	width:240px;	
}

</style>
</head>

<body>

<br /><br /><br />

<div class="footer">
<h2>登录</h2>

    <td><input type="hidden" value="<%=user%>" name="user" id="user"/></td>
    <td><input type="hidden" value="<%=pass%>" name="pass" id="pass"/></td>
<table width="400" border="0" class="center loginbox">
  <tr>
    <td>User:</td>
    <td><input type="text" id="username" value="" class="in1" required="required"/></td>

  </tr>
  <tr>
    <td>Password:</td>
	<td><input type="password" id="password" value=""  class="in1" required="required"/><br />
<br />
</td>
  </tr>
<tr>
    
	<td><a href="register.jsp">register</a></td>
	
    <td><input type="submit" id="login" value="login" name="type" />&nbsp;&nbsp;<input type="reset" id="reset" value="reset" /></td>
  </tr>
</table>


</div>
</body>
<script>

    
	document.getElementById('login').addEventListener('click',function()
	{
	    var user = document.getElementById("user").value
	    var pass = document.getElementById("pass").value
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		if(username == user && password == pass)
		{
			window.location.href = "loginSuccess.jsp";
		}
		else
	    {
			window.location.href = "loginError.jsp";
		}
	});
	document.getElementById('reset').addEventListener('click',function()
	{
		document.getElementById("username").value="";
		document.getElementById("password").value="";
		
	});
</script>

</html>