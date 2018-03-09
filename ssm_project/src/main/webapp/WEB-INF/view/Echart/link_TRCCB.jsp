<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta charset="utf-8">
        <title>配电自动化关联分析</title>
        <!-- 引入JS和CSS文件 -->
        <script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
        <script src="<%=request.getContextPath()%>/static/js/bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/bootstrap/css/bootstrap.min.css">
        <link href="<%=request.getContextPath()%>/static/js/select2/select2.min.css" rel="stylesheet" />
        <script src="<%=request.getContextPath()%>/static/js/select2/select2.js"></script>
        <script src="<%=request.getContextPath()%>/static/js/echart/echarts.js"></script>
        <style type="text/css">

        </style>
        <script type="text/javascript">
        $(function() {
            $('#time').select2({
                placeholder: "请选择查询时间",
                templateResult: formatState,
                width: '200px'
            });

            function formatState(state) {
                if (!state.id) { return state.text; }
                var $state = $(
                    '<span>' + state.text + '</span>'
                );
                return $state;
            };
            $('#elementName').select2({
                placeholder: "请选择一个查询元素",
                templateResult: formatState,
                width: '200px'
            });

        });
        </script>
    </head>

    <body>
        <div class="panel panel-info" style="width:800px; margin: 20px auto 20px">
            <div class="panel-heading">
                <h3 class="panel-title">查询</h3>
            </div>
            <div class="panel-body">
                <label class="control-label" for="elementName">选择查询类型：</label>
                <select class="combox" id="elementName" name="recommenderId">
                    <option value="">请选择...</option>
                    <optgroup label="投入产出比">
                        <option value="企业投入产出比">企业投入产出比</option>
                        <option value="全社会投入产出比">全社会投入产出比</option>
                    </optgroup>
                    <optgroup label="增幅分析">
                        <option value="规模增幅">规模增幅</option>
                        <option value="成本增幅">成本增幅</option>
                        <option value="效益增幅">效益增幅</option>
                    </optgroup>
                    <optgroup label="敏感性分析">
                        <option value="设备价格下降">设备价格下降10%</option>
                        <option value="提高负载率">提高负载率</option>
                    </optgroup>
                </select>
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
            <div id="chart1" class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8" style="height:400px;"></div>
        </div>
        <div class="row">
            <div id="chart2" class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8" style="height:400px;"></div>
        </div>
        <div class="row">
            <div id="chart3" class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8" style="height:400px;"></div>
        </div>
        <script type="text/javascript">
        $(document).ready(function() {
            var myChart1 = echarts.init(document.getElementById('chart1'));
            var myChart2 = echarts.init(document.getElementById('chart2'));
            var myChart3 = echarts.init(document.getElementById('chart3'));
            option1 = {
                title: {
                    text: '类别1——配电自动化关联分析',
                    x: 'left'
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
                    x: 'center',
                    top: 30,
                    data: []
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: { readOnly: false },
                        magicType: { type: ['line', 'bar'] },
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['东营', '日照', '莱芜', '聊城', '菏泽']
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
                    x: 'left'
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
                    x: 'center',
                    top: 30,
                    data: ['应用效益']
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: { readOnly: false },
                        magicType: { type: ['line', 'bar'] },
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['青岛', '淄博', '枣庄', '威海']
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
                    x: 'left'
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
                    x: 'center',
                    top: 30,
                    data: ['应用效益']
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: { readOnly: false },
                        magicType: { type: ['line', 'bar'] },
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['济南', '烟台', '潍坊', '济宁', '泰安', '临沂', '德州', '滨州']
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


        });
        </script>
        <script type="text/javascript">
        //获取当前项目的路径
        var urlRootContext = (function() {
            var strPath = window.document.location.pathname;
            var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
            return postPath;
        })();
        //异步加载数据
        var URL1 = urlRootContext + "/user/benifit_link_cost1.do"; //请求的网址
        var URL2 = urlRootContext + "/user/benifit_link_cost2.do"; //请求的网址
        var URL3 = urlRootContext + "/user/benifit_link_cost3.do"; //请求的网址

        $('#submit').click(function() {
            var myChart1 = echarts.init(document.getElementById('chart1'));
            var time = $("#time").val();
            var name = $("#elementName").val();
            var reqParams = { 'name': name, 'searchTime': time };
            var datalist1 = new Array();
            var datalist2 = new Array();
            var datalist3 = new Array();
            var datalist4 = new Array();
            //series用于显示
            var series = [];
            $.ajax({
                type: "POST",
                url: URL1,
                cache: false,
                data: reqParams,
                async: false,
                dataType: "json",
                traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                success: function(data) {
                    $("#time option:selected").each(function() {
                        if ($(this).val() == "2013") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2013'], function(index, item) {
                                datalist1.push(item.value);

                            });
                            series.push({
                                name: '2013',
                                type: 'line',
                                data: datalist1,

                            });
                        }
                        if ($(this).val() == "2014") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2014'], function(index, item) {
                                datalist2.push(item.value);

                            });
                            series.push({
                                name: '2014',
                                type: 'line',
                                data: datalist2,
                            });
                        }
                        if ($(this).val() == "2015") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2015'], function(index, item) {
                                datalist3.push(item.value);

                            });
                            series.push({
                                name: '2015',
                                type: 'line',
                                data: datalist3,

                            });
                        }
                        if ($(this).val() == "2016") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2016'], function(index, item) {
                                datalist4.push(item.value);

                            });
                            series.push({
                                name: '2016',
                                type: 'line',
                                data: datalist4,

                            });
                        }

                    })
                },
                error: function(e) {
                    alert("查询失败:" + e);
                },
            });
            myChart1.clear(); //清除echarts加载的缓存
            option1 = {

                title: {
                    text: '类别1——配电自动化关联分析',
                    x: 'left'
                },
                tooltip: {
                    trigger: 'axis',
                    formatter: function(datas) {
                        var res = datas[0].name + '<br/>',
                            val;
                        for (var i = 0, length = datas.length; i < length; i++) {
                            val = (datas[i].value) + ' ';
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
                    data: time
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: { readOnly: false },
                        magicType: { type: ['line', 'bar'] },
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['东营', '日照', '莱芜', '聊城', '菏泽']
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

        $('#submit').click(function() {
            var myChart2 = echarts.init(document.getElementById('chart2'));
            var time = $("#time").val();
            var name = $("#elementName").val();
            var reqParams = { 'name': name, 'searchTime': time };
            var datalist1 = new Array();
            var datalist2 = new Array();
            var datalist3 = new Array();
            var datalist4 = new Array();
            //series用于显示
            var series = [];
            $.ajax({
                type: "POST",
                url: URL2,
                cache: false,
                data: reqParams,
                async: false,
                dataType: "json",
                traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                success: function(data) {

                    $("#time option:selected").each(function() {

                        if ($(this).val() == "2013") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2013'], function(index, item) {
                                datalist1.push(item.value);

                            });
                            series.push({
                                name: '2013',
                                type: 'line',
                                data: datalist1,

                            });
                        }
                        if ($(this).val() == "2014") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2014'], function(index, item) {
                                datalist2.push(item.value);

                            });
                            series.push({
                                name: '2014',
                                type: 'line',
                                data: datalist2,

                            });
                        }
                        if ($(this).val() == "2015") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2015'], function(index, item) {
                                datalist3.push(item.value);

                            });
                            series.push({
                                name: '2015',
                                type: 'line',
                                data: datalist3,

                            });
                        }
                        if ($(this).val() == "2016") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2016'], function(index, item) {
                                datalist4.push(item.value);

                            });
                            series.push({
                                name: '2016',
                                type: 'line',
                                data: datalist4,

                            });
                        }

                    })
                },
                error: function(e) {
                    alert("查询失败:" + e);
                },
            });
            myChart2.clear(); //清除echarts加载的缓存
            option2 = {
                title: {
                    text: '类别2——配电自动化关联分析',
                    x: 'left'
                },
                tooltip: {
                    trigger: 'axis',
                    formatter: function(datas) {
                        var res = datas[0].name + '<br/>',
                            val;
                        for (var i = 0, length = datas.length; i < length; i++) {
                            val = (datas[i].value) + ' ';
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
                    data: time
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: { readOnly: false },
                        magicType: { type: ['line', 'bar'] },
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['青岛', '淄博', '枣庄', '威海']
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

        $('#submit').click(function() {
            var myChart3 = echarts.init(document.getElementById('chart3'));
            var time = $("#time").val();
            var name = $("#elementName").val();
            var reqParams = { 'name': name, 'searchTime': time };
            var datalist1 = new Array();
            var datalist2 = new Array();
            var datalist3 = new Array();
            var datalist4 = new Array();
            //series用于显示
            var series = [];
            $.ajax({
                type: "POST",
                url: URL3,
                cache: false,
                data: reqParams,
                async: false,
                dataType: "json",
                traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                success: function(data) {
                    $("#time option:selected").each(function() {
                        if ($(this).val() == "2013") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2013'], function(index, item) {
                                datalist1.push(item.value);

                            });
                            series.push({
                                name: '2013',
                                type: 'line',
                                data: datalist1,

                            });
                        }
                        if ($(this).val() == "2014") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2014'], function(index, item) {
                                datalist2.push(item.value);

                            });
                            series.push({
                                name: '2014',
                                type: 'line',
                                data: datalist2,

                            });
                        }
                        if ($(this).val() == "2015") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2015'], function(index, item) {
                                datalist3.push(item.value);

                            });
                            series.push({
                                name: '2015',
                                type: 'line',
                                data: datalist3,

                            });
                        }
                        if ($(this).val() == "2016") {
                            //data后面直接加数字是不可行的，必须采用[]的形式来替代
                            $.each(data['2016'], function(index, item) {
                                datalist4.push(item.value);

                            });
                            series.push({
                                name: '2016',
                                type: 'line',
                                data: datalist4,

                            });
                        }


                    })
                },
                error: function(e) {
                    alert("查询失败:" + e);
                },
            });
            myChart3.clear(); //清除echarts加载的缓存
            option3 = {
                title: {
                    text: '类别3——配电自动化关联分析',
                    x: 'left'
                },
                tooltip: {
                    trigger: 'axis',
                    formatter: function(datas) {
                        var res = datas[0].name + '<br/>',
                            val;
                        for (var i = 0, length = datas.length; i < length; i++) {
                            val = (datas[i].value) + ' ';
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
                    data: time
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: { readOnly: false },
                        magicType: { type: ['line', 'bar'] },
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['济南', '烟台', '潍坊', '济宁', '泰安', '临沂', '德州', '滨州']
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