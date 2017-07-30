<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <style type="text/css">
#main{
width: 1000px;

height:800px;

margin: 10px auto 20px;
}
    
    </style>
    <!-- 引入 echarts.js -->
    <script src="<%=request.getContextPath()%>/static/js/echart/echarts.js"></script>
	<script src="<%=request.getContextPath()%>/static/js/echart/shandong.json"></script>
	<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	$.getJSON("../static/shandong.json", function (SDjson) {
    echarts.registerMap('山东', SDjson);
    var chart = echarts.init(document.getElementById('main'));
      option = {  
      title : {
        text: '山东全省地图',
        x:'center'
    },
      tooltip : {
      trigger: 'item'
    },
       legend: {
        orient: 'vertical',
        x:'left',
        data:['指标评分']
    },
    
    dataRange: {
        min: 0,
        max: 100,
        x: 'left',
        y: 'bottom',
        color:['#1e90ff','#f0ffff'],//颜色 
        text:['高','低'],           // 文本，默认为数值文本
        calculable : true
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
            name: '指标评分',
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
                {name: '威海市',value: Math.round(Math.random()*100)},
                {name: '烟台市',value: Math.round(Math.random()*100)},
                {name: '青岛市',value: Math.round(Math.random()*100)},
                {name: '潍坊市',value: Math.round(Math.random()*100)},
                {name: '东营市',value: Math.round(Math.random()*100)},
                {name: '滨州市',value: Math.round(Math.random()*100)},
                {name: '德州市',value: Math.round(Math.random()*100)},
                {name: '济南市',value: Math.round(Math.random()*100)},
                {name: '莱芜市',value: Math.round(Math.random()*100)},
                {name: '泰安市',value: Math.round(Math.random()*100)},
                {name: '聊城市',value: Math.round(Math.random()*100)},
                {name: '济宁市',value: Math.round(Math.random()*100)},
                {name: '菏泽市',value: Math.round(Math.random()*100)},
                {name: '枣庄市',value: Math.round(Math.random()*100)},
                {name: '临沂市',value: Math.round(Math.random()*100)},
                {name: '日照市',value: Math.round(Math.random()*100)},
                {name: '淄博市',value: Math.round(Math.random()*100)},
               
            ]
        },
    ]

      };
    
    
     chart.setOption(option); 
});
	</script>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main"  class="main" ></div>

</body>
</html>