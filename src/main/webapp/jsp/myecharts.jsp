<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>App管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/include/header.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">日结算收入报表（租金）</li>
                    <li>日结算收入报表（非租金）</li>
                    <li>支出报表</li>
                    <li>扣款报表</li>
                </ul>
                <div class="layui-tab-content" style="height: 500px;">
                    <div class="layui-tab-item layui-show">
                        <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                        <div id="main" style="width: 100%; height: 500px;"></div>
                    </div>
                    <div class="layui-tab-item">内容2</div>
                    <div class="layui-tab-item">内容3</div>
                    <div class="layui-tab-item">内容4</div>
                    <div class="layui-tab-item">内容5</div>
                </div>
            </div>

        </div>
    </div>

    <jsp:include page="/jsp/include/footer.jsp"/>

</div>
<!-- 引入jquery.js -->
<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>
<!-- 引入 echarts.js -->
<script  src="${ctx}/static/echarts/echarts.min.js"></script>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<%--<script type="text/javascript">--%>

<%--</script>--%>

<script>
    //JavaScript代码区域
    layui.use(['element','jquery'], function(){
        var element = layui.element;
        $ =layui.jquery;

        var myChart = echarts.init(document.getElementById('main'));
        // 显示标题，图例和空的坐标轴
        myChart.setOption({
            title : {
                text : '异步数据加载示例'
            },
            tooltip : {},
            legend : {
                data : [ '成绩' ]
            },
            xAxis : {
                data : []
            },
            yAxis : {},
            series : [ {
                name : '分公司或更换恢复到',
                type : 'bar',
                data : []
            } ]
        });

        myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

        var names = []; //姓名数组（实际用来盛放X轴坐标值）
        var scores = []; //成绩数组（实际用来盛放Y坐标值）

        $.ajax({
            type : "post",
            async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url : "${ctx}/getData",
            data : {},
            dataType : "json", //返回数据形式为json
            success : function(result) {
                //请求成功时执行该函数内容，result即为服务器返回的json对象
                if (result) {
                    for (var i = 0; i < result.length; i++) {
                        names.push(result[i].name); //挨个取出姓名并填入姓名数组
                    }
                    for (var i = 0; i < result.length; i++) {
                        scores.push(result[i].score); //挨个取出成绩并填入成绩数组
                    }
                    myChart.hideLoading(); //隐藏加载动画
                    myChart.setOption({ //加载数据图表
                        xAxis : {
                            data : names
                        },
                        series : [ {
                            // 根据名字对应到相应的系列
                            name : '成绩',
                            data : scores,
                            itemStyle: {
                                normal: {
                                    label: {
                                        show: true
                                    }
                                }
                            }
                        } ]
                    });

                }

            },
            error : function(errorMsg) {
                //请求失败时执行该函数
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        })
    });
</script>
</body>
</html>



<%--<body style="align: center; margin: 56px 0px 0px 25%;">--%>

