<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONException"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
	<title>table.html</title>
</head>

<body>
     <td><a href="Information.jsp">Information</a></td>
     <td><a href="weather.jsp">Weather forecast</a></td>
     <td><a href="login.jsp">Exit the current account</a></td>
     <%
         JSONObject json = (JSONObject)session.getAttribute("json");
         out.println(json);
         
      %>

</body>

</html>