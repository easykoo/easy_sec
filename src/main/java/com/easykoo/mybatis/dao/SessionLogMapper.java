package com.easykoo.mybatis.dao;

import com.easykoo.mybatis.model.SessionLog;

import java.util.List;

public interface SessionLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SessionLog record);

    int insertSelective(SessionLog record);

    SessionLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SessionLog record);

    int updateByPrimaryKey(SessionLog record);

    List<SessionLog> getAllSessionLog();

    List<SessionLog> getRecentTenSessionLog();

    List<SessionLog> findSessionLogWithPage(SessionLog record);

    Long getTotalCount();

    Long getMonthCount();

    Long getDayCount();
}