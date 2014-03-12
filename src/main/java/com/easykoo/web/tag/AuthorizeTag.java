package com.easykoo.web.tag;

import com.easykoo.mybatis.model.AccountSecurity;
import com.easykoo.service.IPrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

@Component
public class AuthorizeTag extends BodyTagSupport {
    private static IPrivilegeService privilegeService;
    private String test;


    public int doStartTag() throws JspException {
        AccountSecurity accountSecurity = (AccountSecurity) pageContext.getSession().getAttribute("currentAccountSecurity");
        if (privilegeService.isAuthorized(test, accountSecurity)) {
            return EVAL_BODY_INCLUDE;
        } else {
            return SKIP_BODY;
        }
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

    public IPrivilegeService getPrivilegeService() {
        return privilegeService;
    }

    @Autowired
    public void setPrivilegeService(IPrivilegeService privilegeService) {
        this.privilegeService = privilegeService;
    }
}