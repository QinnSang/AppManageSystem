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
            <h2>APP基础信息</h2>
                <div class="layui-form-item">
                    <input type="hidden" name="id" value="${appInfo.id}">
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="softwareName" lay-verify="title"class="layui-input" value="${appInfo.softwareName}" readonly>
                    </div>
                    <label class="layui-form-label">APK名称</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="apkName" lay-verify="title"class="layui-input" value="${appInfo.apkName}" readonly>
                    </div>
                    <label class="layui-form-label">支持ROM</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="supportRom" lay-verify="title"class="layui-input" value="${appInfo.supportRom}" readonly>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">界面语言</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="interfaceLanguage" lay-verify="title" autocomplete="off" class="layui-input" value="${appInfo.interfaceLanguage}" readonly>
                    </div>
                    <label class="layui-form-label">软件大小</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="softwareSize" lay-verify="title"  autocomplete="off" class="layui-input" value="${appInfo.softwareSize}" readonly>
                    </div>
                    <label class="layui-form-label">最新版本</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="latestAppVersion.id" lay-verify="title"  autocomplete="off" class="layui-input" value="${appInfo.latestAppVersion.versionNo}"readonly>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">应用简介</label>
                    <div class="layui-input-inline">
                        <input  name="appInfo" lay-verify="title" autocomplete="off" class="layui-input" value="${appInfo.appInfo}" readonly>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="softwareSize" lay-verify="title"  autocomplete="off" class="layui-input" value="${appInfo.categoryLevel1.categoryName}"readonly>
                    </div>
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="latestAppVersion.id" lay-verify="title"  autocomplete="off" class="layui-input" value="${appInfo.categoryLevel2.categoryName}"readonly>
                    </div>
                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-inline">
                        <input type="t" name="appInfo" lay-verify="title" autocomplete="off" class="layui-input" value="${appInfo.categoryLevel3.categoryName}"readonly>
                    </div>
                </div>
        </div>

        <h2>历史版本信息</h2>
        <table class="layui-table">
            <thead>
            <tr>
                <th>版本编号</th>
                <th>APK软件名称</th>
                <th>版本信息</th>
                <th>版本大小</th>
                <th>APK位置</th>
                <th>下载链接</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${appInfo.appVersions}" var="obj">
                    <tr>
                        <td>${obj.versionNo}</td>
                        <td>${obj.apkFilename}</td>
                        <td>${obj.versionInfo}</td>
                        <td>${obj.versionSize}</td>
                        <td>${obj.apkLocpath}</td>
                        <td><a href="${obj.downloadLink}">下载链接</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
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
    });
</script>
</body>
</html>
