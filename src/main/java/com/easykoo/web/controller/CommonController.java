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
        //设置页面不缓存
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);
        //将验证码放到HttpSession里面
        request.getSession().setAttribute("currentVerifyCode", verifyCode);
        model.addAttribute("currentVerifyCode", verifyCode);
        logger.debug("CurrentVerifyCode is " + verifyCode + "!");
        //设置输出的内容的类型为JPEG图像
        response.setContentType("image/jpeg");
        BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 3, true, Color.WHITE, Color.BLACK, null);
        //写给浏览器
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