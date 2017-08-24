<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>配电自动化关联分析</title>
<!-- 引入JS和CSS文件 -->
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/echart/echarts.js"></script>
<style type="text/css">

</style>
</head>
<body>
	<div class="row">
		<div	id="chart1" class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8" style="height:400px;"></div>
	</div>
	<div class="row">
		<div	id="chart2" class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8" style="height:400px;"></div>
	</div>
	<div class="row">
		<div	id="chart3" class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8" style="height:400px;"></div>
	</div>
<script type="text/javascript">
$(document).ready(function(){
var myChart1 = echarts.init(document.getElementById('chart1'));
var myChart2 = echarts.init(document.getElementById('chart2'));
var myChart3 = echarts.init(document.getElementById('chart3'));
option1 = {
    title: {
        text: '类别1——配电自动化关联分析',
         x:'center'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
     	x: 'center',
        top: 30,
        data:['应用效益','投入成本']
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
    xAxis:  {
        type: 'category',
        boundaryGap: false,
        data: ['青岛','淄博','潍坊','烟台','临沂']
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value}'
        }
    },
    series: [
        {
            name:'应用效益',
            type:'line',
            data:[21, 11, 15, 13,15.4],
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
            name:'投入成本',
            type:'line',
            data:[16, 22, 21, 15.2,18.2],
            markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
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
                            normal: {
                                position: 'start',
                                formatter: '最大值'
                            }
                        },
                        type: 'max',
                        name: '最高点'
                    }]
                ]
            }
        }
    ]
};

option2 = {
    title: {
        text: '类别2——配电自动化关联分析',
         x:'center'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
     	x: 'center',
        top: 30,
        data:['应用效益','投入成本']
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
    xAxis:  {
        type: 'category',
        boundaryGap: false,
         data: ['滨州','威海','莱芜','日照']
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value}'
        }
    },
    series: [
        {
            name:'应用效益',
            type:'line',
            data:[21, 11, 15, 23],
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
            name:'投入成本',
            type:'line',
            data:[12, 22, 21, 19],
            markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
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
                            normal: {
                                position: 'start',
                                formatter: '最大值'
                            }
                        },
                        type: 'max',
                        name: '最高点'
                    }]
                ]
            }
        }
    ]
};

option3 = {
    title: {
        text: '类别3——配电自动化关联分析',
         x:'center'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
     	x: 'center',
        top: 30,
        data:['应用效益','投入成本']
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
    xAxis:  {
        type: 'category',
        boundaryGap: false,
        data: ['济南','济宁','德州','泰安','聊城','枣庄','菏泽','东营']
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value}'
        }
    },
    series: [
        {
            name:'应用效益',
            type:'line',
            data:[21, 11, 15, 13,16,18.2,21,14],
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
            name:'投入成本',
            type:'line',
            data:[19, 22, 21, 15,23,16,14,21],
            markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
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
                            normal: {
                                position: 'start',
                                formatter: '最大值'
                            }
                        },
                        type: 'max',
                        name: '最高点'
                    }]
                ]
            }
        }
    ]
};
 // 使用刚指定的配置项和数据显示图表。
 myChart1.setOption(option1);
 myChart2.setOption(option2);
 myChart3.setOption(option3);
});
 


</script>

</body>
</html>