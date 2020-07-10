<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
	<title>table.html</title>
	<script src="echarts.js"></script>
	
</head>

<body>


<div id="main" style="width: 1000px;height:600px;"></div>
<script type="text/javascript">
    var data = [{"date": "2020-03-19", "t_average": "16.302401", "t_min": "12.121818", "t_max": "20.392039"}, 
               {"date": "2020-03-20", "t_average": "16.566343", "t_min": "12.512554", "t_max": "20.502572"}, 
               {"date": "2020-03-21", "t_average": "16.929638", "t_min": "12.789744", "t_max": "20.832356"}, 
               {"date": "2020-03-22", "t_average": "17.173324", "t_min": "13.450453", "t_max": "21.110935"}, 
               {"date": "2020-03-23", "t_average": "17.547995", "t_min": "13.397585", "t_max": "21.623717"}]
               
     var Max,Min,Average;
     for(var i=0;i<data.length;i++){
         Max[i] = data[i].t_max;
         Min[i] = data[i].t_min;
         Average[i] = data[i].t_average;
     }
 
    var myChart = echarts.init(document.getElementById("main"));
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
        data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
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
            data: Max,
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
            data: Min,
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