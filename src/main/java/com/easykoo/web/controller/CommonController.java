package com.easykoo.web.controller;

import com.easykoo.model.DataTablesResponse;
import com.easykoo.model.ResponseMessage;
import com.easykoo.mybatis.model.AccountSecurity;
import com.easykoo.mybatis.model.Feedback;
import com.easykoo.mybatis.model.Subscribe;
import com.easykoo.service.IFeedbackService;
import com.easykoo.service.ISubscribeService;
import com.easykoo.util.VerifyCodeUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.math.BigInteger;
import java.util.Locale;
import java.util.Random;

/**
 * Feb 22, 2014    Steven
 */

@Controller
public class CommonController {
    protected final Log logger = LogFactory.getLog(getClass());
    private IFeedbackService feedbackService;
    private ISubscribeService subscribeService;
    private MessageSource messageSource;

    @RequestMapping(value = "/index.do")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/common/getVerifyCodeImage.do")
    public void getVerifyCodeImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);
        BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 3, true, Color.WHITE, Color.BLACK, null);

        request.getSession().setAttribute("currentVerifyCode", verifyCode);
        logger.debug("CurrentVerifyCode is " + verifyCode + "!");

        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
    }

    @ResponseBody
    @RequestMapping(value = "/common/getFormToken.do")
    public String getVerifyCode(HttpServletRequest request, ModelMap model) throws IOException {
        String formToken = new BigInteger(165, new Random()).toString(36).toUpperCase();
        request.getSession().setAttribute("currentFormToken", formToken);
        return formToken;
    }

    @ResponseBody
    @RequestMapping(value = "/ajax/checkVerifyCode.do", produces = "application/json")
    public String checkVerifyCode(@RequestParam("verifyCode") String verifyCode, HttpServletRequest request, Locale locale) throws IOException {
        String currentVerifyCode = (String) request.getSession().getAttribute("currentVerifyCode");
        if (currentVerifyCode != null && currentVerifyCode.equals(verifyCode)) {
            return "true";
        }
        return messageSource.getMessage("message.error.wrong.verify.code", null, locale);
    }

    @ResponseBody
    @RequestMapping(value = "/ajax/addFeedback.do", produces = "application/json", method = RequestMethod.POST)
    public String addFeedback(@ModelAttribute("feedback") Feedback feedback) {
        feedbackService.insert(feedback);
        return "true";
    }

    @ResponseBody
    @RequestMapping(value = "/ajax/readFeedback.do", produces = "application/json", method = RequestMethod.POST)
    public String readFeedback(@RequestParam(value = "id") int id) {
        Feedback feedback = feedbackService.selectByPrimaryKey(id);
        feedback.setViewed(true);
        feedbackService.updateByPrimaryKey(feedback);
        return "true";
    }

    @ResponseBody
    @RequestMapping(value = "/ajax/getFeedbackCount.do", produces = "application/json", method = RequestMethod.POST)
    public int getFeedbackCount() {
        return feedbackService.getUnreadFeedbackCount();
    }

    @ResponseBody
    @RequestMapping(value = "/ajax/getTop5Feedback.do", produces = "application/json", method = RequestMethod.POST)
    public java.util.List<Feedback> getTop5Feedback() {
        return feedbackService.getTop5Feedback();
    }

    @ResponseBody
    @RequestMapping(value = "/ajax/deleteFeedback.do", produces = "application/json", method = RequestMethod.POST)
    public String deleteFeedback(@RequestParam(value = "id") int id) {
        Feedback feedback = feedbackService.selectByPrimaryKey(id);
        if (feedback != null) {
            feedbackService.deleteByPrimaryKey(id);
            return "true";
        }
        return "{\"error\":\"Feedback doesn't exist!\"}";
    }


    @ResponseBody
    @RequestMapping(value = "/ajax/subscribe.do", produces = "application/json", method = RequestMethod.POST)
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
    @RequestMapping(value = "/ajax/allFeedback.do", produces = "application/json", method = RequestMethod.POST)
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

    @ResponseBody
    @RequestMapping(value = "/ajax/checkSession.do", produces = "application/json", method = RequestMethod.POST)
    public ResponseMessage checkSession(HttpServletRequest request) throws IOException {
        AccountSecurity currentAccountSecurity =
                (AccountSecurity) request.getSession().getAttribute("currentAccountSecurity");
        if (currentAccountSecurity != null && currentAccountSecurity.getUsername() != null) {
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false);
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