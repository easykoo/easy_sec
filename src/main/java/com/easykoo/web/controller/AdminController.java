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
@RequestMapping("/admin")
public class AdminController {
    protected final Log logger = LogFactory.getLog(getClass());
    private IAccountService accountService;

    @RequestMapping(value = "/dashboard.do")
    public String dashboard() {
        return "dashboard";
    }

    @RequestMapping(value = "/settings.do")
    public String settings() {
        return "settings";
    }

    @RequestMapping(value = "/profile.do")
    public String profile() {
        return "profile";
    }

    @RequestMapping(value = "/allAccountView.do", method = RequestMethod.GET)
    public String allAccountView() {
        return "allAccount";
    }

    @RequestMapping(value = "/allFeedbackView.do", method = RequestMethod.GET)
    public String allFeedbackView() {
        return "allFeedback";
    }

    @RequestMapping(value = "/allProductView.do", method = RequestMethod.GET)
    public String allProductView() {
        return "allProductView";
    }

    public IAccountService getAccountService() {
        return accountService;
    }

    @Autowired
    public void setAccountService(IAccountService accountService) {
        this.accountService = accountService;
    }
}