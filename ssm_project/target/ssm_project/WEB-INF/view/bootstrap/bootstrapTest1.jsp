<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bootstrap分页实例</title>
<link href="<%=request.getContextPath()%>/static/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/bootstrap/css/reveal.css">	
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap/js/bootstrap-paginator.min.js"></script>
 <script type="text/javascript">  
     var jQuery_2_1_4 = $.noConflict(true);  
 </script> 
<!-- Attach necessary scripts -->
<script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jQuery/jquery.reveal.js"></script>
 <script type="text/javascript">  
     var jQuery_1_4_4 = $.noConflict(true);  
</script>     
      
<style type="text/css">
#queryDiv {
 margin-right: auto;
 margin-left: auto;
 width:600px;
}
#textInput {
 margin-top: 10px;
 width: 220px;
 
}
#tableResult {
 margin-right: auto;
 margin-left: auto;
 width:80%;
}
td {
 width:80px;
 
}

body { font-family: "HelveticaNeue","Helvetica-Neue", "Helvetica", "Arial", sans-serif; }
.big-link { font-size: 15px; color: #06f;  text-align: none; }
.form_formula_control{
height:20px;
width:350px;
}
.formula_des_control{
width:350px;
height:80px;
}
.formula_button{
width:60px;
height:30px;
}
.button_control{
	float:right;
	margin-top: 20px;
}

</style>
</head>
<body>
	<div id = "queryDiv" >
		<input id = "textInput" type="text" placeholder="请输入公式名称，支持模糊查询" >
		<button id = "queryButton" class="btn btn-primary" type="button">查询</button>
	</div>
	<form id="form1">
		<table class="table table-bordered" id = 'tableResult'>
			<caption>公式查询结果</caption>
			<thead>
				<tr >
					<th>公式名称</th>
					<th>表达式</th>
					<th>解释</th>
					<th>操作</th>
				</tr >
			</thead>
			<tbody id="tableBody">	
			</tbody>
		</table>
		<!-- 底部分页按钮 -->
		<div id="bottomTab" ></div>
		<!-- 弹出层的代码，就这个不会，坑爹啊 -->
			<div id="myModal" class="reveal-modal"align="center" >
		
			<h1 >公式修改</h1>
			<table>
			<tr>
			<td><label >公式名称</label> </td>
			<td><input class="form_formula_control" type="text" id="formula_name"> </td>
			</tr>
			<tr>
			<td><label >表达式&nbsp;</label></td>
			<td><input class="form_formula_control" type="text" id="formula_content"></td>
			</tr>
			<tr>
			<td><label >公式解释&nbsp;&nbsp;&nbsp;</label></td>
			<td><textarea class="formula_des_control" id="formula_des"></textarea></td>
			</tr>
			</table>
			<div class="button_control">
			<button id="closeButton" type="button"  class="formula_button"  >关闭</button>
			<button type="button"  class="formula_button" onclick="updateFormula()">保存</button>
			</div>
			<a class="close-reveal-modal">&#215;</a>
			
			
		</div>
		
	</form>
	
	
	<script type='text/javascript'>    
	    var PAGESIZE = 10;
        var options = {  
            currentPage: 1,  //当前页数
            totalPages: 10,  //总页数，这里只是暂时的，后头会根据查出来的条件进行更改
            size:"normal",  
            alignment:"center",  
            itemTexts: function (type, page, current) {  
                switch (type) {  
                    case "first":  
                        return "第一页";  
                    case "prev":  
                        return "前一页";  
                    case "next":  
                        return "后一页";  
                    case "last":  
                        return "最后页";  
                    case "page":  
                        return  page;  
                }                 
            },  
            onPageClicked: function (e, originalEvent, type, page) {  
            	var userName = jQuery_2_1_4("#textInput").val(); //取内容
            	buildTable(userName,page,PAGESIZE);//默认每页最多10条
            }  
        }; 

        //获取当前项目的路径
        var urlRootContext = (function () {
            var strPath = window.document.location.pathname;
            var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
            return postPath;
        })();
        
       
        //生成表格
        function buildTable(userName,pageNumber,pageSize) {
        	 var url =  urlRootContext + "/user/list.do"; //请求的网址
             var reqParams = {'userName':userName, 'pageNumber':pageNumber,'pageSize':pageSize};//请求数据
             jQuery_2_1_4(function () {   
             	  jQuery_2_1_4.ajax({
             	        type:"POST",
             	        url:url,
             	        data:reqParams,
             	        async:false,
             	        dataType:"json",
             	        success: function(data){
             	      
             	            if(data.isError == false) {
             	           // options.totalPages = data.pages;
             	        var newoptions = {  
                        currentPage: 1,  //当前页数
                        totalPages: data.pages==0?1:data.pages,  //总页数
                        size:"normal",  
                        alignment:"center",  
                        itemTexts: function (type, page, current) {  
                        switch (type) {  
                            case "first":  
                            return "第一页";  
                            case "prev":  
                            return "前一页";  
                            case "next":  
                            return "后一页";  
                            case "last":  
                            return "最后页";  
                        case "page":  
                        return  page;  
                }                 
            },  
            onPageClicked: function (e, originalEvent, type, page) {  
            	var userName = jQuery_2_1_4("#textInput").val(); //取内容
            	buildTable(userName,page,PAGESIZE);//默认每页最多10条
            }  
         };             	           
         jQuery_2_1_4('#bottomTab').bootstrapPaginator("setOptions",newoptions); //重新设置总页面数目
         var dataList = data.dataList;
         jQuery_2_1_4("#tableBody").empty();//清空表格内容
         if (dataList.length > 0 ) {
             jQuery_2_1_4(dataList).each(function(){//重新生成
             	   // jQuery_2_1_4("#tableBody").append('<tr class="tab">');
                   //jQuery_2_1_4("#tableBody").append('<td>' + this.name + '</td>');
                   // jQuery_2_1_4("#tableBody").append('<td>' + this.content + '</td>');
                   // jQuery_2_1_4("#tableBody").append('<td>' + this.des + '</td>');
                  //  jQuery_2_1_4("#tableBody").append('<td>'+"<input type='button' id='btn1' value='修改' onclick='getTableContent(this)' />"+'</td>');
                  //  jQuery_2_1_4("#tableBody").append('</tr>');
                      jQuery_2_1_4("#tableBody").append('<tr class="tab">'+'<td>' + this.name + '</td>'+
             	    '<td>' + this.content + '</td>'+'<td>' + this.des + '</td>'+'<td>'+"<a href='javascript:void(0)' class='big-link' data-reveal-id='myModal' data-animation='fade'  onclick='getTableContent(this)'>修改</a>"+'</td>'
             	    +'</tr>'
             	    );
             	    });  
             	
             	    } else {             	            	
             	          jQuery_2_1_4("#tableBody").append('<tr><th colspan ="4"><center>查询无数据</center></th></tr>');
             	    }
             	    }else{
             	          alert(data.errorMsg);
             	            }
             	      },
             	        error: function(e){
             	           alert("查询失败:" + e);
             	        }
             	    });
               });
        
        }
        
        //渲染完就执行
        jQuery_2_1_4(function() {
        	
        	//生成底部分页栏
            jQuery_2_1_4('#bottomTab').bootstrapPaginator(options);     
        	
        	buildTable("",1,10);//默认空白查全部
        	
            //创建结算规则
            jQuery_2_1_4("#queryButton").bind("click",function(){
            	var userName = jQuery_2_1_4("#textInput").val();	
            	buildTable(userName,1,PAGESIZE);
            });
        });
        
        
      
        function getTableContent(node) {
         // 按钮的父节点的父节点是tr。  
        var tr1 = node.parentNode.parentNode; 
        var name= tr1.cells[0].innerText;
       // alert("第一次");
        var url =  urlRootContext + "/user/update.do"; //请求的网址
         var reqParams = {'name':name};//请求数据
         jQuery_2_1_4(function () { 
        jQuery_2_1_4.ajax({
         type: "POST",
         url:url,
         cache: false,
         data: reqParams,
         async:false,
         dataType:"json",
         success: function(data){
         	 //$("#detail_bno").val(data.bno);
         	 document.getElementById("formula_name").value=data.name;
         	 document.getElementById("formula_content").value=data.content;
         	  document.getElementById("formula_des").value=data.des;
         }
                 
        });
        });
		}
		
		//修改程序有问题，先放着，后面再改，弹出层可以考虑使用bootstrap来实现，可能会方便一些
		function updateFormula111(){
		  var url =  urlRootContext + "/user/updateSubmit.do"; //请求的网址
		  var Params ={
		  'name':document.getElementById("formula_name").value,
		  'content':document.getElementById("formula_content").value,
		  'des':document.getElementById("formula_des").value
		  }
		  jQuery_2_1_4(function () {
		  jQuery_2_1_4.ajax({
		   type: "POST",
	         url:url,
	         cache: false,
	         data: Params,
	         async:false,
	          success: function (data) {
	           if (data) {
                jQuery_2_1_4('#myModal').modal('hide');
                alert("修改成功");
                table.ajax.reload();
            } else {
                alert("修改出错");
            }
	      
	          }
		  });
		  
		  });
		
		}
    </script>
    
		
		
    
</body>

</html>