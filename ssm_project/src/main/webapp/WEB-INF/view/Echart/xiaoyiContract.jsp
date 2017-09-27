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
        <style type="text/css">

        </style>
        <script type="text/javascript">
        $(function() {
            $('#cityName').select2({
                placeholder: "请至少选择一个地区",
                tags: true,
                createTag: function(decorated, params) {
                    return null;
                },
                width: '200px'
            });

            function formatState(state) {
                if (!state.id) { return state.text; }
                var $state = $(
                    '<span>' + state.text + '</span>'
                );
                return $state;
            };
            $('#time').select2({
                placeholder: "请选择一个时间",
                templateResult: formatState,
                width: '200px'
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
                    <div class="panel-body">
                        <label class="control-label" for="cityName">选择查询地区：</label>
                        <select class="combox" id="cityName" name="recommenderId" multiple>
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
                        <select class="combox" id="time" name="tagId">
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
                    <div id="chart1" class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8" style="height:400px;"></div>
                </div>
                <br>
                <br>
                <div class="row">
                    <div id="chart2" class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8" style="height:400px;"></div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('chart1'));
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '企业效益(单位：万元)'
            },
            tooltip: {
                trigger: 'axis',
                formatter: function(datas) {
                    var res = datas[0].name + '<br/>',
                        val;
                    for (var i = 0, length = datas.length; i < length; i++) {
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
                data: []
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
        var option = {
            title: {
                text: '社会效益(单位：万元)'
            },
            tooltip: {
                trigger: 'axis',
                formatter: function(datas) {
                    var res = datas[0].name + '<br/>',
                        val;
                    for (var i = 0, length = datas.length; i < length; i++) {
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
                data: []
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
        var urlRootContext = (function() {
            var strPath = window.document.location.pathname;
            var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
            return postPath;
        })();

        //异步加载数据
        var URL1 = urlRootContext + "/user/contrastQuery_QYXY.do"; //请求企业效益的网址
        var URL2 = urlRootContext + "/user/contrastQuery_SHXY.do"; //请求社会效益的网址
        //点击后立马查询企业效益数据
        $('#submit').click(function() {
            //获取选中CheckBox后的文字
            var check_name = new Array();
            $("input[name='test']:checked").each(function() {
                check_name.push($(this).next().text());
            });
            //alert(check_name);

            //获取选中的CheckBox的value值
            var check_val = new Array();
            $("input[name='test']:checked").each(function() {
                check_val.push($(this).val());
            });
            var cityName = $("#cityName").val();
            var time = $("#time").val();
            var reqParams = { 'city': cityName, 'time': time };
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
            var datalist12 = new Array();
            var datalist13 = new Array();
            var datalist14 = new Array();
            var datalist15 = new Array();
            var datalist16 = new Array();
            var datalist17 = new Array();
            var elementlist = new Array();
            //series用于显示
            var series = [];
            var legends = [];
            series.length = 0;
            console.log(series); // 输出 []，空数组，即被清空了  
            $.ajax({
                type: "POST",
                url: URL1,
                cache: false,
                data: reqParams,
                async: false,
                dataType: "json",
                traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                success: function(data) {
                    $("#cityName option:selected").each(function() {
                        if ($(this).val() == "37401") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37401'], function(index, item) {
                                datalist1.push(item.value);
                                elementlist.push(item.element_name);
                            });
                            legends.push('济南');
                            series.push({
                                name: '济南',
                                type: 'bar',
                                data: datalist1,
                                barWidth: 20
                            });
                        }
                        if ($(this).val() == "37402") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37402'], function(index, item) {
                                datalist2.push(item.value);
                                if (elementlist.length < datalist2.length)
                                    elementlist.push(item.element_name);
                            });
                            legends.push('青岛');
                            series.push({
                                name: '青岛',
                                type: 'bar',
                                data: datalist2,
                                barWidth: 20
                            });
                        }
                        if ($(this).val() == "37403") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37403'], function(index, item) {
                                datalist3.push(item.value);
                                if (elementlist.length < datalist3.length)
                                    elementlist.push(item.element_name);
                            });
                            legends.push('淄博');
                            series.push({
                                name: '淄博',
                                type: 'bar',
                                data: datalist3,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37404") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37404'], function(index, item) {
                                datalist4.push(item.value);
                                if (elementlist.length < datalist4.length)
                                    elementlist.push(item.element_name);
                            });
                            legends.push('枣庄');
                            series.push({
                                name: '枣庄',
                                type: 'bar',
                                data: datalist4,
                                barWidth: 20
                            });
                        }
                        if ($(this).val() == "37405") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37405'], function(index, item) {
                                datalist5.push(item.value);
                                if (elementlist.length < datalist5.length)
                                    elementlist.push(item.element_name);
                            });
                            legends.push('东营');
                            series.push({
                                name: '东营',
                                type: 'bar',
                                data: datalist5,
                                barWidth: 20
                            });
                        }
                        if ($(this).val() == "37406") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37406'], function(index, item) {
                                datalist6.push(item.value);
                                if (elementlist.length < datalist6.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('烟台');
                            series.push({
                                name: '烟台',
                                type: 'bar',
                                data: datalist6,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37407") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37407'], function(index, item) {
                                datalist7.push(item.value);
                                if (elementlist.length < datalist7.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('潍坊');
                            series.push({
                                name: '潍坊',
                                type: 'bar',
                                data: datalist7,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37408") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37408'], function(index, item) {
                                datalist8.push(item.value);
                                if (elementlist.length < datalist8.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('济宁');
                            series.push({
                                name: '济宁',
                                type: 'bar',
                                data: datalist8,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37409") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37409'], function(index, item) {
                                datalist9.push(item.value);
                                if (elementlist.length < datalist9.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('泰安');
                            series.push({
                                name: '泰安',
                                type: 'bar',
                                data: datalist9,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37410") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37410'], function(index, item) {
                                datalist10.push(item.value);
                                if (elementlist.length < datalist10.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('威海');
                            series.push({
                                name: '威海',
                                type: 'bar',
                                data: datalist10,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37411") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37411'], function(index, item) {
                                datalist11.push(item.value);
                                if (elementlist.length < datalist11.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('日照');
                            series.push({
                                name: '日照',
                                type: 'bar',
                                data: datalist11,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37412") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37412'], function(index, item) {
                                datalist12.push(item.value);
                                if (elementlist.length < datalist12.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('莱芜');
                            series.push({
                                name: '莱芜',
                                type: 'bar',
                                data: datalist12,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37413") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37413'], function(index, item) {
                                datalist13.push(item.value);
                                if (elementlist.length < datalist13.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('临沂');
                            series.push({
                                name: '临沂',
                                type: 'bar',
                                data: datalist13,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37414") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37414'], function(index, item) {
                                datalist14.push(item.value);
                                if (elementlist.length < datalist14.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('德州');
                            series.push({
                                name: '德州',
                                type: 'bar',
                                data: datalist14,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37415") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37415'], function(index, item) {
                                datalist15.push(item.value);
                                if (elementlist.length < datalist15.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('聊城');
                            series.push({
                                name: '聊城',
                                type: 'bar',
                                data: datalist15,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37416") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37416'], function(index, item) {
                                datalist16.push(item.value);
                                if (elementlist.length < datalist16.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('滨州');
                            series.push({
                                name: '滨州',
                                type: 'bar',
                                data: datalist16,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37417") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37417'], function(index, item) {
                                datalist17.push(item.value);
                                if (elementlist.length < datalist17.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('菏泽');
                            series.push({
                                name: '菏泽',
                                type: 'bar',
                                data: datalist17,
                                barWidth: 20
                            });

                        }

                    });
                },
                error: function(e) {
                    alert("查询失败:" + e);
                },
            });
            myChart1.clear();
            myChart1.setOption({
                title: {
                    text: '企业效益(单位：万元)'
                },
                tooltip: {
                    trigger: 'axis',
                    formatter: function(datas) {
                        var res = datas[0].name + '<br/>',
                            val;
                        for (var i = 0, length = datas.length; i < length; i++) {
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
                    data: legends
                },
                xAxis: {
                    data: elementlist,
                    axisLabel: {

                        interval: 0, //横轴坐标间interval为0

                    }
                },
                yAxis: {},
                series: series,
            });
        });

        //点击后立马查询社会效益数据
        $('#submit').click(function() {
            //获取选中CheckBox后的文字
            var check_name = new Array();
            $("input[name='test']:checked").each(function() {
                check_name.push($(this).next().text());
            });
            //alert(check_name);

            //获取选中的CheckBox的value值
            var check_val = new Array();
            $("input[name='test']:checked").each(function() {
                check_val.push($(this).val());
            });
            var cityName = $("#cityName").val();
            var time = $("#time").val();
            var reqParams = { 'city': cityName, 'time': time };
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
            var datalist12 = new Array();
            var datalist13 = new Array();
            var datalist14 = new Array();
            var datalist15 = new Array();
            var datalist16 = new Array();
            var datalist17 = new Array();
            var elementlist = new Array();
            //series用于显示
            var series = [];
            var legends = [];
            series.length = 0;
            console.log(series); // 输出 []，空数组，即被清空了  
            $.ajax({
                type: "POST",
                url: URL2,
                cache: false,
                data: reqParams,
                async: false,
                dataType: "json",
                traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                success: function(data) {
                    $("#cityName option:selected").each(function() {
                        if ($(this).val() == "37401") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37401'], function(index, item) {
                                datalist1.push(item.value);
                                elementlist.push(item.element_name);
                            });
                            legends.push('济南');
                            series.push({
                                name: '济南',
                                type: 'bar',
                                data: datalist1,
                                barWidth: 20
                            });
                        }
                        if ($(this).val() == "37402") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37402'], function(index, item) {
                                datalist2.push(item.value);
                                if (elementlist.length < datalist2.length)
                                    elementlist.push(item.element_name);
                            });
                            legends.push('青岛');
                            series.push({
                                name: '青岛',
                                type: 'bar',
                                data: datalist2,
                                barWidth: 20
                            });
                        }
                        if ($(this).val() == "37403") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37403'], function(index, item) {
                                datalist3.push(item.value);
                                if (elementlist.length < datalist3.length)
                                    elementlist.push(item.element_name);
                            });
                            legends.push('淄博');
                            series.push({
                                name: '淄博',
                                type: 'bar',
                                data: datalist3,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37404") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37404'], function(index, item) {
                                datalist4.push(item.value);
                                if (elementlist.length < datalist4.length)
                                    elementlist.push(item.element_name);
                            });
                            legends.push('枣庄');
                            series.push({
                                name: '枣庄',
                                type: 'bar',
                                data: datalist4,
                                barWidth: 20
                            });
                        }
                        if ($(this).val() == "37405") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37405'], function(index, item) {
                                datalist5.push(item.value);
                                if (elementlist.length < datalist5.length)
                                    elementlist.push(item.element_name);
                            });
                            legends.push('东营');
                            series.push({
                                name: '东营',
                                type: 'bar',
                                data: datalist5,
                                barWidth: 20
                            });
                        }
                        if ($(this).val() == "37406") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37406'], function(index, item) {
                                datalist6.push(item.value);
                                if (elementlist.length < datalist6.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('烟台');
                            series.push({
                                name: '烟台',
                                type: 'bar',
                                data: datalist6,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37407") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37407'], function(index, item) {
                                datalist7.push(item.value);
                                if (elementlist.length < datalist7.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('潍坊');
                            series.push({
                                name: '潍坊',
                                type: 'bar',
                                data: datalist7,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37408") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37408'], function(index, item) {
                                datalist8.push(item.value);
                                if (elementlist.length < datalist8.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('济宁');
                            series.push({
                                name: '济宁',
                                type: 'bar',
                                data: datalist8,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37409") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37409'], function(index, item) {
                                datalist9.push(item.value);
                                if (elementlist.length < datalist9.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('泰安');
                            series.push({
                                name: '泰安',
                                type: 'bar',
                                data: datalist9,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37410") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37410'], function(index, item) {
                                datalist10.push(item.value);
                                if (elementlist.length < datalist10.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('威海');
                            series.push({
                                name: '威海',
                                type: 'bar',
                                data: datalist10,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37411") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37411'], function(index, item) {
                                datalist11.push(item.value);
                                if (elementlist.length < datalist11.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('日照');
                            series.push({
                                name: '日照',
                                type: 'bar',
                                data: datalist11,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37412") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37412'], function(index, item) {
                                datalist12.push(item.value);
                                if (elementlist.length < datalist12.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('莱芜');
                            series.push({
                                name: '莱芜',
                                type: 'bar',
                                data: datalist12,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37413") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37413'], function(index, item) {
                                datalist13.push(item.value);
                                if (elementlist.length < datalist13.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('临沂');
                            series.push({
                                name: '临沂',
                                type: 'bar',
                                data: datalist13,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37414") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37414'], function(index, item) {
                                datalist14.push(item.value);
                                if (elementlist.length < datalist14.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('德州');
                            series.push({
                                name: '德州',
                                type: 'bar',
                                data: datalist14,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37415") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37415'], function(index, item) {
                                datalist15.push(item.value);
                                if (elementlist.length < datalist15.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('聊城');
                            series.push({
                                name: '聊城',
                                type: 'bar',
                                data: datalist15,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37416") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37416'], function(index, item) {
                                datalist16.push(item.value);
                                if (elementlist.length < datalist16.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('滨州');
                            series.push({
                                name: '滨州',
                                type: 'bar',
                                data: datalist16,
                                barWidth: 20
                            });

                        }
                        if ($(this).val() == "37417") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['37417'], function(index, item) {
                                datalist17.push(item.value);
                                if (elementlist.length < datalist17.length)
                                    elementlist.push(item.element_name);

                            });
                            legends.push('菏泽');
                            series.push({
                                name: '菏泽',
                                type: 'bar',
                                data: datalist17,
                                barWidth: 20
                            });

                        }

                    });

                },
                error: function(e) {
                    alert("查询失败:" + e);
                },
            });
            myChart2.clear();
            myChart2.setOption({
                title: {
                    text: '社会效益(单位：万元)'
                },
                tooltip: {
                    trigger: 'axis',
                    formatter: function(datas) {
                        var res = datas[0].name + '<br/>',
                            val;
                        for (var i = 0, length = datas.length; i < length; i++) {
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
                    data: legends
                },
                xAxis: {
                    data: elementlist
                },
                yAxis: {},
                series: series,

            });
        });
        </script>
    </body>

    </html>