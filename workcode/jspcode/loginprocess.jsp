<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="mvc.spring.controller.SocketClient" %>
<%@ page import="org.json.JSONException"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
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
     //String loginName=request.getParameter("username");
     //String loginPass=request.getParameter("password");
     //String Codetext=request.getParameter("code");
     //String Codeborn=(String)session.getAttribute("code");
     SocketClient client = new SocketClient();
     boolean flag1 = true; //client.Sign(loginName, loginPass);
     JSONObject json = client.readjson();
     if(flag1)
     {
     session.setAttribute("json",json);
     response.sendRedirect(request.getContextPath()+"/loginSuccess.jsp");   
     }
     else
     {
     response.sendRedirect(request.getContextPath()+"/loginError.jsp");
     }
     
     //session.setAttribute("json",json);
     //session.setAttribute("loginName", loginName);
     //session.setAttribute("loginPass", loginPass);
     //response.sendRedirect(request.getContextPath()+"/loginSuccess.jsp");   
     //if(Codetext == Codeborn)
     /*{
        if(flag1)
        {
	        JSONObject json = client.readjson();
	        session.setAttribute("json",json);
	        session.setAttribute("loginName", loginName);
	        session.setAttribute("loginPass", loginPass);
	        response.sendRedirect(request.getContextPath()+"/loginSuccess.jsp");
        }
	    else if(!flag1)
	    {
	        response.sendRedirect(request.getContextPath()+"/loginError.jsp");
	     }
	 }
     
     else
     {
         response.sendRedirect(request.getContextPath()+"/login.jsp");
     }*/
   %>
  
  </body>
</html>
