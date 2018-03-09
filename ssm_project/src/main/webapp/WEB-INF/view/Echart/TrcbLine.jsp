<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta charset="utf-8">
        <title>投入成本分析(分类)</title>
        <!-- 引入JS和CSS文件 -->
       <script src="<%=request.getContextPath()%>/static/js/jQuery/jquery-2.1.4.min.js"></script>
        <script src="<%=request.getContextPath()%>/static/js/bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/bootstrap/css/bootstrap.min.css">
        <link href="<%=request.getContextPath()%>/static/js/select2/select2.min.css" rel="stylesheet" />
        <script src="<%=request.getContextPath()%>/static/js/select2/select2.js"></script>
        <script src="<%=request.getContextPath()%>/static/js/echart/echarts.js"></script>
        <style type="text/css">
        .chatStyle {
            height: 400px;
        }
        </style>
        <script type="text/javascript">
        $(function() {

            function formatState(state) {
                if (!state.id) { return state.text; }
                var $state = $(
                    '<span>' + state.text + '</span>'
                );
                return $state;
            };

            $('#time').select2({
                placeholder: "请选择查询时间",
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
            <div class="panel-body" style="padding-left:20%">
                <label class="control-label" for="time">选择查询时间：</label>
                <select class="combox" id="time" name="tagId" multiple>
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
        <div class="row ">
            <div id="chart1" class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8  chatStyle "></div>
        </div>
        <div class="row">
            <div id="chart2" class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8  chatStyle"></div>
        </div>
        <div class="row">
            <div id="chart3" class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8  chatStyle"></div>
        </div>
        <script type="text/javascript">
        $(document).ready(function() {
            var myChart1 = echarts.init(document.getElementById('chart1'));
            var myChart2 = echarts.init(document.getElementById('chart2'));
            var myChart3 = echarts.init(document.getElementById('chart3'));
            option1 = {
                title: {
                    text: '类别1——投入成本分析',
                    x: 'center'
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
                    data: ['运维成本', '建设成本', '总成本']
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
                    data: ['青岛', '淄博', '潍坊', '烟台', '临沂']
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value}'
                    }
                },
                series: [{
                        name: '运维成本',
                        type: 'line',
                        data: [21, 11, 15, 13, 15.4],
                    },
                    {
                        name: '建设成本',
                        type: 'line',
                        data: [16, 22, 21, 15.2, 18.2],
                    },
                    {
                        name: '总成本',
                        type: 'line',
                        data: [37, 33, 36, 28.2, 33.6],

                    }
                ]
            };

            option2 = {
                title: {
                    text: '类别2——投入成本分析',
                    x: 'center'
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
                    data: ['运维成本', '建设成本', '总成本']
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
                    data: ['滨州', '威海', '莱芜', '日照']
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value}'
                    }
                },
                series: [{
                        name: '运维成本',
                        type: 'line',
                        data: [21, 11, 15, 17],
                    },
                    {
                        name: '建设成本',
                        type: 'line',
                        data: [16, 22, 21, 15.2],
                    },
                    {
                        name: '总成本',
                        type: 'line',
                        data: [37, 33, 36, 32.2],
                    }
                ]
            };

            option3 = {
                title: {
                    text: '类别3——投入成本分析',
                    x: 'center'
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
                    data: ['运维成本', '建设成本', '总成本']
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
                    data: ['济南', '济宁', '德州', '泰安', '聊城', '枣庄', '菏泽', '东营']
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value}'
                    }
                },
                series: [{
                        name: '运维成本',
                        type: 'line',
                        data: [21, 11, 15, 13, 16, 18.2, 21, 14],
                    },
                    {
                        name: '建设成本',
                        type: 'line',
                        data: [19, 22, 21, 15, 23, 16, 15.6, 21],
                    },
                    {
                        name: '总成本',
                        type: 'line',
                        data: [40, 33, 36, 38, 39, 34.2, 36.6, 35],
                    }
                ]
            };
            $('#submit').click(function() {


            });

            // 使用刚指定的配置项和数据显示图表。
            myChart1.setOption(option1);
            myChart2.setOption(option2);
            myChart3.setOption(option3);


        });
        </script>
        <script type="text/javascript">
        </script>
    </body>

    </html>