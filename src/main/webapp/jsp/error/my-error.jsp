<%@ page contentType="text/html;charset=UTF-8" language="java"
         isErrorPage="true"%>
<html>
<head>
    <title>出错啦</title>
</head>
<body>
<H1>自定义异常错误：</H1><%=exception%>
<H2>错误内容：</H2>
<%
    exception.printStackTrace(response.getWriter());
%>
</body>
</html>
