<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ch">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="左右结构项目，属于大人员的社交工具">
        <meta name="keywords" content="左右结构项目 社交 占座 ">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>Bootstrap左右结构响应式后台管理模板</title>
        <script src="<%=request.getContextPath()%>/static/css/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/static/css/bootstrap.min.js"></script>
        <link href="<%=request.getContextPath()%>/static/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/common.css" />
        
        <script>
            $(function() {
                $(".meun-item").click(function() {
                    $(".meun-item").removeClass("meun-item-active");
                    $(this).addClass("meun-item-active");
                    var itmeObj = $(".meun-item").find("img");
                    itmeObj.each(function() {
                        var items = $(this).attr("src");
                        items = items.replace("_grey.png", ".png");
                        items = items.replace(".png", "_grey.png")
                        $(this).attr("src", items);
                    });
                    var attrObj = $(this).find("img").attr("src");
                    ;
                    attrObj = attrObj.replace("_grey.png", ".png");
                    $(this).find("img").attr("src", attrObj);
                });
                $("#topAD").click(function() {
                    $("#topA").toggleClass(" glyphicon-triangle-right");
                    $("#topA").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topBD").click(function() {
                    $("#topB").toggleClass(" glyphicon-triangle-right");
                    $("#topB").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topCD").click(function() {
                    $("#topC").toggleClass(" glyphicon-triangle-right");
                    $("#topC").toggleClass(" glyphicon-triangle-bottom");
                });
                $(".toggle-btn").click(function() {
                    $("#leftMeun").toggleClass("show");
                    $("#rightContent").toggleClass("pd0px");
                })
            })

        </script>

        
    </head>

    <body>
			 <div id="wrap">
            <!-- 左侧菜单栏目块 -->
            <div class="leftMeun" id="leftMeun">
                <div id="logoDiv">
                    <p id="logoP"><img id="logo" alt="国网成效分析" src="../static/images/logo.png"><span>国网成效分析</span></p>
                </div>
               
                <div class="meun-title">差异化建设</div>
                <div class="meun-item meun-item-active"><img src="../static/images/icon_source.png"><a href="echart" target="mainframe">建设模式</a></div>
               	  <div class="meun-item"  ><img src="../static/images/icon_chara_grey.png"><a href="chart" target="mainframe">建设规模对比分析</a></div>
                <div class="meun-item"  ><img src="../static/images/icon_chara_grey.png">投入成本</div>
                 <div class="meun-item"  ><img src="../static/images/icon_chara_grey.png">投入成本对比分析</div>
                <div class="meun-item"  ><img src="../static/images/icon_user_grey.png"><a href="touziANDxiaoyi" target="mainframe">应用效益</a></div>
                 <div class="meun-item"  ><img src="../static/images/icon_user_grey.png"><a href="#" target="mainframe">应用效益对比分析</a></div>
                <div class="meun-item"  ><img src="../static/images/icon_user_grey.png"><a href="bootstrapTest1" target="mainframe">成效计算公式</a></div>
                <div class="meun-title">综合统计分析</div>
                <div class="meun-item" ><img src="../static/images/icon_house_grey.png">统计分析</div>
                <div class="meun-item" ><img src="../static/images/icon_card_grey.png"><a href="image" target="mainframe">建设模式可视化</a></div>
                <div class="meun-item" ><img src="../static/images/icon_card_grey.png"><a href="map" target="mainframe">综合结论</a></div>
              
            	
            </div>
            <!-- 右侧具体内容栏目 -->
        	 <div id="rightContent">
            <iframe id="mainframe" name="mainframe"   marginwidth="0" marginheight="0"
  			  frameborder="0" width="100%" scrolling="no" height="1000px" "></iframe>
       		</div>
			</div>
    
    <!-- 使iframe自适应的高度的代码，需要放在iframe的下方 -->

    
      <script type="text/javascript">
  //注意：下面的代码是放在和iframe同一个页面调用,放在iframe下面
    $("#mainframe").load(function () {
        var mainheight = $(this).contents().find("body").height() + 30;
        $(this).height(mainheight);
    });
        
	</script>  
    
    

   

</body>

</html>