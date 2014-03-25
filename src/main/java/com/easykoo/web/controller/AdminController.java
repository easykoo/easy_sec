package com.easykoo.web.controller;

import com.easykoo.model.Settings;
import com.easykoo.model.Statistics;
import com.easykoo.mybatis.model.SessionLog;
import com.easykoo.service.ISessionLogService;
import com.easykoo.service.ISettingsService;
import com.easykoo.service.IStatisticsService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Feb 22, 2014    Steven
 */

@Controller
public class AdminController {
    protected final Log logger = LogFactory.getLog(getClass());
    private ISettingsService settingsService;
    private ISessionLogService sessionLogService;
    private IStatisticsService statisticsService;

    @RequestMapping(value = "/admin/dashboard.do", method = RequestMethod.GET)
    public String dashboard(HttpServletRequest request, ModelMap model) {
        Statistics statistics = statisticsService.getStatistics();
        model.addAttribute("statistics", statistics);

        SessionLog sessionLog = new SessionLog();
        sessionLog.setPageActived(true);
        sessionLog.setPageNo(request.getParameter("pageNo"));
        sessionLog.setPageSize(request.getParameter("pageSize"));
        sessionLog.addSortProperties("create_date", "desc");
        List<SessionLog> sessionLogList = sessionLogService.findSessionLogWithPage(sessionLog);
        sessionLog.setResults(sessionLogList);
        model.addAttribute("page", sessionLog);
        return "dashboard";
    }

    @RequestMapping(value = "/settings/settings.do", method = RequestMethod.GET)
    public String settings(ModelMap model) {
        Settings settings = settingsService.getSettings();
        model.addAttribute("settings", settings);
        return "settings";
    }

    @RequestMapping(value = "/settings/changeSettings.do", method = RequestMethod.POST)
    public String changeSettings(@ModelAttribute("settings") Settings settings, ModelMap model) {
        settingsService.updateSettings(settings);
        model.addAttribute("settings", settings);
        return "settings";
    }

    public ISettingsService getSettingsService() {
        return settingsService;
    }

    @Autowired
    public void setSettingsService(ISettingsService settingsService) {
        this.settingsService = settingsService;
    }

    public ISessionLogService getSessionLogService() {
        return sessionLogService;
    }

    @Autowired
    public void setSessionLogService(ISessionLogService sessionLogService) {
        this.sessionLogService = sessionLogService;
    }

    public IStatisticsService getStatisticsService() {
        return statisticsService;
    }

    @Autowired
    public void setStatisticsService(IStatisticsService statisticsService) {
        this.statisticsService = statisticsService;
    }
}