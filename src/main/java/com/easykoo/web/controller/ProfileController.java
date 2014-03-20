package com.easykoo.web.controller;

import com.easykoo.model.ResponseMessage;
import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.AccountSecurity;
import com.easykoo.mybatis.model.AccountSession;
import com.easykoo.service.IAccountService;
import com.easykoo.service.IAccountSessionService;
import com.easykoo.util.CookiesUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Locale;

/**
 * Feb 22, 2014 Steven
 */

@Controller
public class ProfileController {
    protected final Log logger = LogFactory.getLog(getClass());
    private IAccountSessionService accountSessionService;
    private IAccountService accountService;
    private MessageSource messageSource;


    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String login(HttpServletRequest request) {
        String url = request.getParameter("url");
        AccountSecurity currentAccountSecurity =
                (AccountSecurity) request.getSession().getAttribute("currentAccountSecurity");
        if (currentAccountSecurity != null && currentAccountSecurity.getUsername() != null) {
            logger.debug(currentAccountSecurity.getUsername() + " already signed in!");
            return "index";
        }
        if (StringUtils.isNotBlank(url)) {
            request.getSession().setAttribute("beforeLoginUrl", url);
        }
        return "login";
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(@ModelAttribute("accountSecurity") AccountSecurity accountSecurity,
                        HttpServletRequest request, HttpServletResponse response, Locale locale, ModelMap model) {
        AccountSecurity currentAccountSecurity =
                (AccountSecurity) request.getSession().getAttribute("currentAccountSecurity");
        String url = (String) request.getSession().getAttribute("beforeLoginUrl");
        if (currentAccountSecurity != null && currentAccountSecurity.getUsername() != null) {
            logger.debug(currentAccountSecurity.getUsername() + " already signed in!");
            if (StringUtils.isNotBlank(url)) {
                return "redirect:" + url;
            }
            return "redirect:/index.jsp";
        }

        AccountSecurity dbAccountSecurity = accountService.login(accountSecurity);
        if (dbAccountSecurity != null) {
            dbAccountSecurity = accountService.selectFullByPrimaryKey(dbAccountSecurity.getAccountId());
            logger.debug(dbAccountSecurity.getUsername() + " signs in successfully!");
            request.getSession().setAttribute("currentAccountSecurity", dbAccountSecurity);
            if (accountSecurity.getRememberMe() == 1) {
                CookiesUtil.createCookies(dbAccountSecurity.getUsername(), request.getSession().getId(), response);
                AccountSession accountSession = new AccountSession();
                accountSession.setSessionId(request.getSession().getId());
                accountSession.setUsername(dbAccountSecurity.getUsername());
                accountSession.setAccountId(dbAccountSecurity.getAccountId());
                accountSession.setExpireDate(new Date(new Date().getTime() + CookiesUtil.expiry * 1000));
                accountSessionService.insertSelective(accountSession);
            }
            if (StringUtils.isNotBlank(url)) {
                return "redirect:" + url;
            }
            return "redirect:/index.jsp";
        }

        logger.debug("Invalid username or password!");
        model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.invalid.username.or.password", null, locale)));
        return "login";
    }

    @RequestMapping(value = "/logout.do")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        AccountSecurity currentAccountSecurity =
                (AccountSecurity) request.getSession().getAttribute("currentAccountSecurity");
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

            request.getSession().setAttribute("currentAccountSecurity", new AccountSecurity());
        }
        return "redirect:/index.jsp";
    }

    @RequestMapping(value = "/register.do", method = RequestMethod.GET)
    public String register(HttpServletRequest request) {
        AccountSecurity currentAccountSecurity =
                (AccountSecurity) request.getSession().getAttribute("currentAccountSecurity");
        if (currentAccountSecurity != null && currentAccountSecurity.getUsername() != null) {
            logger.debug(currentAccountSecurity.getUsername() + " already signed in!");
            return "redirect:/index.jsp";
        }
        return "register";
    }

    @RequestMapping(value = "/register.do", method = RequestMethod.POST)
    public String register(@ModelAttribute("accountSecurity") AccountSecurity accountSecurity,
                           HttpServletRequest request, Locale locale, ModelMap model) {
        AccountSecurity currentAccountSecurity =
                (AccountSecurity) request.getSession().getAttribute("currentAccountSecurity");
        if (currentAccountSecurity != null && currentAccountSecurity.getUsername() != null) {
            logger.debug(currentAccountSecurity.getUsername() + " already signed in!");
            return "redirect:/index.jsp";
        }

        String currentVerifyCode = (String) request.getSession().getAttribute("currentVerifyCode");
        if (currentVerifyCode != null && !currentVerifyCode.equals(accountSecurity.getVerifyCode())) {
            logger.debug("Verify code is wrong!");
            model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.wrong.verify.code", null, locale)));
            return "register";
        }

        try {
            accountService.insertFullAccount(accountSecurity);
            AccountSecurity dbAccountSecurity =
                    accountService.selectFullByPrimaryKey(accountSecurity.getAccountId());
            logger.debug(dbAccountSecurity.getUsername() + " signs in successfully!");
            request.getSession().setAttribute("currentAccountSecurity", dbAccountSecurity);
        } catch (DuplicateKeyException e) {
            logger.error("Duplicate key!", e);
            model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.duplicate.key", null, locale)));
            return "register";
        }
        return "redirect:/index.jsp";
    }

    @RequestMapping(value = "/profile/profile.do", method = RequestMethod.GET)
    public String profile() {
        return "profile";
    }

    @RequestMapping(value = "/profile/preferences.do", method = RequestMethod.GET)
    public String preferences() {
        return "preferences";
    }

    @RequestMapping(value = "/profile/password.do", method = RequestMethod.GET)
    public String password() {
        return "password";
    }

    @RequestMapping(value = "/profile/changeProfile.do", method = RequestMethod.POST)
    public String changeProfile(@ModelAttribute("account") Account account,
                                HttpServletRequest request, Locale locale, ModelMap model) {
        try {
            accountService.updateByPrimaryKeySelective(account);
            logger.debug(account.getUsername() + " updated successfully!");
            AccountSecurity dbAccountSecurity = accountService.selectFullByPrimaryKey(account.getAccountId());
            request.getSession().setAttribute("currentAccountSecurity", dbAccountSecurity);
            model.addAttribute("message", new ResponseMessage(true, messageSource.getMessage("message.change.success", null, locale)));
        } catch (DuplicateKeyException e) {
            logger.error("Duplicate key!", e);
            model.addAttribute("message", new ResponseMessage(true, messageSource.getMessage("message.error.duplicate.key", null, locale)));
        }
        return "profile";
    }

    @RequestMapping(value = "/profile/password.do", method = RequestMethod.POST)
    public String changePassword(@RequestParam("accountId") Integer accountId, @RequestParam("currentPassword") String currentPassword,
                                 @RequestParam("newPassword") String newPassword, Locale locale, ModelMap model) {
        boolean checked = accountService.checkPassword(accountId, currentPassword);
        if (checked) {
            AccountSecurity dbAccountSecurity = accountService.selectFullByPrimaryKey(accountId);
            dbAccountSecurity.setPassword(newPassword);
            accountService.updateByPrimaryKey(dbAccountSecurity);
            model.addAttribute("message", new ResponseMessage(true, messageSource.getMessage("message.change.success", null, locale)));
        } else {
            model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.wrong.password", null, locale)));
        }
        return "password";
    }

    @ResponseBody
    @RequestMapping(value = "/profile/ajax/checkUsername.do", produces = "application/json")
    public String checkUsername(@RequestParam("username") String username, Locale locale) {
        if (accountService.checkUsername(username)) {
            return messageSource.getMessage("message.error.already.exists", null, locale);
        }
        return "true";
    }

    @ResponseBody
    @RequestMapping(value = "/profile/ajax/checkEmail.do", produces = "application/json")
    public String checkEmail(@RequestParam("email") String email, HttpServletRequest request, Locale locale) {
        AccountSecurity currentAccountSecurity =
                (AccountSecurity) request.getSession().getAttribute("currentAccountSecurity");
        if (currentAccountSecurity != null && email.equals(currentAccountSecurity.getEmail())) {
            return "true";
        }
        if (accountService.checkEmail(email)) {
            return messageSource.getMessage("message.error.already.exists", null, locale);
        }
        return "true";
    }

    public MessageSource getMessageSource() {
        return messageSource;
    }

    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
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
