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
    String newName=request.getParameter("username");
    String newPass=request.getParameter("password");
    String loginName = (String)session.getAttribute("loginName");
    String loginPass = (String)session.getAttribute("loginPass");
    SocketClient client = new SocketClient();
    
    boolean flag1 =client.Change(loginName, loginPass);   
    boolean flag2;
     
     if(newName == loginName && newPass == loginPass)
         flag2 = true;
     else
         flag2 = false;
    
    if(flag1 && flag2)
    {
        session.setAttribute("loginName", loginName);
        session.setAttribute("loginPass", loginPass);
        response.sendRedirect(request.getContextPath()+"/changeSuccess.jsp");
        }
    else 
    {
        
        response.sendRedirect(request.getContextPath()+"/changeError.jsp");
        }
   %>
  
  </body>
</html>
