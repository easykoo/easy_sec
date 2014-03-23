package com.easykoo.web.controller;

import com.easykoo.model.Settings;
import com.easykoo.service.ISettingsService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Feb 22, 2014    Steven
 */

@Controller
public class AdminController {
    protected final Log logger = LogFactory.getLog(getClass());
    private ISettingsService settingsService;

    @RequestMapping(value = "/admin/dashboard.do", method = RequestMethod.GET)
    public String dashboard() {
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
}