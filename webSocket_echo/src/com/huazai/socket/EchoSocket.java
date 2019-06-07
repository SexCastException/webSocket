package com.huazai.socket;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;

@ServerEndpoint("/echoSocket")
public class EchoSocket {
    /**
     * 开启连接时响应事件
     *
     * @param session
     */
    @OnOpen
    public void onOpen(Session session) {
        // 一个session代表一个通信会话，sessionID代表会话唯一标识
        System.out.println("sessionId：" + session.getId() + " is open");
    }

    @OnMessage
    public void onMessage(Session session, String msg, boolean last) throws IOException {
        System.out.println("sessionId：" + session.getId() + " receive message：" + msg);
        session.getBasicRemote().sendText(" 服务器相应：" + msg + " too" + "-----" + "sessionId：" + session.getId());
    }

    /**
     * 关闭连接时响应事件
     * x`
     *
     * @param session
     */
    @OnClose
    public void onClose(Session session) {
        System.out.println("sessionId: " + session.getId() + " is closed");
    }
}
