package com.easykoo.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easykoo.mybatis.model.*;
import com.easykoo.service.IFeedbackService;
import com.easykoo.service.ISubscribeService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

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
    private IFeedbackService feedbackService;
    private ISubscribeService subscribeService;

    @ResponseBody
    @RequestMapping(value = "/allAccount.do", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public List<Account> doAjax(HttpServletResponse response, ModelMap model) {

        Account account = new Account();
        account.setDepartmentId(1);
        account.setPageNo(1);
        account.setPageSize(2);
        account.addSortProperties("nick_name", "asc");
        List<Account> accountList = accountService.findAccountWithPage(account);
        model.addAttribute("page", account);
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
        return "{\"error\":\"no user\"}";
    }

    @RequestMapping(value = "/banAccount.do", produces = "application/json")
    public
    @ResponseBody
    String banAccount(@RequestParam(value = "accountId") int accountId) {

        Account dbAccount = accountService.selectByPrimaryKey(accountId);
        if (dbAccount != null) {
            dbAccount.setLocked(true);
            accountService.updateByPrimaryKey(dbAccount);
            return "true";
        }
        return "{\"error\":\"no user\"}";
    }

    @RequestMapping(value = "/unbanAccount.do", produces = "application/json")
    public
    @ResponseBody
    String unbanAccount(@RequestParam(value = "accountId") int accountId) {
        Account dbAccount = accountService.selectByPrimaryKey(accountId);
        if (dbAccount != null) {
            dbAccount.setLocked(false);
            accountService.updateByPrimaryKey(dbAccount);
            return "true";
        }
        return "{\"error\":\"no user\"}";
    }

    @RequestMapping(value = "/adminAccount.do", produces = "application/json")
    public
    @ResponseBody
    String adminAccount(@RequestParam(value = "accountId") int accountId) {
        Account dbAccount = accountService.selectByPrimaryKey(accountId);
        if (dbAccount != null) {
            dbAccount.setRoleId(1);
            accountService.updateByPrimaryKey(dbAccount);
            return "true";
        }
        return "{\"error\":\"no user\"}";
    }

    @ResponseBody
    @RequestMapping(value = "/addFeedback.do")
    public String registerAccount(@ModelAttribute("feedback") Feedback feedback) {
        feedbackService.insert(feedback);
        return "true";
    }

    @ResponseBody
    @RequestMapping(value = "/readFeedback.do")
    public String readFeedback(@RequestParam(value = "id") int id) {
        Feedback feedback = feedbackService.selectByPrimaryKey(id);
        feedback.setViewed(true);
        feedbackService.updateByPrimaryKey(feedback);
        return "true";
    }

    @ResponseBody
    @RequestMapping(value = "/getFeedbackCount.do")
    public int getFeedbackCount() {
        return feedbackService.getUnreadFeedbackCount();
    }

    @ResponseBody
    @RequestMapping(value = "/getTop5Feedback.do")
    public List<Feedback> getTop5Feedback() {
        return feedbackService.getTop5Feedback();
    }

    @RequestMapping(value = "/deleteFeedback.do", produces = "application/json")
    public
    @ResponseBody
    String deleteFeedback(@RequestParam(value = "id") int id) {
        feedbackService.deleteByPrimaryKey(id);
        return "true";
    }

    @ResponseBody
    @RequestMapping(value = "/subscribe.do")
    public String registerAccount(@RequestParam("email") String email) {
        Subscribe subscribe = new Subscribe();
        subscribe.setEmail(email);
        subscribeService.insert(subscribe);
        return "true";
    }


    @RequestMapping(value = "/allFeedback.do", produces = "application/json")
    public
    @ResponseBody
    DataTablesResponse allFeedback(@RequestParam int iDisplayStart, @RequestParam int iDisplayLength, @RequestParam int iSortCol_0, @RequestParam String sSortDir_0, HttpServletRequest request) {

        DataTablesResponse<Feedback> dt = new DataTablesResponse<Feedback>();

        Feedback feedback = new Feedback();
        feedback.setPageActived(true);
        feedback.setPageSize(iDisplayLength);
        feedback.setDisplayStart(iDisplayStart);
        String sortColumn = request.getParameter("mDataProp_" + iSortCol_0);
        feedback.addSortProperties(sortColumn, sSortDir_0);
        List<Feedback> feedbackList = feedbackService.findFeedbackWithPage(feedback);

        dt.setData(feedbackList);  // this is the dataset reponse to client
        dt.setTotalDisplayRecords(feedback.getTotalRecord());  // // the total data in db for datatables to calculate page no. and position
        dt.setTotalRecords(feedback.getTotalRecord());   // the total data in db for datatables to calculate page no.
        return dt;
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

    public IFeedbackService getFeedbackService() {
        return feedbackService;
    }

    @Autowired
    public void setFeedbackService(IFeedbackService feedbackService) {
        this.feedbackService = feedbackService;
    }

    public ISubscribeService getSubscribeService() {
        return subscribeService;
    }

    @Autowired
    public void setSubscribeService(ISubscribeService subscribeService) {
        this.subscribeService = subscribeService;
    }
}
