package com.easykoo.service;

import com.easykoo.mybatis.model.Function;
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
public class FunctionServiceTest {
    private Log logger = LogFactory.getLog(getClass());
    private IFunctionService functionService;

    public IFunctionService getFunctionService() {
        return functionService;
    }
    @Autowired
    public void setFunctionService(IFunctionService functionService) {
        this.functionService = functionService;
    }

    @Test
    public void test1() {
        Function function = functionService.selectByPrimaryKey(1);
        logger.debug(function.getPrivilegeList());
//        privilege.setRoleId(5);
//        privilege.setUrl("create.do");
//        boolean b = privilegeService.hasPrivilege(privilege);
//        logger.debug(b);
    }
}
