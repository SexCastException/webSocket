<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">
    var ws;
    var target = 'ws://localhost:8080/websocket_echo/echoSocket';

    function connection() {
        if ("WebSocket" in window) {
            ws = new WebSocket(target);
        } else if ("MozWebSocket" in window) {
            ws = new MozWebSocket(target);
        } else {
            alert('socket不支持该浏览器');
            return;
        }

        ws.onopen = function (ev) {
            setConnection(true);
            console.info(ev);
            console.info('开启连接');
        }
        ws.onmessage = function (ev) {
            document.getElementById('responseMsg').innerText += ev.data + '\n';
        }
        ws.onclose = function (ev) {
            setConnection(false);
            console.info(ev);
            console.info('关闭连接');
        }
    }

    function disConnection() {
        if (ws != null) {
            setConnection(false);
            ws.close();
        }
        ws = null;
    }

    function send() {
        var msg = document.getElementById('msg').value;
        if (!msg.trim()) {
            alert('发送内容不能为空');
            document.getElementById('msg').value = '';
            return;
        }
        if (ws != null) {
            ws.send(msg);
            document.getElementById('msg').value = '';
        } else {
            alert('请先开启连接')
        }
    }

    function setConnection(isConnect) {
        document.getElementById('open').disabled = isConnect;
        document.getElementById('close').disabled = !isConnect;
        document.getElementById('msg').disabled = !isConnect;
        document.getElementById('send').disabled = !isConnect
    }
</script>
<body>
<button onclick="connection()" id="open">开启连接</button>
<button onclick="disConnection()" disabled id="close">关闭连接</button>
<br>
<input type="text" disabled id="msg">
<button onclick="send()" disabled id="send">发送</button>
<br>
<div id="responseMsg"></div>
</body>
</html>
