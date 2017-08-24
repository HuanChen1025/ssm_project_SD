<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> 
<!-- 引入JS和CSS文件 -->
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/echart/echarts.js"></script>
<script type="text/javascript">
$(function(){
	$('#time').select2({
		placeholder: "请至少选择一个时间",
		tags:true,
		createTag:function (decorated, params) {
			return null;
		},
		width:'200px'
	});

	function formatState (state) {
		if (!state.id) { return state.text; }
		var $state = $(
		'<span>' + state.text + '</span>'
		);
		return $state;
	};

	$('#cityName').select2({
		placeholder: "请选择一个城市",
		templateResult: formatState,
		width:'200px'
	});
});
</script>
</head>
<body>
<div style="height: 1000px;">
<div class="container-fluid">
<div class="panel panel-info" style="width:800px; margin: 20px auto 20px">
	<div class="panel-heading">
		<h3 class="panel-title">查询</h3>
	</div>
	<div class="panel-body" ">
	 <label class="control-label" for="cityName">选择查询地区：</label>
			
				<select class="combox" id="cityName" name="recommenderId"> 
					    <option value="">请选择...</option>
					<optgroup label="大型主站">
						<option value="37401">济南</option>
						<option value="37402">青岛</option>
						<option value="37403">淄博</option>
						<option value="37407">潍坊</option>
						<option value="37406">烟台</option>
						<option value="37408">济宁</option>
						<option value="37413">临沂</option>
						<option value="37414">德州</option>
						<option value="37409">泰安</option>
						<option value="37415">聊城</option>
						<option value="37414">枣庄</option>
						<option value="37417">菏泽</option>
						<option value="37405">东营</option>
						
					</optgroup>
					<optgroup label="中型主站">
						<option value="37412">莱芜</option>
						<option value="37416">滨州</option>
						<option value="37411">日照</option>
						<option value="37410">威海</option>
					</optgroup>
					<optgroup label="小型主站">
					</optgroup>
				</select>&nbsp;&nbsp;&nbsp;
			 <label class="control-label" for="time">选择查询时间：</label>
			
				<select class="combox" id="time" name="tagId" multiple> 
				<option value="">请选择...</option>
					<optgroup label="查询时间">
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
					</optgroup>
					
				</select>
					&nbsp;&nbsp;&nbsp;
		            <button id="submit" class="btn-primary" type="button" style="width:60px">查询</button>
	</div>
</div>
   <div class="row">
  
     <div id="chart1"   class="col-lg-6"   style="height:430px;" ></div>
     <div  id="chart2"  class="col-lg-6"  style="height:430px;"  ></div>
  </div>
    <div class="row">
    <div id="chart3" class="col-lg-6"   style="height:430px;"  ></div>
    <div id="chart4" class="col-lg-6"   style="height:430px;" ></div>
     </div>

</div></div>



  <script type="text/javascript">
     		// 基于准备好的dom，初始化echarts实例
        	 var myChart1 = echarts.init(document.getElementById('chart1'));
       	  	// 指定图表的配置项和数据
       	  	var option ={
       	  	title: {
               text: '通信网数据(单位：个)'
            },
            tooltip: {
            	 trigger: 'axis'
            },
            grid: {
       		 left: '3%',
             right: '4%',
             bottom: '5%',
             containLabel: true
            },
            xAxis: {
            	 type: 'category',
       			 boundaryGap: false,
                 data: []
            },
            yAxis: {
            	 type: 'value'
            },
            series: [{
                type:'line',
                stack: '总量',
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
               text: '配电自动化系统数据(单位：个)'
            },
            tooltip: {
            	 trigger: 'axis'
            },
            grid: {
       		 left: '3%',
             right: '4%',
             bottom: '5%',
             containLabel: true
            },
            xAxis: {
            	 type: 'category',
       			 boundaryGap: false,
                 data: []
            },
            yAxis: {
            	 type: 'value'
            },
            series: [{
                type:'line',
                stack: '总量',
                data: []
            }]
        	  	
        	  	};
        		// 使用刚指定的配置项和数据显示图表。
        		myChart2.setOption(option);
        		
        		//一次设备改造
        	// 基于准备好的dom，初始化echarts实例
        	 var myChart3 = echarts.init(document.getElementById('chart3'));
       	  	// 指定图表的配置项和数据
       	  	//一次设备改造数据(单位：个)
       	  	var option ={
       	  	title: {
               text: '一次设备改造数据(单位：个)'
            },
            tooltip: {
            	 trigger: 'axis'
            },
            grid: {
       		 left: '3%',
             right: '4%',
             containLabel: true
            },
            xAxis: {
            	 type: 'category',
       			 boundaryGap: false,
                 data: []
            },
            yAxis: {
            	 type: 'value'
            },
            series: [{
                type:'line',
                stack: '总量',
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
               text: '线路数据(单位：个)'
            },
            tooltip: {
            	 trigger: 'axis'
            },
            grid: {
       		 left: '3%',
             right: '4%',
             containLabel: true
            },
            xAxis: {
            	 type: 'category',
       			 boundaryGap: false,
                 data: []
            },
            yAxis: {
            	 type: 'value'
            },
            series: [{
                type:'line',
                stack: '总量',
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
   		var cityName  =  $("#cityName").val();
   		var legendName = $("#time").val();
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
   		legend: {
            	x:'center',
                data:legendName
            },
   		
   		 xAxis: {
                data: elementlist,
            },
            yAxis: {},
            series: [
            
            {
                name: '2016',
                type: 'line',
                data: datalist,
            },
               {
                name: '2015',
                type: 'line',
                data: [10,180,165,0,2800,16,15],
            }
            
            
            
            ]
   		}

   		);
   		});
   		
   		
   		//配电自动化系统数据的图表
   		$('#submit').click(function(){
   		var cityName = $("#cityName").val();
   		var legendName = $("#time").val();
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
   		legend: {
            	x:'center',
                data:legendName
            },
   		
   		 xAxis: {
                data: elementlist,
                 axisLabel:{
                	interval:0,
                	rotate:45
                }
            },
            yAxis: {},
            series: [
            {
                name: '2016',
                type: 'line',
                data: datalist,
            },
             {
                name: '2015',
                type: 'line',
                data: [150,2000,0,10,100,400,0,900,8],
            }
            
            
            ]
   		}

   		);
   		});
   		
   		//一次设备改造数据的图表
   		$('#submit').click(function(){
   		var cityName = $("#cityName").val();
   		var legendName = $("#time").val();
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
   		
   		legend: {
            	x:'center',
                data:legendName
            },
   		 xAxis: {
                data: elementlist
            },
            yAxis: {},
            series: [
            {
                name: '2016',
               type: 'line',
               data: datalist,
            },
             {
                name: '2015',
                type: 'line',
                data: [190,20,600,200],
            }
            
            ]
   		}

   		);
   		});
   		
   		//线路数据的图表
   		$('#submit').click(function(){
   		var cityName = $("#cityName").val();
   		var legendName = $("#time").val();
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
   		
   		legend: {
            	x:'center',
                data:legendName
            },
   		 xAxis: {
                data: elementlist4,
                
            },
            yAxis: {},
            series: [
            {
                name: '2016',
                type: 'line',
                data: datalist4,
            },
             {
                name: '2015',
                type: 'line',
                data: [300,800,100,200],
            }
            
            ]
   		});
   		});
    </script>
</body>
</html>