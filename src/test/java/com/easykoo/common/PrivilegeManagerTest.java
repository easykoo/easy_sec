package com.easykoo.common;

import com.easykoo.mybatis.model.Account;
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
public class PrivilegeManagerTest {
    private Log logger = LogFactory.getLog(getClass());

    @Test
    public void test1(){
//        List<Account> accountList = privilegeManager.getAllAccount();
//        logger.debug(accountList.size());
    }
}
