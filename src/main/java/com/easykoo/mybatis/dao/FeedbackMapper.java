package com.easykoo.mybatis.dao;

import com.easykoo.mybatis.model.Feedback;

import java.util.List;

public interface FeedbackMapper {
    int deleteByPrimaryKey(Integer feedbackId);

    int insert(Feedback record);

    int insertSelective(Feedback record);

    Feedback selectByPrimaryKey(Integer feedbackId);

    int updateByPrimaryKeySelective(Feedback record);

    int updateByPrimaryKey(Feedback record);

    List<Feedback> getTop5Feedback();

    int getUnreadFeedbackCount();

    List<Feedback> findFeedbackWithPage(Feedback record);
}