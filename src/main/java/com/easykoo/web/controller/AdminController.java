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

    @RequestMapping(value = "/dashboard.do", method = RequestMethod.GET)
    public String dashboard() {
        return "dashboard";
    }

    @RequestMapping(value = "/settings.do", method = RequestMethod.GET)
    public String settings() {
        return "settings";
    }

    @RequestMapping(value = "/profile.do", method = RequestMethod.GET)
    public String profile() {
        return "profile";
    }

    @RequestMapping(value = "/preferences.do", method = RequestMethod.GET)
    public String preferences() {
        return "preferences";
    }

    @RequestMapping(value = "/password.do", method = RequestMethod.GET)
    public String password() {
        return "password";
    }

    @RequestMapping(value = "/allAccount.do", method = RequestMethod.GET)
    public String allAccount() {
        return "allAccount";
    }

    @RequestMapping(value = "/allFeedback.do", method = RequestMethod.GET)
    public String allFeedback() {
        return "allFeedback";
    }

    @RequestMapping(value = "/allProduct.do", method = RequestMethod.GET)
    public String allProduct() {
        return "allProduct";
    }

    @RequestMapping(value = "/publishProduct.do", method = RequestMethod.GET)
    public String publishProduct() {
        return "publishProduct";
    }

    @RequestMapping(value = "/allCategory.do", method = RequestMethod.GET)
    public String allCategory() {
        return "allCategory";
    }

    @RequestMapping(value = "/allNotice.do", method = RequestMethod.GET)
    public String allNotice() {
        return "allNotice";
    }

    @RequestMapping(value = "/publishNotice.do", method = RequestMethod.GET)
    public String publishNotice() {
        return "publishNotice";
    }

    public IAccountService getAccountService() {
        return accountService;
    }

    @Autowired
    public void setAccountService(IAccountService accountService) {
        this.accountService = accountService;
    }
}