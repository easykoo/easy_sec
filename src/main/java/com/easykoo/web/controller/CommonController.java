package com.easykoo.web.controller;

import com.easykoo.model.ResponseMessage;
import com.easykoo.mybatis.model.AccountSecurity;
import com.easykoo.service.IFeedbackService;
import com.easykoo.service.ISubscribeService;
import com.easykoo.util.VerifyCodeUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Locale;

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
    @RequestMapping(value = "/common/ajax/checkVerifyCode.do", produces = "application/json")
    public String checkVerifyCode(@RequestParam("verifyCode") String verifyCode, HttpServletRequest request, Locale locale) throws IOException {
        String currentVerifyCode = (String) request.getSession().getAttribute("currentVerifyCode");
        if (currentVerifyCode != null && currentVerifyCode.equals(verifyCode)) {
            return "true";
        }
        return messageSource.getMessage("message.error.wrong.verify.code", null, locale);
    }

    @ResponseBody
    @RequestMapping(value = "/common/ajax/checkSession.do", produces = "application/json")
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