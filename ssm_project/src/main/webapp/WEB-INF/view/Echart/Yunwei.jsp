<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入JS和CSS文件 -->
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/echart/echarts.js"></script>
<style type="text/css">

</style>

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
     <div style="height: 1000px">
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
						<option value="37410">威海</option>
						<option value="37402">青岛</option>
						<option value="37407">潍坊</option>
					</optgroup>
					<optgroup label="中型主站">
						<option value="37413">临沂</option>
						<option value="37406">烟台</option>
						<option value="37414">德州</option>
						<option value="37407">潍坊</option>
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
		       <button id="submit" class="btn-primary" type="button">查询</button>
		  </div>
	</div>
	
       	<div class="row">
   		    <div  id="chart1"   class="col-lg-6"   style="height:400px;" ></div>
    	    <div  id="chart2"   class="col-lg-6"   style="height:400px;"  ></div>
  		</div>
    
    </div></div>
 
 <script type="text/javascript">
  		 // 基于准备好的dom，初始化echarts实例
        	 var myChart1 = echarts.init(document.getElementById('chart1'));
       	  	// 指定图表的配置项和数据
       	  	var option ={
       	  	title: {
               text: '运维成本数据(单位：万元)'
            },
            tooltip: {},
           //legend: {
            //    data:['数量']
          // },
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
        		
        		
             // 基于准备好的dom，初始化echarts实例
        	 var myChart2 = echarts.init(document.getElementById('chart2'));
       	  	// 指定图表的配置项和数据
       	  	var option ={
       	  	title: {
               text: '建设成本数据(单位：万元)'
            },
            tooltip: {},
             //legend: {
            //    data:['数量']
           // },
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
 </script>

<script type="text/javascript">
//获取当前项目的路径
	 var urlRootContext = (function () {
     var strPath = window.document.location.pathname;
     var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
     return postPath;
        })();
	    //异步加载数据
	    var URL1 =  urlRootContext + "/user/YWCB.do"; //请求的网址
	    var URL2 =  urlRootContext + "/user/QYXY.do"; //请求的网址
	    
	   //运维成本数据的图表
       $('#submit').click(function(){
   		var cityName = $("#cityName").val();
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


 </script>
</body>
</html>