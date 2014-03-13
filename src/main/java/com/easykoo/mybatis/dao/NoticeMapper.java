package com.easykoo.mybatis.dao;

import com.easykoo.mybatis.model.Notice;

import java.util.List;

public interface NoticeMapper {
    int deleteByPrimaryKey(Integer noticeId);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Integer noticeId);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);

    List<Notice> findNoticeWithPage(Notice record);

    List<Notice> getTopPriorityNotices();
}