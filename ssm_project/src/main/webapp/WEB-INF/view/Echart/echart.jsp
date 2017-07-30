<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>建设规模数据查询</title>
<!-- 引入 echarts.js -->
<script src="<%=request.getContextPath()%>/static/js/echart/echarts.js"></script>
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
<style	type="text/css">
.btn{
color:#fff;
background-color:#286090;
border-color:#204d74
}
#select{
height: 40px;
margin-top: 10px;
margin-left: 26%;
}
#select option{
width:100px;
font-size: 15px;
}

#chart1{
float:left;
}
#chart2{
float:left;
}
#chart3{
float:left;
clear:left;
margin-top: 20px;
}
#chart4{
float:left;
margin-top: 20px;
}

</style>
</head>
<body>
	<div style="height: 1000px">
	<div id="select" >
    <font>选择地区</font>
    <select id="provice">
    	<option value="374">山东</option>
    </select>
    <select id="city">
    <option value="37401">济南</option>
    <option value="37402">青岛</option>
    <option value="37403">淄博</option>
    <option value="37404">枣庄</option>
    <option value="37405">东营</option>
    <option value="37406">烟台</option>
    <option value="37407">潍坊</option>
    <option value="37408">济宁</option>
    <option value="37409">泰安</option>
    <option value="37410">威海</option>
    <option value="37411">日照</option>
    <option value="37412">莱芜</option>
    <option value="37413">临沂</option>
    <option value="37414">德州</option>
    <option value="37415">聊城</option>
    <option value="37416">滨州</option>
    <option value="37417">滨州</option>
    </select>
    <button id="submit" class="btn" type="button">查询</button>
    </div>
    <div id="chart1" style="width: 500px;height:400px;"></div>
    <div id="chart2" style="width: 500px;height:400px;"></div>
    <div id="chart3" style="width: 500px;height:400px;"></div>
    <div id="chart4" style="width: 500px;height:400px;"></div>
    </div>
    <script type="text/javascript">
     		// 基于准备好的dom，初始化echarts实例
        	 var myChart1 = echarts.init(document.getElementById('chart1'));
       	  	// 指定图表的配置项和数据
       	  	var option ={
       	  	title: {
               text: '通信网数据'
            },
            tooltip: {},
            legend: {
                data:['数量']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: []
            }]
        	  	
        	  	};
        		// 使用刚指定的配置项和数据显示图表。
        		myChart1.setOption(option);
        		
        	//配电自动化系统的图表
        	// 基于准备好的dom，初始化echarts实例
        	 var myChart2 = echarts.init(document.getElementById('chart2'));
       	  	// 指定图表的配置项和数据
       	  	var option ={
       	  	title: {
               text: '配电自动化系统数据'
            },
            tooltip: {},
            legend: {
                data:['数量']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: []
            }]
        	  	
        	  	};
        		// 使用刚指定的配置项和数据显示图表。
        		myChart2.setOption(option);
        		
        		//一次设备改造
        	// 基于准备好的dom，初始化echarts实例
        	 var myChart3 = echarts.init(document.getElementById('chart3'));
       	  	// 指定图表的配置项和数据
       	  	var option ={
       	  	title: {
               text: '一次设备改造数据'
            },
            tooltip: {},
            legend: {
                data:['数量']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: []
            }]
        	  	
        	  	};
        		// 使用刚指定的配置项和数据显示图表。
        		myChart3.setOption(option);
        		
        	//线路数据
        	// 基于准备好的dom，初始化echarts实例
        	 var myChart4 = echarts.init(document.getElementById('chart4'));
       	  	// 指定图表的配置项和数据
       	  	var option ={
       	  	title: {
               text: '线路数据'
            },
            tooltip: {},
            legend: {
                data:['数量']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: []
            }]
        	  	
        	  	};
        		// 使用刚指定的配置项和数据显示图表。
        		myChart4.setOption(option);
        		  		
    
    </script>

    <script type="text/javascript">
    
     		//获取当前项目的路径
       		 var urlRootContext = (function () {
             var strPath = window.document.location.pathname;
             var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
             return postPath;
        })();
       
       	//异步加载数据
       	 var URL1 =  urlRootContext + "/user/chart1.do"; //请求的网址
       	 var URL2 =  urlRootContext + "/user/chart2.do"; //请求的网址
       	 var URL3 =  urlRootContext + "/user/chart3.do"; //请求的网址
       	 var URL4 =  urlRootContext + "/user/chart4.do"; //请求的网址
       	 //获取当前选择的城市
      

   		$('#submit').click(function(){
   		var cityName = $("#city").val();
       	var reqParams={'city':cityName};
   		var datalist = new Array();
   		var elementlist = new Array();
   		$.ajax({
			type: "POST",
	        url:URL1,
	        cache: false,
	        data: reqParams,
	        async:false,
	        dataType:"json",
	        success: function(data){
			
			for(var i=0;i<data.length;i++){
  				datalist[i]=data[i].value;
  				elementlist[i]=data[i].element_name;
  			}
   			},
   			 	error: function(e){
            	           alert("查询失败:" + e);
            	        },
   		});
   		myChart1.setOption(
   		{
   		 xAxis: {
                data: elementlist,
                 axisLabel:{
                	interval:0,
                	rotate:45
                }
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: datalist,
                 barWidth:30
            }]
   		}

   		);
   		});
   		
   		
   		//配电自动化系统数据的图表
   		$('#submit').click(function(){
   		var cityName = $("#city").val();
       	var reqParams={'city':cityName};
   		var datalist = new Array();
   		var elementlist = new Array();
   		$.ajax({
			type: "POST",
	        url:URL2,
	        cache: false,
	        data: reqParams,
	        async:false,
	        dataType:"json",
	        success: function(data){
			
			for(var i=0;i<data.length;i++){
  				datalist[i]=data[i].value;
  				elementlist[i]=data[i].element_name;
  			}
   			},
   			 	error: function(e){
            	           alert("查询失败:" + e);
            	        },
   		});
   		myChart2.setOption(
   		{
   		 xAxis: {
                data: elementlist,
                 axisLabel:{
                	interval:0,
                	rotate:45
                }
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: datalist,
                barWidth:30
            }]
   		}

   		);
   		});
   		
   		//一次设备改造数据的图表
   		$('#submit').click(function(){
   		var cityName = $("#city").val();
       	var reqParams={'city':cityName};
   		var datalist = new Array();
   		var elementlist = new Array();
   		$.ajax({
			type: "POST",
	        url:URL3,
	        cache: false,
	        data: reqParams,
	        async:false,
	        dataType:"json",
	        success: function(data){
			
			for(var i=0;i<data.length;i++){
  				datalist[i]=data[i].value;
  				elementlist[i]=data[i].element_name;
  			}
   			},
   			 	error: function(e){
            	           alert("查询失败:" + e);
            	        },
   		});
   		myChart3.setOption(
   		{
   		 xAxis: {
                data: elementlist
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: datalist,
                 barWidth:30
            }]
   		}

   		);
   		});
   		
   		//线路数据的图表
   		$('#submit').click(function(){
   		var cityName = $("#city").val();
       	var reqParams={'city':cityName};
   		var datalist4 = new Array();
   		var elementlist4 = new Array();
   		$.ajax({
			type: "POST",
	        url:URL4,
	        cache: false,
	        data: reqParams,
	        async:false,
	        dataType:"json",
	        success: function(data){
			
			for(var i=0;i<data.length;i++){
  				datalist4[i]=data[i].value;
  				elementlist4[i]=data[i].element_name;
  			}
   			},
   			 	error: function(e){
            	           alert("查询失败:" + e);
            	        },
   		});
   		myChart4.setOption(
   		{
   		 xAxis: {
                data: elementlist4,
                 axisLabel:{
                	interval:0,
                	rotate:45
                }
                
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: datalist4,
                 barWidth:30
            }]
   		}

   		);
   		});
    </script>
</body>
</html>