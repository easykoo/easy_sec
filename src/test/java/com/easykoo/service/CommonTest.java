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

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Feb 22, 2014    Steven
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml", "classpath:spring-mybatis.xml"})
public class CommonTest {
    private Log logger = LogFactory.getLog(getClass());

    @Test
    public void test1() {

        Pattern p = Pattern.compile(".*.jsp"); // 正则表达式
        Matcher m = p.matcher("http://127.0.0.1:8080/easykoo/index.jsp"); // 操作的字符串
        boolean a  = m.matches(); //返回是否匹配的结果
        boolean b = m.find(); //返回是否匹配的结果
        boolean c = m.lookingAt(); //返回是否匹配的结果
        System.out.println(b);
    }
}
