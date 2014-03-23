package com.easykoo.web.listener;

import com.easykoo.mybatis.model.SessionLog;
import com.easykoo.service.ISessionLogService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.context.support.WebApplicationObjectSupport;

import javax.servlet.ServletException;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.*;
import java.util.Date;

/**
 * Created by Jesse on 14-3-23.
 */
@Component
public class SessionCounterListener extends WebApplicationObjectSupport implements HttpSessionListener,
        ServletRequestListener {

    private Log log = LogFactory.getLog(getClass());
    private ISessionLogService sessionLogService;
    private HttpServletRequest request;

    public void init() throws ServletException {
        log.info("init");
    }

    @Override
    public void requestDestroyed(ServletRequestEvent servletRequestEvent) {
        log.info("requestDestroyed!");
    }

    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        request = (HttpServletRequest) sre.getServletRequest();
        log.info("requestInitialized!");
    }

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        log.info("new session created!");

        SessionLog sessionLog = new SessionLog();
        sessionLog.setSessionId(httpSessionEvent.getSession().getId());
        sessionLog.setIp(request.getRemoteAddr());
        sessionLog.setCreateDate(new Date());
        getSessionLogService().insert(sessionLog);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        log.info("session destroyed!");
    }

    public ISessionLogService getSessionLogService() {
        if (sessionLogService == null) {
            WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
            sessionLogService = (ISessionLogService) context.getBean("sessionLogService");
        }
        return sessionLogService;
    }
}