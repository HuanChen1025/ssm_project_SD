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
height: 120px;
margin-top: 10px;
margin-left: 26%;
}
#select option{
width:100px;
font-size: 15px;
}
.filed{
width: 500px;
height:80px;

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
.chartStyle{
width: 100%;
height:400px;

}

</style>
</head>
<body>
<div style="height: 1000px">
	<div id="select" >
    <div id="s">
    <fieldset class="filed">
    <legend>选择查询城市</legend>
	<input type="checkbox" name="test" value="37401"><label>济南</label>
	<input type="checkbox" name="test" value="37402"><label>青岛</label>
	<input type="checkbox" name="test" value="37403"><label>淄博</label>
	<input type="checkbox" name="test" value="37404"><label>枣庄</label>
	<input type="checkbox" name="test" value="37405"><label>东营</label>
	<input type="checkbox" name="test" value="37406"><label>烟台</label>
	<input type="checkbox" name="test" value="37407"><label>潍坊</label>
	<input type="checkbox" name="test" value="37408"><label>济宁</label>
	<input type="checkbox" name="test" value="37409"><label>泰安</label>
	<input type="checkbox" name="test" value="37410"><label>威海</label>
	<input type="checkbox" name="test" value="37411"><label>日照</label>
	<input type="checkbox" name="test" value="37412"><label>莱芜</label>
	<input type="checkbox" name="test" value="37413"><label>临沂</label>
	<input type="checkbox" name="test" value="37414"><label>德州</label>
	<input type="checkbox" name="test" value="37415"><label>聊城</label>
	<input type="checkbox" name="test" value="37416"><label>滨州</label>
	<input type="checkbox" name="test" value="37417"><label>菏泽</label>
	</fieldset>
	</div>
    </div>
    <div id="chart1" class="chartStyle"></div>
    <div id="chart2" class="chartStyle"></div>
    </div>
 <script type="text/javascript">
 	// 基于准备好的dom，初始化echarts实例
        	 var myChart1 = echarts.init(document.getElementById('chart1'));
       	  	// 指定图表的配置项和数据
       	  	var option ={
       	  	title: {
               text: '企业效益'
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
               text: '社会效益'
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
       	 var URL1 =  urlRootContext + "/user/contrastQuery_QYXY.do"; //请求企业效益的网址
         var URL2 =  urlRootContext + "/user/contrastQuery_SHXY.do"; //请求社会效益的网址
       		//点击后立马查询企业效益数据
   		$(':checkbox').click(function(){
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
   		//var cityName = $("#city").val();
       	var reqParams={'city':check_val};
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
 
 		//点击后立马查询社会效益数据
   		$(':checkbox').click(function(){
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
   		//var cityName = $("#city").val();
       	var reqParams={'city':check_val};
   		var datalist1 = new Array();
   		var datalist2 = new Array();
   		var datalist3 = new Array();
   		var datalist4 = new Array();
   		var datalist5 = new Array();
   		var elementlist = new Array();
   		$.ajax({
			type: "POST",
	        url:URL2,
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
   		myChart2.setOption(
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