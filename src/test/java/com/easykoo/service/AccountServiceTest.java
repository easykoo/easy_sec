package com.easykoo.service;

import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.Page;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Feb 22, 2014    Steven
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml", "classpath:spring-mybatis.xml"})
public class AccountServiceTest {
    private Log logger = LogFactory.getLog(getClass());
    private IAccountService accountService;

    public IAccountService getAccountService() {
        return accountService;
    }

    @Autowired
    public void setAccountService(IAccountService accountService) {
        this.accountService = accountService;
    }

    @Test
    public void test1() {
        Account account = accountService.selectByPrimaryKey(1);
        logger.debug(account.getNickname());
    }

    @Test
    public void testCreateAccount() {
//        Account account = new Account();
//        account.setUsername("test3");
//        account.setNickname("Test3");
//        accountService.insert(account);
//        logger.debug(account.getAccountId());
    }

    @Test
    public void testFindAccountByPage() {
        Account account = new Account();
        account.setDepartmentId(1);
        Page page = new Page();
        page.setPageNo(1);
        page.setPageSize(2);
        page.addSortProperties("nick_name", "asc");
        List<Account> accountList = accountService.findAccountWithPage(account);
        logger.debug(accountList.size());
    }
}
