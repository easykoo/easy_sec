package com.easykoo.common;

import com.easykoo.mybatis.model.Account;
import com.easykoo.service.IAccountService;
import com.easykoo.service.IFunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Feb 22, 2014    Steven
 */
@Service("privilegeManager")
public class PrivilegeManager {
    private IFunctionService functionService;
    private IAccountService accountService;
    private static PrivilegeManager instance;

    public static PrivilegeManager getInstance() {
        if (instance == null) {
            instance = new PrivilegeManager();
        }
        return instance;
    }

    public IFunctionService getFunctionService() {
        return functionService;
    }

    @Autowired
    public void setFunctionService(IFunctionService functionService) {
        this.functionService = functionService;
    }

    public IAccountService getAccountService() {
        return accountService;
    }

    @Autowired
    public void setAccountService(IAccountService accountService) {
        this.accountService = accountService;
    }

    private PrivilegeManager() {
    }

    public List<Account> getAllAccount() {
        return accountService.getAllAccount();
    }

}
