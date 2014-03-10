package com.easykoo.web.controller;

import com.easykoo.util.VerifyCodeUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.math.BigInteger;
import java.util.Random;

/**
 * Feb 22, 2014    Steven
 */

@Controller
@RequestMapping("/common")
public class CommonController {
    protected final Log logger = LogFactory.getLog(getClass());

    @RequestMapping("/getVerifyCodeImage.do")
    public void getVerifyCodeImage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws IOException {
        String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);
        BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 3, true, Color.WHITE, Color.BLACK, null);

        request.getSession().setAttribute("currentVerifyCode", verifyCode);
        model.addAttribute("currentVerifyCode", verifyCode);
        logger.debug("CurrentVerifyCode is " + verifyCode + "!");

        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
    }

    @ResponseBody
    @RequestMapping("/getFormToken.do")
    public String getVerifyCode(HttpServletRequest request, ModelMap model) throws IOException {
        String formToken = new BigInteger(165, new Random()).toString(36).toUpperCase();
        request.getSession().setAttribute("currentFormToken", formToken);
        return formToken;
    }

}