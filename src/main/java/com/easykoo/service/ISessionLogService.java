package com.easykoo.service;

import com.easykoo.mybatis.model.SessionLog;

import java.util.List;

/**
 * Created by Jesse on 14-3-24.
 */
public interface ISessionLogService {
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
