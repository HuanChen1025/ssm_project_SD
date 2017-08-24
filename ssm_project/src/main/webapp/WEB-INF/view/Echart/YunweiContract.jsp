<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>建设规模数据查询</title>
<!-- 引入JS和CSS文件 -->
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/echart/echarts.js"></script>
<style	type="text/css">

}
</style>

<script type="text/javascript">
$(function(){
	$('#cityName').select2({
		placeholder: "请至少选择一个地区",
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

	$('#time').select2({
		placeholder: "请选择一个时间",
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
						<select class="combox" id="cityName" name="recommenderId" multiple> 
								<option value="">请选择...</option>
							<optgroup label="大型主站">
								<option name='test' value="37401">济南</option>
								<option name='test' value="37410">威海</option>
								<option name='test'  value="37402">青岛</option>
								<option name='test' value="37407">潍坊</option>
							</optgroup>
							<optgroup label="中型主站">
								<option name='test' value="37413">临沂</option>
								<option name='test' value="37406">烟台</option>
								<option name='test' value="37414">德州</option>
								<option  name='test' value="37407">潍坊</option>
							</optgroup>
						</select>&nbsp;&nbsp;&nbsp;
			 			<label class="control-label" for="time">选择查询时间：</label>
						<select class="combox" id="time" name="tagId" > 
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
	              <div id="chart1"  class="col-lg-10"   style="height:400px;"></div>
	    	    </div>
	    	    <div class="row">
	               <div id="chart2"  class="col-lg-10"   style="height:400px;"></div>
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
            legend: {
                data:[]
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
        		
        	 // 基于准备好的dom，初始化echarts实例
        	 var myChart2 = echarts.init(document.getElementById('chart2'));
       	  	 // 指定图表的配置项和数据
       	  	var option ={
       	  	title: {
               text: ' 建设成本数据(单位：万元)'
            },
            tooltip: {},
            legend: {
                data:[]
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
  
  </script>
  <script type="text/javascript">
  //获取当前项目的路径
        var urlRootContext = (function () {
            var strPath = window.document.location.pathname;
            var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
            return postPath;
        })();
       	//异步加载数据
       	 var URL1 =  urlRootContext + "/user/contrastQuery_YWCB.do"; //请求运维成本的网址
         var URL2 =  urlRootContext + "/user/contrastQuery2.do"; //请求的网址
         
         //点击后立马查询运维成本数据
   		$('#submit').click(function(){
   		//获取选中CheckBox后的文字
   		  	var check_name=new Array();
  		$("input[name='test']:checked").each(function(){
  		check_name.push($(this).next().text());
  		});
  		//alert(check_name);
   		
   		//获取选中的CheckBox的value值
   		  	var check_val=new Array();
  		$("input[name='test']:checked").each(function(){
  		check_val.push($(this).val());
  		});
   		var cityName = $("#cityName").val();
       	var reqParams={'city':cityName};
   		var datalist1 = new Array();
   		var datalist2 = new Array();
   		var datalist3 = new Array();
   		var datalist4 = new Array();
   		var datalist5 = new Array();
   		var elementlist = new Array();
   		$.ajax({
			type: "POST",
	        url:URL1,
	        cache: false,
	        data: reqParams,
	        async:false,
	        dataType:"json",
	        traditional:true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
	        success: function(data){
	        var firstData = data['37401'];
	        	for(var i=0;i<firstData.length;i++){
  				datalist1[i]=firstData[i].value;
  				elementlist[i]=firstData[i].element_name;
  			}
  			 var secondData = data['37402'];
	        	for(var i=0;i<secondData.length;i++){
  				datalist2[i]=secondData[i].value;
  			}
  			  	var threeData = data['37403'];
	        	for(var i=0;i<threeData.length;i++){
  				datalist3[i]=threeData[i].value;
  			}
  				var fourData = data['37404'];
	        	for(var i=0;i<fourData.length;i++){
  				datalist4[i]=fourData[i].value;
  			}
  			var fiveData = data['37405'];
	        	for(var i=0;i<fiveData.length;i++){
  				datalist5[i]=fiveData[i].value;
  			}
   			},
   			 error: function(e){
            	alert("查询失败:" + e);
            	        },
   		});
   		myChart1.setOption(
   		{
   		
   		legend: {
                data:check_name
            },
   		 xAxis: {
                data: elementlist
            },
            yAxis: {},
            series: [
            {
                name: '济南',
                type: 'bar',
                data: datalist1,
                barWidth:20
            },
             {
                name: '青岛',
                type: 'bar',
                data: datalist2,
                barWidth:20
            },
            {
                name: '淄博',
                type: 'bar',
                data: datalist3,
                barWidth:20
            },
             {
                name: '枣庄',
                type: 'bar',
                data: datalist4,
                barWidth:20
            },
            {
                name: '东营',
                type: 'bar',
                data: datalist5,
                barWidth:20
            }
            
            
            ]
   		}

   		);
   		});

    </script>
</body>
</html>