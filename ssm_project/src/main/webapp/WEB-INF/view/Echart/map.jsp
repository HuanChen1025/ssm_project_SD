<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>ECharts</title>
<style type="text/css">
    
 </style>
    <!-- 引入 echarts.js -->
	<script src="<%=request.getContextPath()%>/static/js/echart/shandong.json"></script>
	<!-- 引入JS和CSS文件 -->
	<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/js/echart/echarts.js"></script>
	<script type="text/javascript">
	
	$.getJSON("../static/shandong.json", function (SDjson) {
    echarts.registerMap('山东', SDjson);
    var mapChart = echarts.init(document.getElementById('map'));
      option = {  
      title : {
        text: '山东省建设模式分类',
        x:'center'
    },
      tooltip : {
      trigger: 'item'
    },
      dataRange: {
      x: 'left',
      y: 'top',
      top: 40,
      left: 10,
      splitList: [
          {start: 3, end:3,label: '类别3'},
          {start: 2, end: 2,label: '类别2'},
          {start:1,end: 1,label: '类别1'}
      ],
      color: ['#1E90FF', '#00BFFF', '#b4e0f3'],
      borderColor: '#ccc',
      borderWidth: 2,
      backgroundColor: '#eee',
  },


    roamController: {
        show: true,
        x: 'right',
        mapTypeControl: {
            'china': true
        }
    },
    
    series : [
        {
            name: '分类结果',
            type: 'map',
            mapType: '山东',
            roam: false,
            itemStyle:{
                normal:{label:{show:true},
                  borderWidth: .5,//区域边框宽度
                  borderColor: '#009fe8',//区域边框颜色     
                
                },
                emphasis:{label:{show:true}}
            },
            data:[
                {name: '威海市',value: 2},
                {name: '烟台市',value: 1},
                {name: '青岛市',value: 1},
                {name: '潍坊市',value: 1},
                {name: '东营市',value: 3},
                {name: '滨州市',value: 2},
                {name: '德州市',value: 3},
                {name: '济南市',value: 3},
                {name: '莱芜市',value: 2},
                {name: '泰安市',value: 3},
                {name: '聊城市',value: 3},
                {name: '济宁市',value: 3},
                {name: '菏泽市',value: 3},
                {name: '枣庄市',value: 3},
                {name: '临沂市',value: 1},
                {name: '日照市',value: 2},
                {name: '淄博市',value: 1},
               
            ]
        },
    ]

      };
      
     mapChart.setOption(option); 
});
</script>

<script type="text/javascript">
$(document).ready(function(){
var pieChart = echarts.init(document.getElementById('pieChart'));
	 option1 = {
	  title : {
        text: '建设模式分类比例',
        x:'center'
    },
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
    legend: {
        orient: 'horizontal',
        x: 'center',
        top: 30,
        data:['类别1','类别2','类别3']
    },
    series: [
        {
            name:'建设模式分类',
            type:'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[
                {value:5, name:'类别1'},
                {value:4, name:'类别2'},
                {value:8, name:'类别3'},
               
            ]
        }
    ]
};
pieChart.setOption(option1);

});
$(document).ready(function(){	
    		// 基于准备好的dom，初始化echarts实例
        	 var lineChart = echarts.init(document.getElementById('lineChart'));
       	  	// 指定图表的配置项和数据
       	  	var option ={
       	   title : {
 			 text: '建设模式分类占比',
  			 x:'center'
			},
            tooltip: {},
            legend: {
              orient: 'horizontal',
       		  x: 'center',
       		  top: 30,
              data:['数量']
            },
            xAxis: {
                data: ['类别1','类别2','类别3']
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: [5,4,8],
                barWidth:30
            }]
        	  	
        	  	};
        		// 使用刚指定的配置项和数据显示图表。
        		lineChart.setOption(option);

 
});
</script>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <!-- 
    	<div id="map"  class="map" ></div>
	    <div class="right">
	    <div id="pieChart" class="pieChart"   style="width: 400px;height: 400px"></div>
		<div id="lineChart" class="lineChart" style="width: 400px;height: 400px"></div>
	    </div>
     -->
    <div style="height: 850px;">
       <div class="container-fluid">
    		<div class="row">
    			<div class="col-lg-8 col-md-8 col-sm-8">
    			<div id="map"  style="height: 800px" ></div>
    			</div>
    			<div class="col-lg-4 col-md-4 col-sm-4">
    				<div id="pieChart"    style="height: 400px"></div>
					<div id="lineChart"   style="height: 400px"></div>
    			</div>
    		
    		</div>
    
       </div>
	</div>
</body>
</html>