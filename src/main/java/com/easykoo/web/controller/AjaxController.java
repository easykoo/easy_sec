package com.easykoo.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.DataTablesRequest;
import com.easykoo.mybatis.model.DataTablesResponse;
import com.easykoo.mybatis.model.Page;
import com.easykoo.service.IAccountService;
import com.easykoo.service.IAccountSessionService;

/**
 * Feb 22, 2014    Steven
 */

@Controller
@SessionAttributes({"currentAccountSecurity", "currentVerifyCode"})
@RequestMapping("/ajax")
public class AjaxController {

    protected final Log logger = LogFactory.getLog(getClass());
    private IAccountSessionService accountSessionService;
    private IAccountService accountService;

    @ResponseBody
    @RequestMapping(value = "/allAccount.do", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public List<Account> doAjax(HttpServletResponse response, ModelMap model) {

        Account account = new Account();
        account.setDepartmentId(1);
        account.setPageNo(1);
        account.setPageSize(2);
        account.addSortProperties("nick_name", "asc");
        List<Account> accountList = accountService.findAccountWithPage(account);
        model.addAttribute("page", (Page) account);
        model.addAttribute("accountList", accountList);
        return accountList;
    }

    @RequestMapping(value = "/allAccount.do", produces = "application/json")
    public
    @ResponseBody
//    DataTablesResponse showUser(@ModelAttribute("request") DataTablesRequest request) {
    DataTablesResponse showUser(@RequestParam int iDisplayStart, @RequestParam int iDisplayLength, @RequestParam int iSortCol_0, @RequestParam String sSortDir_0, HttpServletRequest request) {

        DataTablesResponse<Account> dt = new DataTablesResponse<Account>();

        Account account = new Account();
        account.setPageActived(true);
//    account.setDepartmentId(1);
        account.setPageSize(iDisplayLength);
        account.setDisplayStart(iDisplayStart);
        String sortColumn = request.getParameter("mDataProp_" + iSortCol_0);
        account.addSortProperties(sortColumn, sSortDir_0);
        List<Account> accountList = accountService.findAccountWithPage(account);

        dt.setData(accountList);  // this is the dataset reponse to client
        dt.setTotalDisplayRecords(account.getTotalRecord());  // // the total data in db for datatables to calculate page no. and position
        dt.setTotalRecords(account.getTotalRecord());   // the total data in db for datatables to calculate page no.
//        dt.setEcho(request.getEcho());

        return dt;
    }

    @RequestMapping(value = "/deleteAccount.do", produces = "application/json")
    public
    @ResponseBody
    String deleteAccount(@RequestParam(value = "accountId") int accountId) {

        Account dbAccount = accountService.selectByPrimaryKey(accountId);
        if (dbAccount != null) {
            accountService.deleteByPrimaryKey(accountId);
            return "true";
        }
        return "[\"error\":\"no user\"]";
    }

    @RequestMapping(value = "/banAccount.do", produces = "application/json")
    public
    @ResponseBody
    String banAccount(@RequestParam(value = "accountId") int accountId) {

        Account dbAccount = accountService.selectByPrimaryKey(accountId);
        if (dbAccount != null) {
            dbAccount.setActived(false);
            accountService.updateByPrimaryKey(dbAccount);
            return "true";
        }
        return "[\"error\":\"no user\"]";
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
