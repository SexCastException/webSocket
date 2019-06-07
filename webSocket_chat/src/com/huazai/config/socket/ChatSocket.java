package com.huazai.config.socket;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.util.ArrayList;
import java.util.List;

@ServerEndpoint("/chatSocket")
public class ChatSocket {
    private List<Session> sessionList = new ArrayList<>();
    private List<String> nameList = new ArrayList<>();
    @OnOpen
    public void onOpen(Session session) {
        sessionList.add(session);
        nameList.add(session.getQueryString());
        System.out.println("open:" + session.getId());
    }

    @OnMessage
    public void onMessage(Session session, String message) {
        System.out.println(session.getQueryString());
        System.out.println(session.getPathParameters());
        System.out.println(session.getRequestParameterMap());
    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("close:" + session.getId());
    }
}
