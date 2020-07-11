<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="mvc.spring.controller.SocketClient" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'logoutprocess.jsp' starting page</title>
    
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
     String newName=request.getParameter("username");
     String newPass=request.getParameter("password");
     String logoutName=(String)session.getAttribute("loginName");
     String logoutPass=(String)session.getAttribute("loginPass");
     SocketClient client = new SocketClient();
     boolean flag1 =client.delete(logoutName, logoutPass);   
     boolean flag2;
     
     if(newName == logoutName && newPass == logoutPass)
         flag2 = true;
     else
         flag2 = false;
     
    if(flag1 && flag2)
    {
        
        response.sendRedirect(request.getContextPath()+"/logoutSuccess.jsp");
        }
    else 
    {
        
        response.sendRedirect(request.getContextPath()+"/loginoutError.jsp");
        }
   %>
  
  </body>
</html>
