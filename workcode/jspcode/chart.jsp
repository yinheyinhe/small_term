<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <title>Chart View</title>
    
    <script type="text/javascript" src="echarts.js"></script>
	<script type="text/javascript" src="echart.min.js"></script>
	<script type="text/javascript" src="jquery-3.5.1.js"></script>
	<script type="text/javascript" src="jquery-3.5.1.min.js"></script>
	
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
   JSONObject json = (JSONObject)session.getAttribute("json");
 %>
    <script type="text/javascript" src="echart.min.js"></script>
	<script type="text/javascript" src="echart.min.js"></script>
	<script type="text/javascript" src="jquery-3.5.1.js"></script>
	<script type="text/javascript" src="jquery-3.5.1.min.js"></script>
	
	<div id="main" style="width: 500px;height:300px;"></div>
    <script type="text/javascript">
     var myChart = echarts.init(document.getElementById("main"));
     var data = <%=json%>;
     
     var option = {
    title: {
        text: '未来一周气温变化',
        
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data: ['最高气温','最低气温']
    },
    toolbox: {
        show: true,
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            dataView: {readOnly: false},
            magicType: {type: ['line', 'bar']},
            restore: {},
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['7.1', '7.2', '7.3','7.4', '7.5']
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value} °C'
        }
    },
    series: [
        {
            name: '最高气温',
            type: 'line',
            data: [parseFloat(data[0].t_max), parseFloat(data[1].t_max), parseFloat(data[2].t_max)
                  , parseFloat(data[3].t_max), parseFloat(data[4].t_max)],
            markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'}
                ]
            }
        },
        {
            name: '最低气温',
            type: 'line',
            data: [parseFloat(data[0].t_min), parseFloat(data[1].t_min), parseFloat(data[2].t_min)
                  , parseFloat(data[3].t_min),parseFloat(data[4].t_min)],
            markPoint: {
                data: [
                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'},
                    [{
                        symbol: 'none',
                        x: '90%',
                        yAxis: 'max'
                    }, {
                        symbol: 'circle',
                        label: {
                            position: 'start',
                            formatter: '最大值'
                        },
                        type: 'max',
                        name: '最高点'
                    }]
                ]
            }
        }
    ]
};

myChart.setOption(option);
</script>

</body>

</html>
