<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<script>
    var ws;
    var target = 'ws://localhost:8080/webSocket_chat/'
    window.onload = function (ev) {

    }
</script>
<body>
<form action="login">
    用户名：<input type="text" name="username">
    <input type="submit" value="提交">
</form>
</body>
</html>
