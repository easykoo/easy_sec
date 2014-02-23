package com.easykoo.service;

import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.Privilege;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Feb 22, 2014    Steven
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml", "classpath:spring-mybatis.xml"})
public class PrivilegeServiceTest {
    private Log logger = LogFactory.getLog(getClass());
    private IPrivilegeService privilegeService;

    public IPrivilegeService getPrivilegeService() {
        return privilegeService;
    }

    @Autowired
    public void setPrivilegeService(IPrivilegeService privilegeService) {
        this.privilegeService = privilegeService;
    }

    @Test
    public void test1() {
        Privilege privilege = privilegeService.selectByPrimaryKey(1);
        logger.debug(privilege.getType());
//        privilege.setRoleId(5);
//        privilege.setUrl("create.do");
//        boolean b = privilegeService.hasPrivilege(privilege);
//        logger.debug(b);
    }
    @Test
    public void test2(){
        Account account =new Account();
        account.setRoleId(1);
        account.setDepartmentId(1);
        boolean b = privilegeService.isAuthorized("admin/allAccount.do", account);
        logger.debug(b);
    }
}
