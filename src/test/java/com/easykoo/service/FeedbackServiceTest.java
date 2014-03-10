package com.easykoo.service;

import com.easykoo.mybatis.model.Feedback;
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
public class FeedbackServiceTest {
    private Log logger = LogFactory.getLog(getClass());
    private IFeedbackService feedbackService;

    public IFeedbackService getFeedbackService() {
        return feedbackService;
    }
    @Autowired
    public void setFeedbackService(IFeedbackService feedbackService) {
        this.feedbackService = feedbackService;
    }

    @Test
    public void test1() {
        List<Feedback> feedbackList = feedbackService.getTop5Feedback();
        logger.debug(feedbackList.size());
    }

    @Test
    public void testCreateAccount() {
//        Account account = new Account();
//        account.setUsername("test3");
//        account.setNickname("Test3");
//        accountService.insert(account);
//        logger.debug(account.getAccountId());
    }

}
