<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
	<title>table.html</title>
</head>
<script>

    var table=document.getElementById("table");
    for(var i=0;i<data.length;i++){
                            var row=table.insertRow(table.rows.length);
                            var c1=row.insertCell(0);
                            c1.innerHTML=data[i].date;
                            var c2=row.insertCell(1);
                            c2.innerHTML=data[i].t_average;
                            var c3=row.insertCell(2);
                            c3.innerHTML=data[i].t_min;
                            var c3=row.insertCell(2);
                            c3.innerHTML=data[i].t_max;
                            
                        }

</script>
<body>
<table id="table" border="1" cellspacing="0" cellpadding="0" >
   <tr>
        <th>date</th>
        <th>t_average</th>
        <th>t_min</th>
        <th>t_max</th>
        
    </tr>
</table>

<script>

   var data = [{"date": "2020-03-19", "t_average": "16.302401", "t_min": "12.121818", "t_max": "20.392039"}, 
               {"date": "2020-03-20", "t_average": "16.566343", "t_min": "12.512554", "t_max": "20.502572"}, 
               {"date": "2020-03-21", "t_average": "16.929638", "t_min": "12.789744", "t_max": "20.832356"}, 
               {"date": "2020-03-22", "t_average": "17.173324", "t_min": "13.450453", "t_max": "21.110935"}, 
               {"date": "2020-03-23", "t_average": "17.547995", "t_min": "13.397585", "t_max": "21.623717"}]
 
    
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

</body>

</html>