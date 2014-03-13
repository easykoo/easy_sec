package com.easykoo.web.controller;

import com.easykoo.service.IAccountService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Feb 22, 2014    Steven
 */

@Controller
public class AdminController {
    protected final Log logger = LogFactory.getLog(getClass());
    private IAccountService accountService;

    @RequestMapping(value = "/admin/dashboard.do", method = RequestMethod.GET)
    public String dashboard() {
        return "dashboard";
    }

    @RequestMapping(value = "/admin/settings.do", method = RequestMethod.GET)
    public String settings() {
        return "settings";
    }

    public IAccountService getAccountService() {
        return accountService;
    }

    @Autowired
    public void setAccountService(IAccountService accountService) {
        this.accountService = accountService;
    }
}