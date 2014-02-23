package com.easykoo.web.interceptor;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Feb 22, 2014    Steven
 */
public class LocaleChangeInterceptor extends HandlerInterceptorAdapter {

    private final Log logger = LogFactory.getLog(getClass());
    public static final String DEFAULT_PARAM_NAME = "locale";


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws ServletException {

        LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
        if (localeResolver == null) {
            throw new IllegalStateException("No LocaleResolver found: not in a DispatcherServlet request?");
        }

        String newLocale = request.getParameter(DEFAULT_PARAM_NAME);
        if (newLocale != null) {
            logger.debug("Locale is changed from" + localeResolver.resolveLocale(request) + " to " + newLocale + "!");
            localeResolver.setLocale(request, response, StringUtils.parseLocaleString(newLocale));
        }
        return true;
    }
}
