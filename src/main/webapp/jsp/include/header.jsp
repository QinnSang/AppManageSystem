<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="layui-header">
    <div class="layui-logo">App BMS</div>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                贤心
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="${ctx}/logout">退出登录</a></li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">合同管理</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">仓储管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="">货物配置</a></dd>
                    <dd><a href="">库位管理</a></dd>
                    <dd><a href="">仓储订单管理</a></dd>
                    <dd><a href="">入库管理</a></dd>
                    <dd><a href="">出库管理</a></dd>
                    <dd><a href="">货权转移管理</a></dd>
                    <dd><a href="">移库管理</a></dd>
                    <dd><a href="">换包管理</a></dd>
                    <dd><a href="">报损管理</a></dd>
                    <dd><a href="">扣款管理</a></dd>
                    <dd><a href="">配送管理</a></dd>
                    <dd><a href="">仓储订单日志</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">结算管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="">日结算收入报表</a></dd>
                    <dd><a href="">月结算收入报表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a class="" href="javascript:;">审批</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">仓储审批</a></dd>
                    <dd><a href="javascript:;">报损审批</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">统计分析</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;">仓储统计分析</a>
                        <dl class="layui-nav-child">
                            <dd><a href="">公司仓储统计分析</a></dd>
                            <dd><a href="">品种仓储统计分析</a></dd>
                        </dl>
                    </dd>
                    <dd>
                        <a href="javascript:;">报损统计分析</a>
                        <dl class="layui-nav-child">
                            <dd><a href="">公司报损统计分析</a></dd>
                            <dd><a href="">品种报损统计分析</a></dd>
                        </dl>
                    </dd>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">公告管理</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">系统管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="">用户管理</a></dd>
                    <dd><a href="">部门管理</a></dd>
                    <shiro:hasPermission name="role:view">
                        <dd><a href="${ctx}/role/showAllRole">角色管理</a></dd>
                    </shiro:hasPermission>
                    <dd><a href="${ctx}/menu/showAllMenu">菜单管理</a></dd>
                    <dd><a href="">字典管理</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">日志审计</a>
                <dl class="layui-nav-child">
                    <dd><a href="">登录日志</a></dd>
                    <dd><a href="">操作日志</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">APP应用管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/app/index2">APP维护</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>

