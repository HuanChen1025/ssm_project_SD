<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>计算界面</title>
        <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
        <script src="https://cdn.bootcss.com/echarts/3.7.0/echarts.js"></script>
        <script type="text/javascript">
        $(function() {
            $('#social_benefit').select2({
                placeholder: "请选择社会效益值",
                templateResult: formatState,
                width: '512px'
            });

            function formatState(state) {
                if (!state.id) { return state.text; }
                var $state = $(
                    '<span>' + state.text + '</span>'
                );
                return $state;
            };

            $('#enterprise_benefit').select2({
                placeholder: "请选择企业效益值",
                templateResult: formatState,
                width: '512px'
            });

            $('#cost').select2({
                placeholder: "请选择成本值",
                templateResult: formatState,
                width: '512px'
            });

            //time
            $('#time').select2({
                placeholder: "请选择查询时间",
                templateResult: formatState,
                width: '512px'
            });

        });
        </script>
    </head>

    <body>
        <div class="panel panel-info" style="width:900px; margin: 20px auto 20px">
            <div class="panel-heading">
                <h3 class="panel-title">查询</h3>
            </div>
            <div class="panel-body">
                <label class="control-label">社会效益: &nbsp;&nbsp;&nbsp;</label>
                <select class="combox" id="social_benefit" name="tagId" multiple>
                    <optgroup label="社会效益">
                        <option value="工业拉升效益">工业拉升效益</option>
                        <option value="经济拉升效益">经济拉升效益</option>
                        <option value="居民拉升效益">居民拉升效益</option>
                        <option value="商业拉升效益">商业拉升效益</option>
                    </optgroup>
                </select>
                </br>
                </br>
                <label class="control-label">企业效益: &nbsp;&nbsp;&nbsp;</label>
                <select class="combox" id="enterprise_benefit" name="tagId" multiple>
                    <optgroup label="企业效益">
                        <option value="增供电量效益">增供电量效益</option>
                        <option value="远程遥控效益">远程遥控效益</option>
                        <option value="降低线损效益">降低线损效益</option>
                        <option value="馈线自动化运维效益">馈线自动化运维效益</option>
                        <option value="运行监视效益">运行监视效益</option>
                    </optgroup>
                </select>
                </br>
                </br>
                <label class="control-label">投入成本: &nbsp;&nbsp;&nbsp;</label>
                <select class="combox" id="cost" name="tagId" multiple>
                    <optgroup label="运维成本">
                        <option value="运维成本">运维成本</option>
                    </optgroup>
                    <optgroup label="建设成本">
                        <option value="一次设备">一次设备</option>
                        <option value="终端">终端</option>
                        <option value="通信网络">通信网络</option>
                        <option value="主站">主站</option>
                        <option value="安装调试">安装调试</option>
                    </optgroup>
                </select>
                </br>
                </br>
                <label class="control-label">查询时间: &nbsp;&nbsp;&nbsp;</label>
                <select class="combox" id="time" name="tagId" multiple>
                    <optgroup label="查询时间">
                        <option value="2013">2013</option>
                        <option value="2014">2014</option>
                        <option value="2015">2015</option>
                        <option value="2016">2016</option>
                        <option value="2017">2017</option>
                    </optgroup>
                </select>
                </br>
                </br>
                <div class="row">
                    <div class="col-lg-2">
                        <label class="control-label">投入产出比计算： &nbsp;&nbsp;&nbsp;</label>
                    </div>
                    <div class="col-lg-8">
                        <div align="center" id="numerator">应用效益</div>
                        <div style="border-top:1px solid black; " align="center" id="denominator">投入成本</div>
                    </div>
                </div>
                <br>
                <button id="submit" class="btn-primary" type="button" style="width:100px">查询</button>
            </div>
        </div>
        <div class="row">
            <div id="barChart1" class="col-lg-6  col-md-6" style="height:450px;"></div>
            <div id="chart1" class="col-lg-6  col-md-6" style="height:450px;"></div>
        </div>
        <div class="row">
            <div id="barChart2" class="col-lg-6 col-md-6" style="height:450px;"></div>
            <div id="chart2" class="col-lg-6 col-md-6" style="height:450px;"></div>
        </div>
        <div class="row">
            <div id="barChart3" class="col-lg-6  col-md-6" style="height:450px;"></div>
            <div id="chart3" class="col-lg-6  col-md-6" style="height:450px;"></div>
        </div>
        <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例，类别1的投入产出比
        var myChart1 = echarts.init(document.getElementById('chart1'));
        // 指定图表的配置项和数据
        var option1 = {
            title: {
                text: '类别1投入产出比'
            },
            tooltip: {},

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
        myChart1.setOption(option1);

        // 基于准备好的dom，初始化echarts实例，类别2的投入产出比
        var myChart2 = echarts.init(document.getElementById('chart2'));
        // 指定图表的配置项和数据
        var option2 = {
            title: {
                text: '类别2投入产出比'
            },
            tooltip: {},

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
        myChart2.setOption(option2);
        // 基于准备好的dom，初始化echarts实例，类别3的投入产出比
        var myChart3 = echarts.init(document.getElementById('chart3'));
        // 指定图表的配置项和数据
        var option3 = {
            title: {
                text: '类别3投入产出比'
            },
            tooltip: {},

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
        myChart3.setOption(option3);

        // 基于准备好的dom，初始化echarts实例，类别3的投入产出比
        var myChart4 = echarts.init(document.getElementById('barChart1'));
        // 指定图表的配置项和数据
        var option4 = {
            title: {
                text: '类别1-投入产出值'
            },
            tooltip: {},

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
        myChart4.setOption(option4);

        // 基于准备好的dom，初始化echarts实例，类别3的投入产出比
        var myChart5 = echarts.init(document.getElementById('barChart2'));
        // 指定图表的配置项和数据
        var option5 = {
            title: {
                text: '类别2-投入产出值'
            },
            tooltip: {},

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
        myChart5.setOption(option5);
        // 基于准备好的dom，初始化echarts实例，类别3的投入产出比
        var myChart6 = echarts.init(document.getElementById('barChart3'));
        // 指定图表的配置项和数据
        var option6 = {
            title: {
                text: '类别3-投入产出值'
            },
            tooltip: {},

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
        myChart6.setOption(option6);
        </script>
        <script type="text/javascript">
        //获取当前项目的路径
        var urlRootContext = (function() {
            var strPath = window.document.location.pathname;
            var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
            return postPath;
        })();

        //异步加载数据
        var URL1 = urlRootContext + "/user/benifit_cost_class1.do"; //请求类别1投入产出的网址
        var URL2 = urlRootContext + "/user/benifit_cost_class2.do"; //请求类别2投入产出的网址
        var URL3 = urlRootContext + "/user/benifit_cost_class3.do"; //请求类别3投入产出的网址
        var URL4 = urlRootContext + "/user/benifit_data_class1.do"; //请求类别1投入产出的网址
        var URL5 = urlRootContext + "/user/benifit_data_class2.do"; //请求类别1投入产出的网址
        var URL6 = urlRootContext + "/user/benifit_data_class3.do"; //请求类别1投入产出的网址

        $('#submit').click(function() {
            var social_benefit = $("#social_benefit").val();
            var enterprise_benefit = $("#enterprise_benefit").val();
            var cost = $("#cost").val();
            var temp = social_benefit.concat(enterprise_benefit); //合并两个数组，用于ajax请求
            var time = $("#time").val();
            var reqParams = { 'benefitName': temp, 'costName': cost, 'time': time };
            //datalist1和datalist2用于存放公式的分子和分母
            var datalist1 = new Array();
            var datalist2 = new Array();
            //datalist_calss1,2,3是用于存放y轴显示的值的
            var datalist_calss1 = new Array();
            var datalist_calss2 = new Array();
            var datalist_calss3 = new Array();
            $.each(social_benefit, function() {
                datalist1.push(this);
                datalist1.push(' + ');

            });
            $.each(enterprise_benefit, function() {
                datalist1.push(this);
                datalist1.push(' + ');
            });
            $.each(cost, function() {
                datalist2.push(this);
                datalist2.push(' + ');
            });
            //删除数组的最后一个元素，并且将数组结果添加到html页面指定位置中
            datalist1.pop();
            $('#numerator').html(datalist1);

            datalist2.pop();
            $('#denominator').html(datalist2);



            $.ajax({
                type: "POST",
                url: URL1,
                cache: false,
                data: reqParams,
                async: false,
                dataType: "json",
                traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                success: function(data) {
                    $.each(data.classData, function(index, item) {
                        datalist_calss1.push(item.value);
                    });
                },
                error: function(e) {
                    alert("查询失败:" + e);
                },
            });

            $.ajax({
                type: "POST",
                url: URL2,
                cache: false,
                data: reqParams,
                async: false,
                dataType: "json",
                traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                success: function(data) {
                    $.each(data.classData, function(index, item) {
                        datalist_calss2.push(item.value);
                    });
                },
                error: function(e) {
                    alert("查询失败:" + e);
                },
            });

            $.ajax({
                type: "POST",
                url: URL3,
                cache: false,
                data: reqParams,
                async: false,
                dataType: "json",
                traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                success: function(data) {
                    $.each(data.classData, function(index, item) {
                        datalist_calss3.push(item.value);
                    });
                },
                error: function(e) {
                    alert("查询失败:" + e);
                },
            });

            var option1 = {
                title: {
                    text: '类别1投入产出比',
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
                    data: ['2016']
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
                series: [{
                    name: '2016',
                    type: 'line',
                    data: datalist_calss1,
                }]

            };

            var option2 = {
                title: {
                    text: '类别2投入产出比',
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
                    data: ['2016']
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
                series: [{
                    name: '2016',
                    type: 'line',
                    data: datalist_calss2,
                }]

            };

            var option3 = {
                title: {
                    text: '类别3投入产出比',
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
                    data: ['2016']
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
                series: [{
                    name: '2016',
                    type: 'line',
                    data: datalist_calss3,
                }]

            };
            myChart1.clear(); //清除echarts加载的缓存
            myChart2.clear(); //清除echarts加载的缓存
            myChart3.clear(); //清除echarts加载的缓存
            myChart1.setOption(option1);
            myChart2.setOption(option2);
            myChart3.setOption(option3);

        });


        $('#submit').click(function() {
            var myChart4 = echarts.init(document.getElementById('barChart1'));
            var social_benefit = $("#social_benefit").val();
            var enterprise_benefit = $("#enterprise_benefit").val();
            var cost = $("#cost").val();
            var Name = new Array();
            var searchName = new Array();
            $.each(social_benefit, function() {
                searchName.push(this);
            });
            $.each(enterprise_benefit, function() {
                searchName.push(this);

            });
            $.each(cost, function() {
                searchName.push(this);
            });
            var time = $("#time").val();
            var reqParams = { 'Name': searchName, 'time': time };
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
            //series用于显示
            var series = [];
            $.ajax({
                type: "POST",
                url: URL4,
                cache: false,
                data: reqParams,
                async: false,
                dataType: "json",
                traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                success: function(data) {
                    $("#enterprise_benefit option:selected").each(function() {

                        if ($(this).val() == "降低线损效益") {
                            Name.push("降低线损效益");
                            $.each(data.降低线损效益, function(index, item) {
                                datalist5.push(item.value);
                            });
                            series.push({
                                name: '降低线损效益',
                                type: 'line',
                                data: datalist5,
                            });
                        }
                        if ($(this).val() == "精准投资效益") {
                            Name.push("精准投资效益");
                            $.each(data.精准投资效益, function(index, item) {
                                datalist6.push(item.value);
                            });
                            series.push({
                                name: '精准投资效益',
                                type: 'line',
                                data: datalist6,
                            });
                        }
                        if ($(this).val() == "馈线自动化运维效益") {
                            Name.push("馈线自动化运维效益");
                            $.each(data.馈线自动化运维效益, function(index, item) {
                                datalist7.push(item.value);
                            });
                            series.push({
                                name: '馈线自动化运维效益',
                                type: 'line',
                                data: datalist7,
                            });
                        }
                        if ($(this).val() == "人员人身安全效益") {
                            Name.push("人员人身安全效益");
                            $.each(data.人员人身安全效益, function(index, item) {
                                datalist8.push(item.value);
                            });
                            series.push({
                                name: '人员人身安全效益',
                                type: 'line',
                                data: datalist8,
                            });
                        }
                        if ($(this).val() == "远程遥控效益") {
                            Name.push("远程遥控效益");
                            $.each(data.远程遥控效益, function(index, item) {
                                datalist9.push(item.value);
                            });
                            series.push({
                                name: '远程遥控效益',
                                type: 'line',
                                data: datalist9,
                            });
                        }
                        if ($(this).val() == "运行监视效益") {
                            Name.push("运行监视效益");
                            $.each(data.运行监视效益, function(index, item) {
                                datalist10.push(item.value);
                            });
                            series.push({
                                name: '运行监视效益',
                                type: 'line',
                                data: datalist10,
                            });
                        }
                        if ($(this).val() == "增供电量效益") {
                            Name.push("增供电量效益");
                            $.each(data.增供电量效益, function(index, item) {
                                datalist11.push(item.value);
                            });
                            series.push({
                                name: '增供电量效益',
                                type: 'line',
                                data: datalist11,
                            });
                        }

                    });

                    $("#social_benefit option:selected").each(function() {
                        if ($(this).val() == "工业拉升效益") {
                            Name.push("工业拉升效益");
                            $.each(data.工业拉升效益, function(index, item) {
                                datalist1.push(item.value);
                            });
                            series.push({
                                name: '工业拉升效益',
                                type: 'line',
                                data: datalist1,
                            });
                        }
                        if ($(this).val() == "经济拉升效益") {
                            Name.push("经济拉升效益");
                            $.each(data.经济拉升效益, function(index, item) {
                                datalist2.push(item.value);
                            });
                            series.push({
                                name: '经济拉升效益',
                                type: 'line',
                                data: datalist2,
                            });
                        }

                        if ($(this).val() == "居民拉升效益") {
                            Name.push("居民拉升效益");
                            $.each(data.居民拉升效益, function(index, item) {
                                datalist3.push(item.value);
                            });
                            series.push({
                                name: '居民拉升效益',
                                type: 'line',
                                data: datalist3,
                            });

                        }

                        if ($(this).val() == "商业拉升效益") {
                            Name.push("商业拉升效益");
                            $.each(data.商业拉升效益, function(index, item) {
                                datalist4.push(item.value);
                            });
                            series.push({
                                name: '商业拉升效益',
                                type: 'line',
                                data: datalist4,
                            });
                        }

                    });

                    $("#cost option:selected").each(function() {
                        if ($(this).val() == "单位周期设备维修成本") {
                            Name.push("单位周期设备维修成本");
                            $.each(data.单位周期设备维修成本, function(index, item) {
                                datalist12.push(item.value);
                            });
                            series.push({
                                name: '单位周期设备维修成本',
                                type: 'line',
                                data: datalist12,
                            });
                        }
                        if ($(this).val() == "人员运维成本") {
                            Name.push("人员运维成本");
                            $.each(data.人员运维成本, function(index, item) {
                                datalist13.push(item.value);
                            });
                            series.push({
                                name: '人员运维成本',
                                type: 'line',
                                data: datalist13,
                            });
                        }

                        if ($(this).val() == "网络运维成本") {
                            Name.push("网络运维成本");
                            $.each(data.网络运维成本, function(index, item) {
                                datalist14.push(item.value);
                            });
                            series.push({
                                name: '网络运维成本',
                                type: 'line',
                                data: datalist14,
                            });

                        }

                        if ($(this).val() == "建设总成本") {
                            Name.push("建设总成本");
                            $.each(data.建设总成本, function(index, item) {
                                datalist15.push(item.value);
                            });
                            series.push({
                                name: '建设总成本',
                                type: 'line',
                                data: datalist15,
                            });
                        }

                    });


                },
                error: function(e) {
                    alert("查询失败:" + e);
                },
            });
            myChart4.clear(); //清除echarts加载的缓存
            option4 = {

                title: {
                    text: '类别1——投入产出查询值',
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
                    data: Name
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
            myChart4.setOption(option4);
        });











        $('#submit').click(function() {
            var myChart5 = echarts.init(document.getElementById('barChart2'));
            var social_benefit = $("#social_benefit").val();
            var enterprise_benefit = $("#enterprise_benefit").val();
            var cost = $("#cost").val();
            var Name = new Array();
            var searchName = new Array();
            $.each(social_benefit, function() {
                searchName.push(this);
            });
            $.each(enterprise_benefit, function() {
                searchName.push(this);

            });
            $.each(cost, function() {
                searchName.push(this);
            });
            var time = $("#time").val();
            var reqParams = { 'Name': searchName, 'time': time };
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
            //series用于显示
            var series = [];
            $.ajax({
                type: "POST",
                url: URL5,
                cache: false,
                data: reqParams,
                async: false,
                dataType: "json",
                traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                success: function(data) {
                    $("#enterprise_benefit option:selected").each(function() {

                        if ($(this).val() == "降低线损效益") {
                            Name.push("降低线损效益");
                            $.each(data.降低线损效益, function(index, item) {
                                datalist5.push(item.value);
                            });
                            series.push({
                                name: '降低线损效益',
                                type: 'line',
                                data: datalist5,
                            });
                        }
                        if ($(this).val() == "精准投资效益") {
                            Name.push("精准投资效益");
                            $.each(data.精准投资效益, function(index, item) {
                                datalist6.push(item.value);
                            });
                            series.push({
                                name: '精准投资效益',
                                type: 'line',
                                data: datalist6,
                            });
                        }
                        if ($(this).val() == "馈线自动化运维效益") {
                            Name.push("馈线自动化运维效益");
                            $.each(data.馈线自动化运维效益, function(index, item) {
                                datalist7.push(item.value);
                            });
                            series.push({
                                name: '馈线自动化运维效益',
                                type: 'line',
                                data: datalist7,
                            });
                        }
                        if ($(this).val() == "人员人身安全效益") {
                            Name.push("人员人身安全效益");
                            $.each(data.人员人身安全效益, function(index, item) {
                                datalist8.push(item.value);
                            });
                            series.push({
                                name: '人员人身安全效益',
                                type: 'line',
                                data: datalist8,
                            });
                        }
                        if ($(this).val() == "远程遥控效益") {
                            Name.push("远程遥控效益");
                            $.each(data.远程遥控效益, function(index, item) {
                                datalist9.push(item.value);
                            });
                            series.push({
                                name: '远程遥控效益',
                                type: 'line',
                                data: datalist9,
                            });
                        }
                        if ($(this).val() == "运行监视效益") {
                            Name.push("运行监视效益");
                            $.each(data.运行监视效益, function(index, item) {
                                datalist10.push(item.value);
                            });
                            series.push({
                                name: '运行监视效益',
                                type: 'line',
                                data: datalist10,
                            });
                        }
                        if ($(this).val() == "增供电量效益") {
                            Name.push("增供电量效益");
                            $.each(data.增供电量效益, function(index, item) {
                                datalist11.push(item.value);
                            });
                            series.push({
                                name: '增供电量效益',
                                type: 'line',
                                data: datalist11,
                            });
                        }

                    });

                    $("#social_benefit option:selected").each(function() {
                        if ($(this).val() == "工业拉升效益") {
                            Name.push("工业拉升效益");
                            $.each(data.工业拉升效益, function(index, item) {
                                datalist1.push(item.value);
                            });
                            series.push({
                                name: '工业拉升效益',
                                type: 'line',
                                data: datalist1,
                            });
                        }
                        if ($(this).val() == "经济拉升效益") {
                            Name.push("经济拉升效益");
                            $.each(data.经济拉升效益, function(index, item) {
                                datalist2.push(item.value);
                            });
                            series.push({
                                name: '经济拉升效益',
                                type: 'line',
                                data: datalist2,
                            });
                        }

                        if ($(this).val() == "居民拉升效益") {
                            Name.push("居民拉升效益");
                            $.each(data.居民拉升效益, function(index, item) {
                                datalist3.push(item.value);
                            });
                            series.push({
                                name: '居民拉升效益',
                                type: 'line',
                                data: datalist3,
                            });

                        }

                        if ($(this).val() == "商业拉升效益") {
                            Name.push("商业拉升效益");
                            $.each(data.商业拉升效益, function(index, item) {
                                datalist4.push(item.value);
                            });
                            series.push({
                                name: '商业拉升效益',
                                type: 'line',
                                data: datalist4,
                            });
                        }

                    });

                    $("#cost option:selected").each(function() {
                        if ($(this).val() == "单位周期设备维修成本") {
                            Name.push("单位周期设备维修成本");
                            $.each(data.单位周期设备维修成本, function(index, item) {
                                datalist12.push(item.value);
                            });
                            series.push({
                                name: '单位周期设备维修成本',
                                type: 'line',
                                data: datalist12,
                            });
                        }
                        if ($(this).val() == "人员运维成本") {
                            Name.push("人员运维成本");
                            $.each(data.人员运维成本, function(index, item) {
                                datalist13.push(item.value);
                            });
                            series.push({
                                name: '人员运维成本',
                                type: 'line',
                                data: datalist13,
                            });
                        }

                        if ($(this).val() == "网络运维成本") {
                            Name.push("网络运维成本");
                            $.each(data.网络运维成本, function(index, item) {
                                datalist14.push(item.value);
                            });
                            series.push({
                                name: '网络运维成本',
                                type: 'line',
                                data: datalist14,
                            });

                        }

                        if ($(this).val() == "建设总成本") {
                            Name.push("建设总成本");
                            $.each(data.建设总成本, function(index, item) {
                                datalist15.push(item.value);
                            });
                            series.push({
                                name: '建设总成本',
                                type: 'line',
                                data: datalist15,
                            });
                        }

                    });


                },
                error: function(e) {
                    alert("查询失败:" + e);
                },
            });
            myChart5.clear(); //清除echarts加载的缓存
            option5 = {

                title: {
                    text: '类别2——投入产出查询值',
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
                    data: Name
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
            myChart5.setOption(option5);
        });

        $('#submit').click(function() {
            var myChart6 = echarts.init(document.getElementById('barChart3'));
            var social_benefit = $("#social_benefit").val();
            var enterprise_benefit = $("#enterprise_benefit").val();
            var cost = $("#cost").val();
            var Name = new Array();
            var searchName = new Array();
            $.each(social_benefit, function() {
                searchName.push(this);
            });
            $.each(enterprise_benefit, function() {
                searchName.push(this);

            });
            $.each(cost, function() {
                searchName.push(this);
            });
            var time = $("#time").val();
            var reqParams = { 'Name': searchName, 'time': time };
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
            //series用于显示
            var series = [];
            $.ajax({
                type: "POST",
                url: URL6,
                cache: false,
                data: reqParams,
                async: false,
                dataType: "json",
                traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                success: function(data) {
                    $("#enterprise_benefit option:selected").each(function() {

                        if ($(this).val() == "降低线损效益") {
                            Name.push("降低线损效益");
                            $.each(data.降低线损效益, function(index, item) {
                                datalist5.push(item.value);
                            });
                            series.push({
                                name: '降低线损效益',
                                type: 'line',
                                data: datalist5,
                            });
                        }
                        if ($(this).val() == "精准投资效益") {
                            Name.push("精准投资效益");
                            $.each(data.精准投资效益, function(index, item) {
                                datalist6.push(item.value);
                            });
                            series.push({
                                name: '精准投资效益',
                                type: 'line',
                                data: datalist6,
                            });
                        }
                        if ($(this).val() == "馈线自动化运维效益") {
                            Name.push("馈线自动化运维效益");
                            $.each(data.馈线自动化运维效益, function(index, item) {
                                datalist7.push(item.value);
                            });
                            series.push({
                                name: '馈线自动化运维效益',
                                type: 'line',
                                data: datalist7,
                            });
                        }
                        if ($(this).val() == "人员人身安全效益") {
                            Name.push("人员人身安全效益");
                            $.each(data.人员人身安全效益, function(index, item) {
                                datalist8.push(item.value);
                            });
                            series.push({
                                name: '人员人身安全效益',
                                type: 'line',
                                data: datalist8,
                            });
                        }
                        if ($(this).val() == "远程遥控效益") {
                            Name.push("远程遥控效益");
                            $.each(data.远程遥控效益, function(index, item) {
                                datalist9.push(item.value);
                            });
                            series.push({
                                name: '远程遥控效益',
                                type: 'line',
                                data: datalist9,
                            });
                        }
                        if ($(this).val() == "运行监视效益") {
                            Name.push("运行监视效益");
                            $.each(data.运行监视效益, function(index, item) {
                                datalist10.push(item.value);
                            });
                            series.push({
                                name: '运行监视效益',
                                type: 'line',
                                data: datalist10,
                            });
                        }
                        if ($(this).val() == "增供电量效益") {
                            Name.push("增供电量效益");
                            $.each(data.增供电量效益, function(index, item) {
                                datalist11.push(item.value);
                            });
                            series.push({
                                name: '增供电量效益',
                                type: 'line',
                                data: datalist11,
                            });
                        }

                    });

                    $("#social_benefit option:selected").each(function() {
                        if ($(this).val() == "工业拉升效益") {
                            Name.push("工业拉升效益");
                            $.each(data.工业拉升效益, function(index, item) {
                                datalist1.push(item.value);
                            });
                            series.push({
                                name: '工业拉升效益',
                                type: 'line',
                                data: datalist1,
                            });
                        }
                        if ($(this).val() == "经济拉升效益") {
                            Name.push("经济拉升效益");
                            $.each(data.经济拉升效益, function(index, item) {
                                datalist2.push(item.value);
                            });
                            series.push({
                                name: '经济拉升效益',
                                type: 'line',
                                data: datalist2,
                            });
                        }

                        if ($(this).val() == "居民拉升效益") {
                            Name.push("居民拉升效益");
                            $.each(data.居民拉升效益, function(index, item) {
                                datalist3.push(item.value);
                            });
                            series.push({
                                name: '居民拉升效益',
                                type: 'line',
                                data: datalist3,
                            });

                        }

                        if ($(this).val() == "商业拉升效益") {
                            Name.push("商业拉升效益");
                            $.each(data.商业拉升效益, function(index, item) {
                                datalist4.push(item.value);
                            });
                            series.push({
                                name: '商业拉升效益',
                                type: 'line',
                                data: datalist4,
                            });
                        }

                    });

                    $("#cost option:selected").each(function() {
                        if ($(this).val() == "单位周期设备维修成本") {
                            Name.push("单位周期设备维修成本");
                            $.each(data.单位周期设备维修成本, function(index, item) {
                                datalist12.push(item.value);
                            });
                            series.push({
                                name: '单位周期设备维修成本',
                                type: 'line',
                                data: datalist12,
                            });
                        }
                        if ($(this).val() == "人员运维成本") {
                            Name.push("人员运维成本");
                            $.each(data.人员运维成本, function(index, item) {
                                datalist13.push(item.value);
                            });
                            series.push({
                                name: '人员运维成本',
                                type: 'line',
                                data: datalist13,
                            });
                        }

                        if ($(this).val() == "网络运维成本") {
                            Name.push("网络运维成本");
                            $.each(data.网络运维成本, function(index, item) {
                                datalist14.push(item.value);
                            });
                            series.push({
                                name: '网络运维成本',
                                type: 'line',
                                data: datalist14,
                            });

                        }

                        if ($(this).val() == "建设总成本") {
                            Name.push("建设总成本");
                            $.each(data.建设总成本, function(index, item) {
                                datalist15.push(item.value);
                            });
                            series.push({
                                name: '建设总成本',
                                type: 'line',
                                data: datalist15,
                            });
                        }

                    });


                },
                error: function(e) {
                    alert("查询失败:" + e);
                },
            });
            myChart6.clear(); //清除echarts加载的缓存
            option6 = {

                title: {
                    text: '类别3——投入产出查询值',
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
                    data: Name
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
            myChart6.setOption(option6);
        });
        </script>
    </body>

    </html>