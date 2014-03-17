package com.easykoo.web.controller;

import com.easykoo.model.DataTablesResponse;
import com.easykoo.model.ResponseMessage;
import com.easykoo.mybatis.model.Account;
import com.easykoo.service.IAccountService;
import com.easykoo.service.IAccountSessionService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Locale;

/**
 * Feb 22, 2014 Steven
 */

@Controller
public class AccountController {
    protected final Log logger = LogFactory.getLog(getClass());
    private IAccountSessionService accountSessionService;
    private IAccountService accountService;
    private MessageSource messageSource;

    @RequestMapping(value = "/account/allAccount.do", method = RequestMethod.GET)
    public String allAccount() {
        return "allAccount";
    }

    @ResponseBody
    @RequestMapping(value = "/account/ajax/allAccount.do", produces = "application/json")
    public DataTablesResponse allAccount(@RequestParam int iDisplayStart, @RequestParam int iDisplayLength, @RequestParam int iSortCol_0, @RequestParam String sSortDir_0, HttpServletRequest request) {
        DataTablesResponse<Account> dt = new DataTablesResponse();

        Account account = new Account();
        account.setPageActived(true);
        account.setPageSize(iDisplayLength);
        account.setDisplayStart(iDisplayStart);
        String sortColumn = request.getParameter("mDataProp_" + iSortCol_0);
        account.addSortProperties(sortColumn, sSortDir_0);
        List<Account> accountList = accountService.findAccountWithPage(account);

        dt.setData(accountList);
        dt.setTotalDisplayRecords(account.getTotalRecord());
        dt.setTotalRecords(account.getTotalRecord());
        return dt;
    }

    @ResponseBody
    @RequestMapping(value = "/account/ajax/deleteAccount.do", produces = "application/json")
    public ResponseMessage deleteAccount(@RequestParam(value = "accountId") int accountId, Locale locale) {
        Account dbAccount = accountService.selectByPrimaryKey(accountId);
        if (dbAccount != null) {
            accountService.deleteByPrimaryKey(accountId);
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false, messageSource.getMessage("message.error.can.not.find.record", null, locale));
    }

    @ResponseBody
    @RequestMapping(value = "/account/ajax/banAccount.do", produces = "application/json")
    public ResponseMessage banAccount(@RequestParam(value = "accountId") int accountId, Locale locale) {
        Account dbAccount = accountService.selectByPrimaryKey(accountId);
        if (dbAccount != null) {
            dbAccount.setLocked(true);
            accountService.updateByPrimaryKey(dbAccount);
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false, messageSource.getMessage("message.error.can.not.find.record", null, locale));
    }

    @ResponseBody
    @RequestMapping(value = "/account/ajax/unbanAccount.do", produces = "application/json")
    public ResponseMessage unbanAccount(@RequestParam(value = "accountId") int accountId, Locale locale) {
        Account dbAccount = accountService.selectByPrimaryKey(accountId);
        if (dbAccount != null) {
            dbAccount.setLocked(false);
            accountService.updateByPrimaryKey(dbAccount);
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false, messageSource.getMessage("message.error.can.not.find.record", null, locale));
    }

    @ResponseBody
    @RequestMapping(value = "/account/ajax/makeAdmin.do", produces = "application/json")
    public ResponseMessage makeAdmin(@RequestParam(value = "accountId") int accountId, Locale locale) {
        Account dbAccount = accountService.selectByPrimaryKey(accountId);
        if (dbAccount != null) {
            dbAccount.setRoleId(1);
            accountService.updateByPrimaryKey(dbAccount);
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false, messageSource.getMessage("message.error.can.not.find.record", null, locale));
    }

    @ResponseBody
    @RequestMapping(value = "/account/ajax/hire.do", produces = "application/json")
    public ResponseMessage hire(@RequestParam(value = "accountId") int accountId, Locale locale) {
        Account dbAccount = accountService.selectByPrimaryKey(accountId);
        if (dbAccount != null) {
            dbAccount.setRoleId(2);
            accountService.updateByPrimaryKey(dbAccount);
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false, messageSource.getMessage("message.error.can.not.find.record", null, locale));
    }

    @ResponseBody
    @RequestMapping(value = "/account/ajax/fire.do", produces = "application/json")
    public ResponseMessage fire(@RequestParam(value = "accountId") int accountId, Locale locale) {
        Account dbAccount = accountService.selectByPrimaryKey(accountId);
        if (dbAccount != null) {
            dbAccount.setRoleId(3);
            accountService.updateByPrimaryKey(dbAccount);
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false, messageSource.getMessage("message.error.can.not.find.record", null, locale));
    }

    @ResponseBody
    @RequestMapping(value = "/account/ajax/deleteAccounts.do", produces = "application/json")
    public ResponseMessage deleteAccounts(Integer[] accounts, Locale locale) {
        if (accounts.length > 1) {
            for (int i = 0; i < accounts.length; i++) {
                accountService.deleteByPrimaryKey(accounts[i]);
            }
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false, messageSource.getMessage("message.error.can.not.find.record", null, locale));
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
