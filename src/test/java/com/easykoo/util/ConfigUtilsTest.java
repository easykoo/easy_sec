package com.easykoo.util;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by Jesse on 14-3-12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml", "classpath:spring-mybatis.xml"})
public class ConfigUtilsTest {
    private Log logger = LogFactory.getLog(getClass());

    @Test
    public void test1() {
        String[] url = ConfigUtils.getInstance().getNoNeedLoginUrl();
        logger.info(url);
    }
}
