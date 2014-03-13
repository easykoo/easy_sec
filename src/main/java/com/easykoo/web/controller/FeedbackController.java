package com.easykoo.web.controller;

import com.easykoo.model.DataTablesResponse;
import com.easykoo.mybatis.model.Feedback;
import com.easykoo.mybatis.model.Subscribe;
import com.easykoo.service.IFeedbackService;
import com.easykoo.service.ISubscribeService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Feb 22, 2014    Steven
 */

@Controller
public class FeedbackController {
    protected final Log logger = LogFactory.getLog(getClass());
    private IFeedbackService feedbackService;
    private ISubscribeService subscribeService;
    private MessageSource messageSource;


    @RequestMapping(value = "/feedback/allFeedback.do", method = RequestMethod.GET)
    public String allFeedback() {
        return "allFeedback";
    }

    @ResponseBody
    @RequestMapping(value = "/feedback/ajax/addFeedback.do", produces = "application/json", method = RequestMethod.POST)
    public String addFeedback(@ModelAttribute("feedback") Feedback feedback) {
        feedbackService.insert(feedback);
        return "true";
    }

    @ResponseBody
    @RequestMapping(value = "/feedback/ajax/readFeedback.do", produces = "application/json", method = RequestMethod.POST)
    public String readFeedback(@RequestParam(value = "id") int id) {
        Feedback feedback = feedbackService.selectByPrimaryKey(id);
        feedback.setViewed(true);
        feedbackService.updateByPrimaryKey(feedback);
        return "true";
    }

    @ResponseBody
    @RequestMapping(value = "/feedback/ajax/getFeedbackCount.do", produces = "application/json", method = RequestMethod.POST)
    public int getFeedbackCount() {
        return feedbackService.getUnreadFeedbackCount();
    }

    @ResponseBody
    @RequestMapping(value = "/feedback/ajax/getTop5Feedback.do", produces = "application/json", method = RequestMethod.POST)
    public java.util.List<Feedback> getTop5Feedback() {
        return feedbackService.getTop5Feedback();
    }

    @ResponseBody
    @RequestMapping(value = "/feedback/ajax/deleteFeedback.do", produces = "application/json", method = RequestMethod.POST)
    public String deleteFeedback(@RequestParam(value = "id") int id) {
        Feedback feedback = feedbackService.selectByPrimaryKey(id);
        if (feedback != null) {
            feedbackService.deleteByPrimaryKey(id);
            return "true";
        }
        return "{\"error\":\"Feedback doesn't exist!\"}";
    }

    @ResponseBody
    @RequestMapping(value = "/feedback/ajax/subscribe.do", produces = "application/json", method = RequestMethod.POST)
    public String subscribe(@ModelAttribute("subscribe") Subscribe subscribe) {
        try {
            subscribeService.insert(subscribe);
        } catch (DuplicateKeyException e) {
            logger.error(e);
            return "{\"error\":\"Already\"}";
        }
        return "true";
    }

    @ResponseBody
    @RequestMapping(value = "/feedback/ajax/allFeedback.do", produces = "application/json", method = RequestMethod.POST)
    public DataTablesResponse allFeedback(@RequestParam int iDisplayStart, @RequestParam int iDisplayLength, @RequestParam int iSortCol_0, @RequestParam String sSortDir_0, HttpServletRequest request) {
        DataTablesResponse<Feedback> dt = new DataTablesResponse();

        Feedback feedback = new Feedback();
        feedback.setPageActived(true);
        feedback.setPageSize(iDisplayLength);
        feedback.setDisplayStart(iDisplayStart);
        String sortColumn = request.getParameter("mDataProp_" + iSortCol_0);
        feedback.addSortProperties(sortColumn, sSortDir_0);
        java.util.List<Feedback> feedbackList = feedbackService.findFeedbackWithPage(feedback);

        dt.setData(feedbackList);
        dt.setTotalDisplayRecords(feedback.getTotalRecord());
        dt.setTotalRecords(feedback.getTotalRecord());
        return dt;
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

    public MessageSource getMessageSource() {
        return messageSource;
    }

    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
}