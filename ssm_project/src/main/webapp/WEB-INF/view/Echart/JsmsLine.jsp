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
<script type="text/javascript">
$(function(){
	$('#benefit').select2({
		placeholder: "请选择一个效益",
		templateResult: formatState,
		width:'256px'
	});

	function formatState (state) {
		if (!state.id) { return state.text; }
		var $state = $(
		'<span>' + state.text + '</span>'
		);
		return $state;
	};

	$('#time').select2({
		placeholder: "请选择查询时间",
		templateResult: formatState,
		width:'200px'
	});
});
</script>
</head>
<body>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:1100px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					模态框（Modal）标题
				</h4>
			</div>
			<div class="modal-body">
			
				在这里添加一些文本
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

	 <div class="panel panel-info" style="width:800px; margin: 20px auto 20px">
         <div class="panel-heading">
	         <h3 class="panel-title">查询</h3>
         </div>
             <div class="panel-body">
                    <label class="control-label" for="benefit">选择查询效益：</label>
					<select class="combox" id="benefit" name="tagId"  multiple> 
						<optgroup label="社会效益">
							<option value="工业拉升效益">工业拉升效益</option>
							<option value="经济拉升效益">经济拉升效益</option>
							<option value="居民拉升效益">居民拉升效益</option>
							<option value="商业拉升效益">商业拉升效益</option>
						</optgroup>
						<optgroup label="企业效益">
							<option value="降低线损效益">降低线损效益</option>
							<option value="精准投资效益">精准投资效益</option>
							<option value="馈线自动化运维效益">馈线自动化运维效益</option>
							<option value="人员人身安全效益">人员人身安全效益</option>
							<option value="远程遥控效益">远程遥控效益</option>
							<option value="运行监视效益">运行监视效益</option>
							<option value="增供电量效益">增供电量效益</option>
						</optgroup>
					</select>
	                <label class="control-label" for="time">选择查询时间：</label>
					<select class="combox" id="time" name="tagId"  multiple> 
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
         x:'left'
    },
     tooltip: {
              trigger: 'axis', 
              formatter: function(datas) 
              {
                  var res = datas[0].name + '<br/>', val;
                  for(var i = 0, length = datas.length; i < length; i++) {
                        val = (datas[i].value) + ' 万元';
                        res += datas[i].seriesName + '：' + val + '<br/>';
                    }
                    return res;
               },
			    axisPointer: {
					type: 'cross'
				},
			  backgroundColor: '#7FFFD4',
              borderWidth: 1,
              borderColor: '#ccc',
              padding: 10,
              textStyle: {
              color: '#000'
            },
          	},
    legend: {
     	x: 'center',
        top: 30,
        data:[]
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
        data: ['青岛','淄博','烟台','潍坊','临沂']
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value}'
        }
    },
    series: [
      
    ]
};

option2 = {
    title: {
        text: '类别2——配电自动化关联分析',
         x:'left'
    },
     tooltip: {
              trigger: 'axis', 
              formatter: function(datas) 
              {
                  var res = datas[0].name + '<br/>', val;
                  for(var i = 0, length = datas.length; i < length; i++) {
                        val = (datas[i].value) + ' 万元';
                        res += datas[i].seriesName + '：' + val + '<br/>';
                    }
                    return res;
               },
			    axisPointer: {
					type: 'cross'
				},
			  backgroundColor: '#7FFFD4',
              borderWidth: 1,
              borderColor: '#ccc',
              padding: 10,
              textStyle: {
              color: '#000'
            },
          	},
    legend: {
     	x: 'center',
        top: 30,
        data:['应用效益']
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
         data: ['威海','日照','莱芜','滨州']
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value}'
        }
    },
    series: [
       
    ]
};

option3 = {
    title: {
        text: '类别3——配电自动化关联分析',
         x:'left'
    },
     tooltip: {
              trigger: 'axis', 
              formatter: function(datas) 
              {
                  var res = datas[0].name + '<br/>', val;
                  for(var i = 0, length = datas.length; i < length; i++) {
                        val = (datas[i].value) + ' 万元';
                        res += datas[i].seriesName + '：' + val + '<br/>';
                    }
                    return res;
               },
			    axisPointer: {
					type: 'cross'
				},
			  backgroundColor: '#7FFFD4',
              borderWidth: 1,
              borderColor: '#ccc',
              padding: 10,
              textStyle: {
              color: '#000'
            },
          	},
    legend: {
     	x: 'center',
        top: 30,
        data:['应用效益']
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
        data: ['济南','枣庄','东营','济宁','泰安','德州','聊城','菏泽']
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value}'
        }
    },
    series: [
       
    ]
};
 // 使用刚指定的配置项和数据显示图表。
 myChart1.setOption(option1);
 myChart2.setOption(option2);
 myChart3.setOption(option3);
 
  myChart1.on('click', function (param) {
 	alert("hello");
	$('.modal-body').load("YunweiContract",function(){

	});
	
	$('#myModal').modal('show');
    
});
 
});

</script>

<script type="text/javascript">
	   //获取当前项目的路径
       var urlRootContext = (function () {
       var strPath = window.document.location.pathname;
       var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
       return postPath;
        })();
        //异步加载数据
       	 var URL1 =  urlRootContext + "/user/benifit_data_class1.do"; //请求的网址
       	 var URL2 =  urlRootContext + "/user/benifit_data_class2.do"; //请求的网址
       	 var URL3 =  urlRootContext + "/user/benifit_data_class3.do"; //请求的网址

	   $('#submit').click(function(){
	   var myChart1 = echarts.init(document.getElementById('chart1'));
	    var Name = $("#benefit").val();
	    var reqParams={'Name':Name};
 		var datalist1 = new Array();
   		var datalist2 = new Array();
   		var datalist3 = new Array();
   		var datalist4 = new Array();
   		var datalist5 = new Array();
 		var datalist6 = new Array();
 		var datalist7 = new Array();
 		var datalist8 = new Array();
 		var datalist9 = new Array();
 		var datalist10 = new Array();
 		var datalist11 = new Array();
 		//series用于显示
 		var series=[];
 		$.ajax({
 			type: "POST",
	        url:URL1,
	        cache: false,
	        data: reqParams,
	        async:false,
	        dataType:"json",
	        traditional:true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
	        success: function(data){
	       
	        $("#benefit option:selected").each(function(){
	        if($(this).val()=="工业拉升效益"){
        		$.each(data.工业拉升效益, function (index, item) {
 			 	 datalist1.push(item.value);
 			 	});
 			 	series.push({
		            name:'工业拉升效益',
		            type:'line',
		            data:datalist1,
       			 });
	        }
	         if($(this).val()=="经济拉升效益"){
	         $.each(data.经济拉升效益, function (index, item) {
  			 	 datalist2.push(item.value);
  			 });
  			 series.push({
		            name:'经济拉升效益',
		            type:'line',
		            data:datalist2,
       			 });
	         }	 
	        
	         if($(this).val()=="居民拉升效益"){
	         
	         $.each(data.居民拉升效益, function (index, item) {
  			 	 datalist3.push(item.value);
  			 });
  			  series.push({
		            name:'居民拉升效益',
		            type:'line',
		            data:datalist3,
       			 });
  			 	
	         }
	         
	         if($(this).val()=="商业拉升效益"){
	         $.each(data.商业拉升效益, function (index, item) {
  			 	 datalist4.push(item.value);
  			 });
  			  series.push({
		            name:'商业拉升效益',
		            type:'line',
		            data:datalist4,
       			 });	
	         }
	          if($(this).val()=="降低线损效益"){
	         $.each(data.降低线损效益, function (index, item) {
  			 	 datalist5.push(item.value);
  			 });
  			  series.push({
		            name:'降低线损效益',
		            type:'line',
		            data:datalist5,
       			 });	
	         }
	          if($(this).val()=="精准投资效益"){
	         $.each(data.精准投资效益, function (index, item) {
  			 	 datalist6.push(item.value);
  			 });	
  			  series.push({
		            name:'精准投资效益',
		            type:'line',
		            data:datalist6,
       			 });
	         }
	          if($(this).val()=="馈线自动化运维效益"){
	         $.each(data.馈线自动化运维效益, function (index, item) {
  			 	 datalist7.push(item.value);
  			 });	
  			  series.push({
		            name:'馈线自动化运维效益',
		            type:'line',
		            data:datalist7,
       			 });
	         }
	          if($(this).val()=="人员人身安全效益"){
	         $.each(data.人员人身安全效益, function (index, item) {
  			 	 datalist8.push(item.value);
  			 });	
  			  series.push({
		            name:'人员人身安全效益',
		            type:'line',
		            data:datalist8,
       			 });
	         }
	          if($(this).val()=="远程遥控效益"){
	         $.each(data.远程遥控效益, function (index, item) {
  			 	 datalist9.push(item.value);
  			 });	
  			 series.push({
		            name:'远程遥控效益',
		            type:'line',
		            data:datalist9,
       			 });
	         }
	          if($(this).val()=="运行监视效益"){
	         $.each(data.运行监视效益, function (index, item) {
  			 	 datalist10.push(item.value);
  			 });	
  			 series.push({
		            name:'运行监视效益',
		            type:'line',
		            data:datalist10,
       			 });
	         }	
	         if($(this).val()=="增供电量效益"){
	         $.each(data.增供电量效益, function (index, item) {
  			 	 datalist11.push(item.value);
  			 });
  			 series.push({
		            name:'增供电量效益',
		            type:'line',
		            data:datalist11,
       			 });	
	         } 
	        
	        });	
	        },
	        error: function(e){
            	alert("查询失败:" + e);
            	        },
 		});
 		myChart1.clear();//清除echarts加载的缓存
		 	option1 = {
		 	
		    title: {
		        text: '类别1——配电自动化关联分析',
		         x:'left'
		    },
		     tooltip: {
		              trigger: 'axis', 
		              formatter: function(datas) 
		              {
		                  var res = datas[0].name + '<br/>', val;
		                  for(var i = 0, length = datas.length; i < length; i++) {
		                        val = (datas[i].value) + ' 万元';
		                        res += datas[i].seriesName + '：' + val + '<br/>';
		                    }
		                    return res;
		               },
					    axisPointer: {
							type: 'cross'
						},
					  backgroundColor: '#7FFFD4',
		              borderWidth: 1,
		              borderColor: '#ccc',
		              padding: 10,
		              textStyle: {
		              color: '#000'
		            },
		          	},
		    legend: {
		     	x: 'center',
		        top: 30,
		        data:Name
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
		        data: ['青岛','淄博','烟台','潍坊','临沂']
		    },
		    yAxis: {
		        type: 'value',
		        axisLabel: {
		        formatter: '{value}'
		        }
		    },
		     series: series,
		};
 		myChart1.setOption(option1);
 
 });
 
  $('#submit').click(function(){
	   var myChart2 = echarts.init(document.getElementById('chart2'));
	    var Name = $("#benefit").val();
	    var reqParams={'Name':Name};
 		var datalist1 = new Array();
   		var datalist2 = new Array();
   		var datalist3 = new Array();
   		var datalist4 = new Array();
   		var datalist5 = new Array();
 		var datalist6 = new Array();
 		var datalist7 = new Array();
 		var datalist8 = new Array();
 		var datalist9 = new Array();
 		var datalist10 = new Array();
 		var datalist11 = new Array();
 		//series用于显示
 		var series=[];
 		$.ajax({
 			type: "POST",
	        url:URL2,
	        cache: false,
	        data: reqParams,
	        async:false,
	        dataType:"json",
	        traditional:true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
	        success: function(data){
	        
	        $("#benefit option:selected").each(function(){
	        if($(this).val()=="工业拉升效益"){
        		$.each(data.工业拉升效益, function (index, item) {
 			 	 datalist1.push(item.value);
 			 	});
 			 	series.push({
		            name:'工业拉升效益',
		            type:'line',
		            data:datalist1,
       			 });
	        }
	         if($(this).val()=="经济拉升效益"){
	         $.each(data.经济拉升效益, function (index, item) {
  			 	 datalist2.push(item.value);
  			 });
  			 series.push({
		            name:'经济拉升效益',
		            type:'line',
		            data:datalist2,
       			 });
	         }	 
	        
	         if($(this).val()=="居民拉升效益"){
	         
	         $.each(data.居民拉升效益, function (index, item) {
  			 	 datalist3.push(item.value);
  			 });
  			  series.push({
		            name:'居民拉升效益',
		            type:'line',
		            data:datalist3,
       			 });
  			 	
	         }
	         
	         if($(this).val()=="商业拉升效益"){
	         $.each(data.商业拉升效益, function (index, item) {
  			 	 datalist4.push(item.value);
  			 });
  			  series.push({
		            name:'商业拉升效益',
		            type:'line',
		            data:datalist4,
       			 });	
	         }
	          if($(this).val()=="降低线损效益"){
	         $.each(data.降低线损效益, function (index, item) {
  			 	 datalist5.push(item.value);
  			 });
  			  series.push({
		            name:'降低线损效益',
		            type:'line',
		            data:datalist5,
       			 });	
	         }
	          if($(this).val()=="精准投资效益"){
	         $.each(data.精准投资效益, function (index, item) {
  			 	 datalist6.push(item.value);
  			 });	
  			  series.push({
		            name:'精准投资效益',
		            type:'line',
		            data:datalist6,
       			 });
	         }
	          if($(this).val()=="馈线自动化运维效益"){
	         $.each(data.馈线自动化运维效益, function (index, item) {
  			 	 datalist7.push(item.value);
  			 });	
  			  series.push({
		            name:'馈线自动化运维效益',
		            type:'line',
		            data:datalist7,
       			 });
	         }
	          if($(this).val()=="人员人身安全效益"){
	         $.each(data.人员人身安全效益, function (index, item) {
  			 	 datalist8.push(item.value);
  			 });	
  			  series.push({
		            name:'人员人身安全效益',
		            type:'line',
		            data:datalist8,
       			 });
	         }
	          if($(this).val()=="远程遥控效益"){
	         $.each(data.远程遥控效益, function (index, item) {
  			 	 datalist9.push(item.value);
  			 });	
  			 series.push({
		            name:'远程遥控效益',
		            type:'line',
		            data:datalist9,
       			 });
	         }
	          if($(this).val()=="运行监视效益"){
	         $.each(data.运行监视效益, function (index, item) {
  			 	 datalist10.push(item.value);
  			 });	
  			 series.push({
		            name:'运行监视效益',
		            type:'line',
		            data:datalist10,
       			 });
	         }	
	         if($(this).val()=="增供电量效益"){
	         $.each(data.增供电量效益, function (index, item) {
  			 	 datalist11.push(item.value);
  			 });
  			 series.push({
		            name:'增供电量效益',
		            type:'line',
		            data:datalist11,
       			 });	
	         } 
	        
	        });	
	        },
	        error: function(e){
            	alert("查询失败:" + e);
            	        },
 		});
 		myChart2.clear();//清除echarts加载的缓存
		 option2 = {
		    title: {
		        text: '类别2——配电自动化关联分析',
		         x:'left'
		    },
		     tooltip: {
		              trigger: 'axis', 
		              formatter: function(datas) 
		              {
		                  var res = datas[0].name + '<br/>', val;
		                  for(var i = 0, length = datas.length; i < length; i++) {
		                        val = (datas[i].value) + ' 万元';
		                        res += datas[i].seriesName + '：' + val + '<br/>';
		                    }
		                    return res;
		               },
					    axisPointer: {
							type: 'cross'
						},
					  backgroundColor: '#7FFFD4',
		              borderWidth: 1,
		              borderColor: '#ccc',
		              padding: 10,
		              textStyle: {
		              color: '#000'
		            },
		          	},
		    legend: {
		     	x: 'center',
		        top: 30,
		        data:Name
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
		          data: ['威海','日照','莱芜','滨州']
		    },
		    yAxis: {
		        type: 'value',
		        axisLabel: {
		        formatter: '{value}'
		        }
		    },
		    series: series,
		};
 		myChart2.setOption(option2);
 
 });
 
 
 
   $('#submit').click(function(){
	   var myChart3 = echarts.init(document.getElementById('chart3'));
	    var Name = $("#benefit").val();
	    var reqParams={'Name':Name};
 		var datalist1 = new Array();
   		var datalist2 = new Array();
   		var datalist3 = new Array();
   		var datalist4 = new Array();
   		var datalist5 = new Array();
 		var datalist6 = new Array();
 		var datalist7 = new Array();
 		var datalist8 = new Array();
 		var datalist9 = new Array();
 		var datalist10 = new Array();
 		var datalist11 = new Array();
 		//series用于显示
 		var series=[];
 		$.ajax({
 			type: "POST",
	        url:URL3,
	        cache: false,
	        data: reqParams,
	        async:false,
	        dataType:"json",
	        traditional:true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
	        success: function(data){
	        
	        $("#benefit option:selected").each(function(){
	        if($(this).val()=="工业拉升效益"){
        		$.each(data.工业拉升效益, function (index, item) {
 			 	 datalist1.push(item.value);
 			 	});
 			 	series.push({
		            name:'工业拉升效益',
		            type:'line',
		            data:datalist1,
       			 });
	        }
	         if($(this).val()=="经济拉升效益"){
	         $.each(data.经济拉升效益, function (index, item) {
  			 	 datalist2.push(item.value);
  			 });
  			 series.push({
		            name:'经济拉升效益',
		            type:'line',
		            data:datalist2,
       			 });
	         }	 
	        
	         if($(this).val()=="居民拉升效益"){
	         
	         $.each(data.居民拉升效益, function (index, item) {
  			 	 datalist3.push(item.value);
  			 });
  			  series.push({
		            name:'居民拉升效益',
		            type:'line',
		            data:datalist3,
       			 });
	         }
	         
	         if($(this).val()=="商业拉升效益"){
	         $.each(data.商业拉升效益, function (index, item) {
  			 	 datalist4.push(item.value);
  			 });
  			  series.push({
		            name:'商业拉升效益',
		            type:'line',
		            data:datalist4,
       			 });	
	         }
	          if($(this).val()=="降低线损效益"){
	         $.each(data.降低线损效益, function (index, item) {
  			 	 datalist5.push(item.value);
  			 });
  			  series.push({
		            name:'降低线损效益',
		            type:'line',
		            data:datalist5,
       			 });	
	         }
	          if($(this).val()=="精准投资效益"){
	         $.each(data.精准投资效益, function (index, item) {
  			 	 datalist6.push(item.value);
  			 });	
  			  series.push({
		            name:'精准投资效益',
		            type:'line',
		            data:datalist6,
       			 });
	         }
	          if($(this).val()=="馈线自动化运维效益"){
	         $.each(data.馈线自动化运维效益, function (index, item) {
  			 	 datalist7.push(item.value);
  			 });	
  			  series.push({
		            name:'馈线自动化运维效益',
		            type:'line',
		            data:datalist7,
       			 });
	         }
	          if($(this).val()=="人员人身安全效益"){
	         $.each(data.人员人身安全效益, function (index, item) {
  			 	 datalist8.push(item.value);
  			 });	
  			  series.push({
		            name:'人员人身安全效益',
		            type:'line',
		            data:datalist8,
       			 });
	         }
	          if($(this).val()=="远程遥控效益"){
	         $.each(data.远程遥控效益, function (index, item) {
  			 	 datalist9.push(item.value);
  			 });	
  			 series.push({
		            name:'远程遥控效益',
		            type:'line',
		            data:datalist9,
       			 });
	         }
	          if($(this).val()=="运行监视效益"){
	         $.each(data.运行监视效益, function (index, item) {
  			 	 datalist10.push(item.value);
  			 });	
  			 series.push({
		            name:'运行监视效益',
		            type:'line',
		            data:datalist10,
       			 });
	         }	
	         if($(this).val()=="增供电量效益"){
	         $.each(data.增供电量效益, function (index, item) {
  			 	 datalist11.push(item.value);
  			 });
  			 series.push({
		            name:'增供电量效益',
		            type:'line',
		            data:datalist11,
       			 });	
	         } 
	        
	        });	
	        },
	        error: function(e){
            	alert("查询失败:" + e);
            	        },
 		});
 		myChart3.clear();//清除echarts加载的缓存
		 	option3 = {
		    title: {
		        text: '类别3——配电自动化关联分析',
		         x:'left'
		    },
		     tooltip: {
		              trigger: 'axis', 
		              formatter: function(datas) 
		              {
		                  var res = datas[0].name + '<br/>', val;
		                  for(var i = 0, length = datas.length; i < length; i++) {
		                        val = (datas[i].value) + ' 万元';
		                        res += datas[i].seriesName + '：' + val + '<br/>';
		                    }
		                    return res;
		               },
					    axisPointer: {
							type: 'cross'
						},
					  backgroundColor: '#7FFFD4',
		              borderWidth: 1,
		              borderColor: '#ccc',
		              padding: 10,
		              textStyle: {
		              color: '#000'
		            },
		          	},
		    legend: {
		     	x: 'center',
		        top: 30,
		        data:Name
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
		        data: ['济南','枣庄','东营','济宁','泰安','德州','聊城','菏泽']
		    },
		    yAxis: {
		        type: 'value',
		        axisLabel: {
		        formatter: '{value}'
		        }
		    },
		    series: series,
		};
 		myChart3.setOption(option3);
 
 });


</script>



</body>
</html>