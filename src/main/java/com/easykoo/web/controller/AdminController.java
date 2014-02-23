package com.easykoo.web.controller;

import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.Page;
import com.easykoo.service.IAccountService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Feb 22, 2014    Steven
 */

@Controller
@RequestMapping("/admin")
public class AdminController {
    protected final Log logger = LogFactory.getLog(getClass());
    private IAccountService accountService;

    @RequestMapping(value = "/dashboard.do")
    public String index(ModelMap model) {
        return "dashboard";
    }


    @RequestMapping(value = "/allAccountView.do", method = RequestMethod.GET)
    public String allAccountView(ModelMap model) {
        return "allAccount";
    }

    public IAccountService getAccountService() {
        return accountService;
    }
    @Autowired
    public void setAccountService(IAccountService accountService) {
        this.accountService = accountService;
    }
}