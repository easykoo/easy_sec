package com.easykoo.service;

import com.easykoo.mybatis.dao.FeedbackMapper;
import com.easykoo.mybatis.model.Feedback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by easykooc on 14-2-25.
 */
@Service("feedbackService")
public class FeedbackServiceImpl implements IFeedbackService {
    private FeedbackMapper feedbackMapper;

    public FeedbackMapper getFeedbackMapper() {
        return feedbackMapper;
    }

    @Autowired
    public void setFeedbackMapper(FeedbackMapper feedbackMapper) {
        this.feedbackMapper = feedbackMapper;
    }

    @Override
    public int deleteByPrimaryKey(Integer feedbackId) {
        return feedbackMapper.deleteByPrimaryKey(feedbackId);
    }

    @Override
    public int insert(Feedback record) {
        return feedbackMapper.insert(record);
    }

    @Override
    public int insertSelective(Feedback record) {
        return feedbackMapper.insertSelective(record);
    }

    @Override
    public Feedback selectByPrimaryKey(Integer feedbackId) {
        return feedbackMapper.selectByPrimaryKey(feedbackId);
    }

    @Override
    public int updateByPrimaryKeySelective(Feedback record) {
        return feedbackMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Feedback record) {
        return feedbackMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Feedback> getTop5Feedback() {
        return feedbackMapper.getTop5Feedback();
    }

    @Override
    public int getUnreadFeedbackCount() {
        return feedbackMapper.getUnreadFeedbackCount();
    }

    @Override
    public List<Feedback> findFeedbackWithPage(Feedback record) {
        return feedbackMapper.findFeedbackWithPage(record);
    }
}
