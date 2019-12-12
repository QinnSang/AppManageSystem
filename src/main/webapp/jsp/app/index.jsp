<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>App管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <script type="text/javascript">
        function export_table(){
            var table1=$('#table1');
            table.exportFile(table1.id,table1.data());
        }
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/include/header.jsp"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <%--使用dto来接收参数--%>
            <form class="layui-form" action="${ctx}/app/query" method="post">
                <%--查询条件--%>
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input  type="hidden" name="pageNum" lay-verify="title">
                    </div>
                    <div class="layui-input-inline">
                        <input type="hidden" name="pageSize" lay-verify="title" value="5">
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">软件名称</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="softwareName" lay-verify="title" autocomplete="off" class="layui-input" value="${appInfoDto.softwareName}">
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">APP状态</label>
                        <div class="layui-input-inline">
                            <select name="status" lay-search="">
                                <option value="">-请选择-</option>
                                <c:forEach items="${appStatus}" var="obj">
                                    <option value="${obj.valueId}"   <c:if test="${obj.valueId eq appInfoDto.status}">
                                        selected
                                    </c:if>>${obj.valueName}</option>
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
                                    <option value="${obj.valueId}" <c:if test="${obj.valueId eq appInfoDto.flatformId}">
                                        selected
                                    </c:if>>${obj.valueName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">一级分类</label>
                        <div class="layui-input-inline">
                            <select name="Level1Id" id="levelOne" lay-filter="levelOne">
                                <option value="">-请选择-</option>
                                <c:forEach items="${level1s}" var="obj">
                                    <option value="${obj.id}" <c:if test="${obj.id eq appInfoDto.level1Id}">
                                        selected
                                    </c:if>>${obj.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <label class="layui-form-label">二级分类</label>
                        <div class="layui-input-inline">
                            <select name="Level2Id" id="levelTwo" lay-filter="levelTwo">
                                <option value="">-请选择-</option>
                            </select>
                        </div>
                        <label class="layui-form-label">三级分类</label>
                        <div class="layui-input-inline">
                            <select name="Level3Id" id="levelThree" lay-filter="levelThree">
                                <option value="">-请选择-</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item" style="padding-bottom: 15px">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-normal" lay-submit
                                lay-filter="formDemo" >查 询
                        </button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
                <div class="layui-input-block" style="padding-top: 25px;margin-left: 15px">
                    <a href="${ctx}/app/toAdd">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">新增APP产品信息</button>
                    </a>
                </div>
                <div  class="layui-btn exportWarp" style="float: left;"><i class="layui-icon layui-icon-export"></i>
                    导出
                </div>
                <div class="layui-input-block" style="padding-top: 25px;margin-left: 15px">
                    <a  onclick="export_table()" >
                        <button id="export" data-method="offset" data-type="auto" class="layui-btn layui-btn-m">导出</button>
                    </a>
                </div>
            <%--数据展示--%>
            <table class="layui-table" id="table1">
                <thead>
                <tr>
                    <th>软件名称</th>
                    <th>APK名称</th>
                    <th>软件大小(单位:M)</th>
                    <th>所属平台</th>
                    <th>所属分类(一级分类、二级分类、三级分类)</th>
                    <th width="50px">状态</th>
                    <th>下载次数</th>
                    <th>最新版本号</th>
                    <th width="110px">操作</th>
                </tr>
                </thead>
                <tbody>

                    <c:forEach items="${pageInfo.list}" var="obj">
                        <tr>
                            <td>${obj.softwareName}</td>
                            <td>${obj.apkName}</td>
                            <td>${obj.softwareSize}</td>
                            <td>${obj.flatform.valueName}</td>
                            <td>
                                    ${obj.categoryLevel1.categoryName}->${obj.categoryLevel2.categoryName}->${obj.categoryLevel3.categoryName}
                            </td>
                            <td>${obj.appStatus.valueName}</td>
                            <td>${obj.downloads}</td>
                            <td>${obj.latestAppVersion.versionNo}</td>
                            <td>
                                <a href="${ctx}/app/queryAppDetail/${obj.id}" class="layui-btn layui-btn-xs"> <i class="layui-icon">&#xe615;</i> </a>
                                <a href="${ctx}/app/toEdit/${obj.id}" class="layui-btn  layui-btn-normal layui-btn-xs"><i class="layui-icon">&#xe642;</i></a>
                                <a href="${ctx}/app/delete/${obj.id}" class="layui-btn layui-btn-danger layui-btn-xs"><i class="layui-icon">&#xe640;</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <%--页码导航--%>
        <div>
            <div style="position:absolute;left:30%; ">
                <div id="demo1"></div>
            </div>
            <%--<div style="position:absolute;left:15px; ">--%>
                <%--<p>--%>
                    <%--共 ${pageInfo.total} 条数据，第 ${pageInfo.pageNum}/${pageInfo.pages} 页--%>
                <%--</p>--%>
            <%--</div>--%>
            <%--<div style="position:absolute;right: 15px; ">--%>
                <%--<p>--%>
                    <%--<a page="first" href="javascript:void(0)">--%>
                        <%--<button class="layui-btn layui-btn-normal layui-btn-radius"--%>
                                <%--style="height: 28px;line-height: 28px">首页--%>
                        <%--</button>--%>
                    <%--</a>--%>
                    <%--<a page="prev" href="javascript:void(0)">--%>
                        <%--<button class="layui-btn layui-btn-normal layui-btn-radius"--%>
                                <%--style="height: 28px;line-height: 28px">上一页--%>
                        <%--</button>--%>
                    <%--</a>--%>
                    <%--<a page="next" href="javascript:void(0)">--%>
                        <%--<button class="layui-btn layui-btn-normal layui-btn-radius"--%>
                                <%--style="height: 28px;line-height: 28px">下一页--%>
                        <%--</button>--%>
                    <%--</a>--%>
                    <%--<a page="last" href="javascript:void(0)">--%>
                        <%--<button class="layui-btn layui-btn-normal layui-btn-radius"--%>
                                <%--style="height: 28px;line-height: 28px">尾页--%>
                        <%--</button>--%>
                    <%--</a>--%>
                <%--</p>--%>
            <%--</div>--%>
        </div>
    </div>

    <jsp:include page="/jsp/include/footer.jsp"/>

</div>
<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','jquery','laypage', 'layer'], function(){
        var element = layui.element;
        $ =layui.jquery;
        var laypage = layui.laypage;
        var layer = layui.layer;


        //总页数大于页码总数，laypage将会借助 count 和 limit 计算出分页数。
        laypage.render({
            elem: 'demo1'
            ,count: ${pageInfo.total} //数据总数
            ,limit:${pageInfo.pageSize}
            ,curr:${pageInfo.pageNum}
            ,first: '首页'
            ,last: '尾页'
            ,layout: ['count', 'prev', 'page', 'next', 'skip']
            ,jump: function(obj, first){
                //首次不执行
                if(!first){
                    //更新隐藏域里的值
                    $('input[name=pageNum]').val(obj.curr);
                    //提交表单
                    $('form').submit();
                }
            }
        });

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

        <%--//分页 start============================================--%>
        <%--$('a[page]').click(function () {--%>
            <%--var pageNum=1;--%>
            <%--var curPageNUm='${pageInfo.pageNum}';--%>
            <%--var total='${pageInfo.pages}';--%>
            <%--var value=$(this).attr('page');--%>

            <%--switch(value){--%>
                <%--case 'first':--%>
                    <%--pageNum=1;--%>
                    <%--break;--%>
                <%--case 'prev':--%>
                    <%--pageNum=curPageNUm-1;--%>
                    <%--if(pageNum<1)--%>
                        <%--pageNum=1;--%>
                    <%--break;--%>
                <%--case 'next':--%>
                    <%--pageNum=parseInt(curPageNUm)+1;--%>
                    <%--if(pageNum>total)--%>
                        <%--pageNum=total;--%>
                    <%--break;--%>
                <%--case 'last':--%>
                    <%--pageNum=total;--%>
                    <%--break;--%>
            <%--}--%>

            <%--//更新隐藏域里的值--%>
            <%--$('input[name=pageNum]').val(pageNum);--%>
            <%--//提交表单--%>
            <%--$('form').submit();--%>
        <%--})--%>
        <%--//分页 end============================================--%>

        //保留二级、三级分类的选择 start============================
        $(function () {
            var level1Id = '${appInfoDto.level1Id}';
            var level2Id = '${appInfoDto.level2Id}';
            var level3Id = '${appInfoDto.level3Id}';
            // 上次查询时有选过一级分类
            if(level1Id != null && level1Id != '' && level1Id != undefined){
                // 重新渲染二级分类下拉框内容
                $.ajax({
                    url:'${ctx}/category/queryLevel2ByLevel1id/'+level1Id,
                    method:'get',
                    success:function (data) {
                        // 根据data修改二级分类列表
                        var len = data.length;
                        var html2 = '<option value="" selected>--请选择--</option>';
                        for (var i = 0; i<len; i++) {
                            html2 += '<option value="'+data[i].id+'" ';
                            // 如果上次查询时有选过二级分类，将选过的条目设置为选中，更新三级下拉框
                            if(data[i].id == level2Id){
                                // 将选过的条目设置为选中
                                html2 += 'selected';
                                // 更新三级下拉框
                                $.ajax({
                                    url:'${ctx}/category/queryLevel3ByLevel2id/'+level2Id,
                                    method:'get',
                                    success:function (data) {
                                        // 根据data修改二级分类列表
                                        var len = data.length;
                                        var html3 = '<option value="" selected>--请选择--</option>';
                                        for (var i = 0; i<len; i++) {
                                            html3 += '<option value="'+data[i].id+'" ';
                                            // 如果上次查询时有选过二级分类，将选过的条目设置为选中，更新三级下拉框
                                            if(data[i].id == level3Id){
                                                // 将选过的条目设置为选中
                                                html3 += 'selected';
                                                // 更新三级下拉框
                                            }
                                            html3 += '>'+data[i].categoryName+'</option>';
                                        }
                                        $('#levelThree').html(html3);
                                        // 重新渲染
                                        form.render();
                                    }
                                });
                            }
                            html2 += '>'+data[i].categoryName+'</option>';
                        }
                        $('#levelTwo').html(html2);
                        // 重新渲染
                        form.render();
                    }
                });
            }
        })
        //保留二级、三级分类的选择 start============================

    });
</script>
</body>
</html>
