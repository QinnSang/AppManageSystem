<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <%--使用dto来接收参数--%>
            <form class="layui-form" action="${ctx}/app/add" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="softwareName" lay-verify="title" placeholder="请输入软件名称" autocomplete="off" class="layui-input">
                    </div>
                    <label class="layui-form-label">APK名称</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="apkName" lay-verify="title" placeholder="请输入APK名称" autocomplete="off" class="layui-input">
                    </div>
                    <label class="layui-form-label">支持ROM</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="supportRom" lay-verify="title" placeholder="请输入ROM名称" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">界面语言</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="interfaceLanguage" lay-verify="title" placeholder="请输入界面语言" autocomplete="off" class="layui-input">
                    </div>
                    <label class="layui-form-label">软件大小</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="softwareSize" lay-verify="title" placeholder="请输入软件大小" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">APP状态</label>
                    <div class="layui-input-inline">
                        <select name="appStatus.valueId" lay-search="">
                            <option value="">-请选择-</option>
                            <c:forEach items="${appStatus}" var="obj">
                                <option value="${obj.valueId}">${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-inline">
                        <select name="flatform.valueId" lay-filter="aihao">
                            <option value="">-请选择-</option>
                            <c:forEach items="${appFlatforms}" var="obj">
                                <option value="${obj.valueId}">${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel1.id" id="levelOne" lay-filter="levelOne">
                            <option value="">-请选择-</option>
                            <c:forEach items="${level1s}" var="obj">
                                <option value="${obj.id}">${obj.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel2.id" id="levelTwo" lay-filter="levelTwo">
                            <option value="">-请选择-</option>
                        </select>
                    </div>
                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel3.id" id="levelThree" lay-filter="levelThree">
                            <option value="">-请选择-</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">应用简介</label>
                    <div class="layui-input-inline">
                        <input type="t" name="appInfo" lay-verify="title" placeholder="请输入应用简介" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="/jsp/include/footer.jsp"/>

</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery'], function(){
        var element = layui.element;
        $ =layui.jquery;
        var form =layui.form;

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
</body>
</html>
