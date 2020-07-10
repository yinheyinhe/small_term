<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="mvc.spring.controller.LoginController" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'loginprocess.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
         
  <body>
      <%
     String loginName=request.getParameter("username");
    String loginPass=request.getParameter("password");
    LoginController controller = new LoginController();
    
    String flag =controller.setFlag(loginName, loginPass);   
    
    
    if(flag=="1")
    {
        session.setAttribute("loginName", loginName);
        session.setAttribute("loginPass", loginPass);
        response.sendRedirect(request.getContextPath()+"/registerSuccess.jsp");
        }
    else if(flag=="0")
    {
        
        response.sendRedirect(request.getContextPath()+"/registerError.jsp");
        }
   %>
  
  </body>
</html>
