package com.easykoo.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.easykoo.mybatis.model.AccountSecurity;
import com.easykoo.mybatis.model.AccountSession;
import com.easykoo.service.IAccountService;
import com.easykoo.service.IAccountSessionService;
import com.easykoo.service.IPrivilegeService;

/**
 * Created by easykooc on 14-2-11.
 */
@Component
public class PrivilegeFilter
        extends OncePerRequestFilter {
    private Log logger = LogFactory.getLog(getClass());
    private static IPrivilegeService privilegeService;
    private static IAccountService accountService;
    private static IAccountSessionService accountSessionService;
    String[] notFilter = new String[]{"/", ".js", ".css", ".jpg", ".png",".ico"
            , ".otf", ".eot", ".svg", ".ttf", ".woff"
            , ".scss", ".woff", "index.jsp", "index.do", "login.do",
            "logout.do", "getVerifyCodeImage.do"};

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
                                    FilterChain filterChain)
            throws ServletException, IOException {
        String path = request.getServletPath();
        logger.debug("Filter:" + path);

        //for test
/*        if (true) {
            filterChain.doFilter(request, response);
            return;
        }*/
        boolean checkAuthorize = true;
        for (String s : notFilter) {
            if (path.endsWith(s)) {
                logger.debug("End with:" + s);
                filterChain.doFilter(request, response);
                return;
            }
        }
        if (path.contains("error/")) {
            filterChain.doFilter(request, response);
            return;
        }

        //check if there's an user logged in.
        HttpSession session = request.getSession(true);
        AccountSecurity accountSecurity = (AccountSecurity) session.getAttribute("currentAccountSecurity");
        if (accountSecurity == null || accountSecurity.getUsername() == null) {
            logger.debug("Current AccountSecurity is null...");
            String username = null;
            String sessionId = null;

            logger.debug("Check cookies...");
            Cookie[] cookies = request.getCookies();
            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (c.getName().equalsIgnoreCase("username")) {
                    username = c.getValue();
                }
                if (c.getName().equalsIgnoreCase("sessionId")) {
                    sessionId = c.getValue();
                }
            }
            if (username != null && sessionId != null) {
                logger.debug("Found cookies...");
                AccountSession accountSession = new AccountSession();
                accountSession.setUsername(username);
                accountSession.setSessionId(sessionId);

                AccountSession dbAccountSession = accountSessionService.getRecord(accountSession);
                logger.debug("dbAccountSession: " + dbAccountSession);
                if (dbAccountSession != null) {
                    accountSecurity = accountService.selectFullByPrimaryKey(dbAccountSession.getAccountId());
                    session.setAttribute("currentAccountSecurity", accountSecurity); // 将user bean添加到session中。
                } else {
                    logger.debug("There's no session in DB, clean the cookies!");
                    Cookie ckUsername, ckSessionId;
                    ckUsername = new Cookie("username", null);
                    ckUsername.setMaxAge(0);
                    ckUsername.setPath("/");
                    response.addCookie(ckUsername);

                    ckSessionId = new Cookie("sessionId", null);
                    ckSessionId.setMaxAge(0);
                    ckSessionId.setPath("/");
                    response.addCookie(ckSessionId);
                }
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            } else {
                logger.debug("No cookies...");
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }
        }

        logger.debug("Current AccountSecurity: " + accountSecurity);
        if (checkAuthorize) {
            //check authorization
            logger.debug("Check permission...");
            if (!privilegeService.isAuthorized(path, accountSecurity)) {
                response.sendRedirect(request.getContextPath() + "/error/403.jsp");
                return;
            }
        }

        filterChain.doFilter(request, response);
    }

    public IPrivilegeService getPrivilegeService() {
        return privilegeService;
    }

    @Autowired
    public void setPrivilegeService(IPrivilegeService privilegeService) {
        PrivilegeFilter.privilegeService = privilegeService;
    }

    public IAccountService getAccountService() {
        return accountService;
    }

    @Autowired
    public void setAccountService(IAccountService accountService) {
        PrivilegeFilter.accountService = accountService;
    }

    public IAccountSessionService getAccountSessionService() {
        return accountSessionService;
    }

    @Autowired
    public void setAccountSessionService(IAccountSessionService accountSessionService) {
        PrivilegeFilter.accountSessionService = accountSessionService;
    }
}
