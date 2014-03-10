package com.easykoo.service;

import com.easykoo.util.EncryptUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Feb 22, 2014    Steven
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml", "classpath:spring-mybatis.xml"})
public class CommonTest {
    private Log logger = LogFactory.getLog(getClass());

    @Test
    public void test1MD5() {
        logger.info(EncryptUtils.MD5("1"));
    }
}
