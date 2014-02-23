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
    private String uri;


    public int doStartTag() throws JspException {
        AccountSecurity accountSecurity = (AccountSecurity) pageContext.getSession().getAttribute("currentAccountSecurity");
        if (privilegeService.isAuthorized(uri, accountSecurity)) {
            return EVAL_BODY_INCLUDE;
        } else {
            return SKIP_BODY;
        }
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public IPrivilegeService getPrivilegeService() {
        return privilegeService;
    }

    @Autowired
    public void setPrivilegeService(IPrivilegeService privilegeService) {
        this.privilegeService = privilegeService;
    }
}