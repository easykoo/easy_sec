package com.easykoo.web.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Feb 22, 2014    Steven
 */

@Controller
@RequestMapping("/")
public class RootController {
    protected final Log logger = LogFactory.getLog(getClass());

    @RequestMapping(value = "index.do")
    public String index() {
        return "index";
    }
}