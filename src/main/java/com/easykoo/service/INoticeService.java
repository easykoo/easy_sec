package com.easykoo.service;

import com.easykoo.mybatis.model.Notice;

import java.util.List;

public interface INoticeService {
    int deleteByPrimaryKey(Integer noticeId);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Integer noticeId);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);

    List<Notice> getTopPriorityNotices();

    List<Notice> findNoticeWithPage(Notice record);
}