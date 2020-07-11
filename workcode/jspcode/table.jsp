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
<table id="table" border="1" cellspacing="0" cellpadding="0" >
   <tr>
        <th>date</th>
        <th>t_average</th>
        <th>t_min</th>
        <th>t_max</th>
        
    </tr>
</table>
<%
   JSONObject json = (JSONObject)session.getAttribute("json");
 %>
<script>

    var data = <%=json%>;
    var table=document.getElementById("table");
    for(var i=0;i<data.length;i++){
                            var row=table.insertRow(table.rows.length);
                            var c1=row.insertCell(0);
                            c1.innerHTML=data[i].date;
                            var c2=row.insertCell(1);
                            c2.innerHTML=data[i].t_average;
                            var c3=row.insertCell(2);
                            c3.innerHTML=data[i].t_min;
                            var c3=row.insertCell(3);
                            c3.innerHTML=data[i].t_max;
                            
                        }

</script>
<td><a href="weather.jsp">Go back</a></td>
</body>

</html>