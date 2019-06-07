package com.huazai.config;

import javax.websocket.Endpoint;
import javax.websocket.server.ServerApplicationConfig;
import javax.websocket.server.ServerEndpointConfig;
import java.util.Set;

/**
 * EndPoint 相当于以前的Servlet，一个webSocket的服务器端程序
 * ServerApplicationConfig这个借口的实现类，会在项目启动时候自动执行
 */
public class DemoConfig implements ServerApplicationConfig {
    // 方式一：接口方式启动

    /**
     * 获取所有以接口方式配置的webSocket类
     * @param set
     * @return
     */
    @Override
    public Set<ServerEndpointConfig> getEndpointConfigs(Set<Class<? extends Endpoint>> set) {
        System.out.println("getEndpointConfigs");
        return null;
    }

    // 方式二：注解方式启动（推荐）

    /**
     * 扫描src下所有类@ServerEndPoint注解的类
     * @param scanned
     * @return
     */
    @Override
    public Set<Class<?>> getAnnotatedEndpointClasses(Set<Class<?>> scanned) {
        System.out.println("getAnnotatedEndpointClasses：" + scanned.size());

        // 返回，提供了过滤的作用
        return scanned;
    }
}
