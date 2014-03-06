package com.easykoo.web.controller;

import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.AccountSecurity;
import com.easykoo.mybatis.model.AccountSession;
import com.easykoo.mybatis.model.Page;
import com.easykoo.service.IAccountService;
import com.easykoo.service.IAccountSessionService;
import com.easykoo.util.CookiesUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * Feb 22, 2014    Steven
 */

@Controller
@SessionAttributes({"currentAccountSecurity", "currentVerifyCode"})
@RequestMapping("/account")
public class AccountController {

    protected final Log logger = LogFactory.getLog(getClass());
    private IAccountSessionService accountSessionService;
    private IAccountService accountService;

    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String loginForm(ModelMap model) {
        return "login";
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(@ModelAttribute("accountSecurity") AccountSecurity accountSecurity, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        AccountSecurity currentAccountSecurity = (AccountSecurity) model.get("currentAccountSecurity");
        if (currentAccountSecurity != null && currentAccountSecurity.getUsername() != null) {
            logger.debug(currentAccountSecurity.getUsername() + " already signed in!");
            return "redirect:/admin/dashboard.do";
        }

        String token = (String) request.getSession().getAttribute("currentFormToken");
        if (token != null && !token.equals(accountSecurity.getToken())) {
            logger.debug("Token is wrong!");
            model.addAttribute("errorMessage", "Duplicate submit!");
            return "login";
        }

        AccountSecurity dbAccountSecurity = accountService.login(accountSecurity);
        if (dbAccountSecurity != null) {
            dbAccountSecurity = accountService.selectFullByPrimaryKey(dbAccountSecurity.getAccountId());
            logger.debug(dbAccountSecurity.getUsername() + " signs in successfully!");
            model.addAttribute("currentAccountSecurity", dbAccountSecurity);
            if (accountSecurity.getRememberMe() == 1) {
                CookiesUtil.createCookies(dbAccountSecurity.getUsername(), request.getSession().getId(), response);
                AccountSession accountSession = new AccountSession();
                accountSession.setSessionId(request.getSession().getId());
                accountSession.setUsername(dbAccountSecurity.getUsername());
                accountSession.setAccountId(dbAccountSecurity.getAccountId());
                accountSession.setExpireDate(new Date(new Date().getTime() + CookiesUtil.expiry * 1000));
                accountSessionService.insertSelective(accountSession);
            }
            return "redirect:/admin/dashboard.do";
        }

        logger.debug("Invalid username or password!");
        model.addAttribute("errorMessage", "Invalid username or password!");
        return "login";
    }


    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        AccountSecurity currentAccountSecurity = (AccountSecurity) request.getSession().getAttribute("currentAccountSecurity");
        if (currentAccountSecurity != null && currentAccountSecurity.getUsername() != null) {
            accountSessionService.deleteByAccountId(currentAccountSecurity.getAccountId());

            Cookie ckUsername, ckSessionId;
            ckUsername = new Cookie("username", null);
            ckUsername.setMaxAge(0);
            ckUsername.setPath("/");
            response.addCookie(ckUsername);

            ckSessionId = new Cookie("sessionId", null);
            ckSessionId.setMaxAge(0);
            ckSessionId.setPath("/");
            response.addCookie(ckSessionId);
            logger.debug(currentAccountSecurity.getUsername() + " logout!");

            model.addAttribute("currentAccountSecurity", new AccountSecurity());
        }
        return "login";
    }


    @RequestMapping(value = "/registerAccountView.do")
    public String registerAccountView(ModelMap model) {
        return "registerAccount";
    }

    @RequestMapping(value = "/registerAccount.do")
    public String registerAccount(@ModelAttribute("accountSecurity") AccountSecurity accountSecurity, HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        String currentVerifyCode = (String) request.getSession().getAttribute("currentVerifyCode");
        if (currentVerifyCode != null && !currentVerifyCode.equals(accountSecurity.getVerifyCode())) {
            logger.debug("Verify code is wrong!");
            model.addAttribute("errorMessage", "wrong verify code!");
            return "registerAccount";
        }

        String token = (String) request.getSession().getAttribute("currentFormToken");
        if (token != null && !token.equals(accountSecurity.getToken())) {
            logger.debug("Token is wrong!");
            model.addAttribute("errorMessage", "Duplicate submit!");
            return "registerAccount";
        }

        try {
            accountService.insertFullAccount(accountSecurity);
            AccountSecurity dbAccountSecurity = accountService.selectFullByPrimaryKey(accountSecurity.getAccountId());
            logger.debug(dbAccountSecurity.getUsername() + " signs in successfully!");
            request.getSession().setAttribute("currentAccountSecurity", dbAccountSecurity);
        } catch (DuplicateKeyException e) {
            logger.error("Duplicate key!", e);
            model.addAttribute("errorMessage", "Duplicate key!");
            return "registerAccount";
        }
        return "redirect:/index.jsp";
    }

    public IAccountService getAccountService() {
        return accountService;
    }

    @Autowired
    public void setAccountService(IAccountService accountService) {
        this.accountService = accountService;
    }

    public IAccountSessionService getAccountSessionService() {
        return accountSessionService;
    }

    @Autowired
    public void setAccountSessionService(IAccountSessionService accountSessionService) {
        this.accountSessionService = accountSessionService;
    }
}