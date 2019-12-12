<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<html>
<head>
    <title>App管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>
        table
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/include/header.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <%--使用dto来接收参数--%>
                <form class="layui-form layui-card-header"  lay-filter="layform">
                <%--<form class="layui-form" action="${ctx}/app/query2" method="post">--%>
                <%--查询条件--%>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">软件名称</label>
                            <div class="layui-input-inline">
                                <input type="tel" name="softwareName" id="softwareName" lay-verify="title" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">APP状态</label>
                            <div class="layui-input-inline">
                                <select name="status" lay-search="">
                                    <option value="">-请选择-</option>
                                    <c:forEach items="${appStatus}" var="obj">
                                        <option value="${obj.valueId}">${obj.valueName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">所属平台</label>
                            <div class="layui-input-inline">
                                <%--app存储的是value_id，会不会矛盾--%>
                                <select name="flatformId" lay-filter="aihao">
                                    <option value="">-请选择-</option>
                                    <c:forEach items="${appFlatforms}" var="obj">
                                        <option value="${obj.valueId}" >${obj.valueName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">一级分类</label>
                            <div class="layui-input-inline">
                                <select name="Level1Id" id="levelOne" lay-filter="levelOne">
                                    <option value="">-请选择-</option>
                                    <c:forEach items="${level1s}" var="obj">
                                        <option value="${obj.id}" >${obj.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">二级分类</label>
                            <div class="layui-input-inline">
                                <select name="Level2Id" id="levelTwo" lay-filter="levelTwo">
                                    <option value="">-请选择-</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">三级分类</label>
                            <div class="layui-input-inline">
                                <select name="Level3Id" id="levelThree" lay-filter="levelThree">
                                    <option value="">-请选择-</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit  lay-filter="search" ><i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>查询</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        <button class="layui-btn" id="export" lay-submit="" lay-filter="export"><i class="layui-icon layui-icon-download-circle"></i>导出</button>
                    </div>
                 </form>

                <div class="layui-input-block" style="padding-top: 25px;margin-left: 15px">
                    <a href="${ctx}/app/toAdd">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">新增APP产品信息</button>
                    </a>
                </div>


            <%--数据展示--%>
                <table id="appTable" lay-filter="appFilter"></table>
                <script type="text/html" id="barDemo">
                    <shiro:hasPermission name="admin">
                        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                    </shiro:hasPermission>
                    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                </script>
                <%--修改数据的弹框--%>
                <%--<div class="layui-row" id="popUpdateTest" >--%>
                <form class="layui-form layui-form-pane1" id="popUpdateForm" name="popUpdateForm" style="display:none;padding: 20px 0 0 0;" action="${ctx}/app/edit" method="post" lay-filter="updateFilter">
                        <input type="hidden" name="id" >
                    <div class="layui-form-item">
                    <label class="layui-form-label">软件名称</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="softwareName" id="software" lay-verify="title" placeholder="请输入软件名称"  autocomplete="off" class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-form-item">
                    <label class="layui-form-label">APK名称</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="apkName" lay-verify="title"autocomplete="off" class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-form-item">
                    <label class="layui-form-label">支持ROM</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="supportRom" lay-verify="title"  autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">界面语言</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="interfaceLanguage" lay-verify="title" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">软件大小</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="softwareSize" lay-verify="title"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                    <label class="layui-form-label">最新版本</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="versionNo" lay-verify="title"  autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">所属平台</label>
                        <div class="layui-input-inline">
                            <select name="flatform" lay-filter="aihao">
                                <option value="">-请选择-</option>
                                <c:forEach items="${appFlatforms}" var="obj">
                                    <option value="${obj.valueId}"<c:if test="${obj.valueId eq appInfo.flatform.valueId}">
                                        selected
                                    </c:if>>${obj.valueName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <label class="layui-form-label">应用简介</label>
                        <div class="layui-input-inline">
                            <input type="t" name="appInfo" lay-verify="title" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                        </div>
                    </div>

                    <%--<div class="layui-form-item">--%>
                        <%--<div class="layui-input-block">--%>
                            <%--<button class="layui-btn" lay-submit lay-filter="*">修改</button>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                </form>

        </div>
    </div>

    <jsp:include page="/jsp/include/footer.jsp"/>

</div>
<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/soulTable/soulTable.css"/>
<%@include file="/jsp/include/in.js.jsp"%>

<script>
    //JavaScript代码区域
    layui.use(['element','jquery','form', 'table', 'soulTable'], function(){
        var element = layui.element;
        $ =layui.jquery;
        var table = layui.table;
        var form = layui.form;
        var view = layui.view;
        var soulTable = layui.soulTable; //使用soulTable导出数据

        //第一个实例
        var myTable = table.render({
            elem: '#appTable' //表格id
            // ,height: 312
            ,url: '${ctx}/app/query2' //数据接口
            ,method: 'post' //防止查询时中文乱码
            ,page: { //开启分页,需要配合后台PageInfo进行分页
                 first: '首页'
                ,last: '尾页'
                ,layout: ['count', 'prev', 'page', 'next', 'skip']
            }
            ,limit: 5
            ,even: true //隔行背景
            ,toolbar:true //开启工具栏
            ,defaultToolbar: ['print', 'exports']
            ,autoSort: false  //禁用前端的排序方法
            ,cols: [[ //表头
                {field: 'softwareName', title: '软件名称',fixed: 'left'}
                ,{field: 'apkName', title: 'APK名称'}
                ,{field: 'softwareSize', title: '软件大小(单位:M)',width:100, sort: true}
                //使用templet模板获取级联属性
                ,{field:'flatform',title: '所属平台',templet:'<div>{{d.flatform.valueName}}</div>'}
                ,{field:'category',title: '所属分类(一级分类、二级分类、三级分类)名',templet:'<div>{{d.categoryLevel1.categoryName}}->{{d.categoryLevel2.categoryName}}->{{d.categoryLevel3.categoryName}}</div>'}
                 ,{field:'appStatus', title: '状态',templet:'<div>{{d.appStatus.valueName}}</div>'}
                ,{field: 'downloads', title: '下载次数', width:100,sort: true}
                //field:'versionNo' 中的versionNo没有意义，返回的值是 templet 中的
                ,{field:'versionNo' ,title: '最新版本号',templet:function (d) {
                    //如果为空则返回空字符串
                    return d.latestAppVersion ?  d.latestAppVersion.versionNo:'' ;
                    }}
                ,{fixed: 'right', title: '操作',align:'center', toolbar: '#barDemo'}
            ]]
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data.list //解析数据列表
                };
            }
            , excel:{ // 导出excel配置
                on: true, //是否启用, 默认开启
                filename: 'APP信息.xlsx', // 文件名
                head:{ // 表头样式
                    family: 'Calibri', // 字体
                    size: 14, // 字号
                    color: '000000', // 字体颜色
                    bgColor: 'C7C7C7' // 背景颜色
                },
                font: { // 正文样式
                    family: 'Calibri', // 字体
                    size: 12, // 字号
                    color: '000000', // 字体颜色
                    bgColor: 'ffffff' //背景颜色
                }
            }
            , done: function (res, curr, count) {
                // 如果有使用到导出、下拉筛选，这句话必须要
                soulTable.render(this)
            }
        });

        //监听排序事件，会自动向后台传where中的排序字段和排序方式
        table.on('sort(appFilter)', function(obj){ //注：appFilter是table lay-filter的值
            //重新向服务端发送请求，从而实现服务端排序，如：
            table.reload('appTable', {
                initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。
                ,where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                    field: obj.field //排序字段
                    ,order: obj.type //排序方式 desc（降序）、asc（升序）、null（空对象，默认排序）
                }
            });
        });

        //监听行工具事件
        table.on('tool(appFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                layer.msg('查看操作');
            } else if(layEvent === 'del'){
                layer.confirm('确定删除该数据吗？', function(index){
                    //向服务端发送删除指令
                    $.ajax({
                        url: "${ctx}/app/delete",
                        type: "POST",
                        data:{"appId":data.id},
                        dataType: "json",
                        success: function(data){
                            // obj.del(); //删除对应行（tr）的DOM结构
                            layer.msg("删除成功", {icon: 6});
                            table.reload('appTable');
                        },
                        error:function (data) {
                            layer.msg("删除失败", {icon: 5});
                        }
                    });
                });
            } else if(layEvent === 'edit'){
                <%--window.location.href = "${ctx}/app/toEdit/"+data.id;--%>
                <%--$.ajax({--%>
                    <%--url: "${ctx}/app/toEdit",--%>
                    <%--type: "POST",--%>
                    <%--data:{"appId":data.id},--%>
                    <%--dataType: "json",--%>
                    <%--error:function (data) {--%>
                        <%--layer.msg("获取数据失败", {icon: 5});--%>
                    <%--}--%>
                <%--});--%>
                EidtUv(data,obj); //发送修改的Ajax请求
            }
        });
        function  EidtUv(data,obj) {
            layer.open({
                title: '修改APP信息',
                id:'lay',
                type: 1,
                area: ['600px', '700px'],
                shade: false,
                content: $("#popUpdateForm"),
                success: function(layero, index){
                    //表单初始赋值,input属性的name要与表单的field名一致
                    // $('#software').val(data.softwareName)
                    form.val('updateFilter', data );
                    // $('#versionNo').val(data.versionNo);
                }
            });
        }

            /** 监听表单提交，并重载table
         * 注意下:
         * 1. form必须有filter：lay-filter=""
         * 2. 查询按钮必须在form中，并且携带2个属性：lay-submit="" lay-filter="search"
         * where 中的数据对应搜索表单，为搜索的条件，后台使用这些条件进行筛选数据返回
         */
        form.on('submit(search)', function (data) {
            table.reload('appTable', {
                url: '${ctx}/app/query2',
                where: data.field //后台直接用实体接收，
                                  // 如果是单个属性，可以以这种方式获取和传输：softwareName=data.field.softwareName
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可
        });

        // 导出
        form.on('submit(export)', function (data) {
            soulTable.export(myTable);
            return false;
        })

        //一级分类 start============================================
        form.on('select(levelOne)',function () {
            //通过id获取level1的id
            var level1id=$('#levelOne').val();
            if(level1id==0){
                //清空二级并渲染form表单
                var html='<option value="">-请选择-</option>';
                $('#levelTwo').html(html);
                form.render();
                return ;
            }
            $.ajax({
                url:'${ctx}/category/queryLevel2ByLevel1id/'+level1id,
                type: 'get',
                success:function (data) {
                    //根据data修改数据，重新渲染form即可
                    var html='<option value="">-请选择-</option>';
                    var len=data.length;
                    for(var i=0;i<len;i++){
                        html += '<option value="'+data[i].id+'">'+data[i].categoryName+'</option>'
                    }
                    $('#levelTwo').html(html);
                    form.render();
                }
            })
        })
        //一级分类 end============================================

        //二级分类 start============================================
        form.on('select(levelTwo)',function () {
            //通过id获取level1的id
            var level2id=$('#levelTwo').val();
            if(level2id==0){
                //清空二级并渲染form表单
                var html='<option value="">-请选择-</option>';
                $('#levelThree').html(html);
                form.render();
                return ;
            }
            $.ajax({
                url:'${ctx}/category/queryLevel3ByLevel2id/'+level2id,
                type: 'get',
                success:function (data) {
                    //根据data修改数据，重新渲染form即可
                    var html='<option value="">-请选择-</option>';
                    var len=data.length;
                    for(var i=0;i<len;i++){
                        html += '<option value="'+data[i].id+'">'+data[i].categoryName+'</option>'
                    }
                    $('#levelThree').html(html);
                    form.render();
                }
            })
        })
        //二级分类 end============================================
    });

</script>
<%--设置表单样式--%>
<style type="text/css">
    .layui-table-cell {
        height: auto;
        /*设置字体大小*/
        font-size:18px;
        /*设置表格行高*/
        line-height: 60px;
    }
    .layui-table-page{
        /*设置分页居中*/
        text-align: center;
        font-size:30px;
    }
    .layui-table th{
        /*表头加粗*/
        font-weight: bold;
        text-align: center;
    }
    .layui-table td{
        /*每行都居中*/
        text-align: center;
    }
</style>
</body>
</html>
