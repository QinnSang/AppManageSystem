<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>App信息管理平台</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <style>
        body{
            background-color: #009E94;
        }
    </style>
</head>
<body>
<h2>${ErrorCode}</h2>

    <div style=margin-top:150px;margin-left:500px>
        <div style="padding-bottom: 5px;" >
            <h2>App信息管理平台</h2>
        </div>
        <div style="background-color: white;width:500px;border-radius: 25px;">
            <div  style="width: 300px">
                <hr>
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">
                        开发者注册</a></li>
                </ul>
            </div>

            <div id="myTabContent" class="tab-content">
                <%--开发者注册--%>
                    <form action="${ctx}/dev/register" method="post" class="layui-form" name="regSubmit">
                        <div class="layui-form-item">
                            <div class="layui-form-item">
                                <label class="layui-form-label">注册账号：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="devCode" id="devCode" required lay-verify="required"
                                           placeholder="仅中、英文字母、数字和下划线" autocomplete="off"
                                           class="layui-input"  style="width: 300px" value="test002">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">验证邮箱：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="devEmail" id="devEmail" required lay-verify="required"
                                           autocomplete="off" class="layui-input" style="width: 300px" value="cxxadmxs@163.com">
                                </div>
                            </div>

                            <div class="layui-form-item">
                            <label class="layui-form-label">密码：</label>
                                <div class="layui-input-block">
                                    <input type="password" name="devPassword"  id="devPassword" required lay-verify="required"
                                           placeholder="6~16个字符，区分大小写" autocomplete="off"
                                           class="layui-input" style="width: 300px" value="123123">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">确认密码：</label>
                                <div class="layui-input-block">
                                    <input type="password" name="devRePassword" id="devRePassword" required lay-verify="required"
                                           placeholder="确认密码" autocomplete="off"
                                           class="layui-input" style="width: 300px" value="123123">
                                </div>
                            </div>
                            <div class="layui-input-inline" style="margin-left: 0">
                                <input name="verCode" ng-model="captcha" type="text" id="verCode" placeholder="验证码">
                                <div class="code-image">
                                    <%--src为requestMapping的路径--%>
                                    <img id="captchaImage" src="${ctx}/dev/captcha/false" width="130px" height="48px"  alt="验证码"/>
                                    <a id="changeImage" href="#">看不清?换一张</a>
                                </div>
                            </div>

                        </div>

                        <div class="layui-form-item">
                            <a href="${ctx}/index.jsp">已有账号？请登录</a>
                            <div class="layui-input-block" style="padding-bottom: 8px">
                                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">注册</button>
                                <button type="reset" class="layui-btn-primary">重置</button>
                            </div>
                        </div>
                        <div id="error-box">
                            <lable id="error-info"/>
                        </div>
                    </form>
            </div>
        </div>
    </div>
<script src="${ctx}/jsp/js/register.js"></script>
<script>
    $(function () {
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        });
    });
    $('#changeImage').click(function () {
        $('#captchaImage').attr('src','${ctx}/dev/captcha/true');
    })
</script>
    <%--注册失败的原因--%>
    <c:if test="${not empty stateType}">
        <script>
            alert(222);
            <%--在script中引用model里的值，要加上''--%>
            $('#error-info').text('${stateType.value}');
            $('#error-info').show();
        </script>
    </c:if>
    <c:if test="${empty stateType}">
        <script>
            $('#error-info').hide();
        </script>
    </c:if>
</body>
</html>