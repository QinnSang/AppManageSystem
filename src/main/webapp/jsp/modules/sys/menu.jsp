<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <form:form id="inputForm" action="${ctx}/sys/role/save" method="post" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">菜单列表:</label>
                    <div class="controls">
                        <div id="menuTree" class="ztree" style="margin-top:3px;float:left;"></div>
                        <%--<form:hidden path="menuIds"/>--%>
                    </div>
                </div>
                <div class="form-actions">
                    <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
                    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
                </div>
            </form:form>
        </div>
    </div>

    <jsp:include page="/jsp/include/footer.jsp"/>

</div>
<script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<link href="${ctx}/static/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css"/>
<script src="${ctx}/static/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','tree','jquery'], function(){
        $ =layui.jquery;
        //使用ztree展示，可一次查完所有菜单
        // 也可使用layui，但是layui要递归查询子菜单，不能一次查完，效率低
        //layui树形结构参考：https://blog.csdn.net/qq_41657790/article/details/93777024
        //https://blog.csdn.net/qq_40205116/article/details/100180581
        $(document).ready(function(){
            $("#inputForm").validate({
                submitHandler: function(form){
                    var ids = [], nodes = tree.getCheckedNodes(true);
                    for(var i=0; i<nodes.length; i++) {
                        ids.push(nodes[i].id);
                    }
                    $("#menuIds").val(ids);
                    loading('正在提交，请稍等...');
                    form.submit();
                }
            });


            //树形结构的属性
            var setting = {
                check:{
                    enable:true,
                    nocheckInherit:true
                },
                view:{
                    selectedMulti: false
                },
                data:{
                    simpleData:{enable:true}
                },
                callback:{
                    beforeClick:function(id, node){
                        tree.checkNode(node, !node.checked, true, true);
                        return false;
                    }
                }
            };

            // 菜单
            var zNodes=[
                    <c:forEach items="${menuList}" var="menu">{
                    id:"${menu.id}",
                    pId:"${not empty menu.parent.id?menu.parent.id:0}",
                    name:"${not empty menu.parent.id?menu.name:'权限列表'}"
                },
                </c:forEach>];
            // 初始化树结构
            var tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
            // 不选择父节点
            tree.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
            // 默认选择节点
            var ids = "${role.menuIds}".split(",");
            for(var i=0; i<ids.length; i++) {
            var node = tree.getNodeByParam("id", ids[i]);
            try{tree.checkNode(node, true, false);}catch(e){}
            }
            // 默认展开全部节点
            tree.expandAll(true);
        });
    });
</script>
</body>
</html>
