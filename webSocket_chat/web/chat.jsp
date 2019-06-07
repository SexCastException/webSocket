<%--
  Created by IntelliJ IDEA.
  User: pyh
  Date: 2019/6/7
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        var ws;
        var username = '${sessionScope.username}'
        var target = 'ws://localhost:8080/webSocket_chat/chatSocket?username='+username;
        window.onload = function (ev) {
            open();
        }

        function open() {
            if ('WebSocket' in window) {
                ws = new WebSocket(target);
            } else if ('MozWebSocket' in window) {
                ws = new MozWebSocket(target);
            } else {
                alert('该浏览器不支持webSocket')
            }
            ws.onopen = function (ev) {
                console.info('open')
            };
            ws.onmessage = function (ev) {
                console.info(ev)
            };
            ws.onclose = function (ev) {
                console.info('close');
            }
        }

        function send() {
            ws.send('hello world');
        }

        function close() {
            if (ws != null) {
                ws.close();
                ws = null;
            }
        }
    </script>
</head>
<body>
<input type="button" onclick="send()">
</body>
</html>
