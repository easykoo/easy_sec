package com.easykoo.service;

import com.easykoo.mybatis.dao.SessionLogMapper;
import com.easykoo.mybatis.model.SessionLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Jesse on 14-3-24.
 */
@Service("sessionLogService")
public class SessionLogServiceImpl implements ISessionLogService {
    private SessionLogMapper sessionLogMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return sessionLogMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SessionLog record) {
        return sessionLogMapper.insert(record);
    }

    @Override
    public int insertSelective(SessionLog record) {
        return sessionLogMapper.insertSelective(record);
    }

    @Override
    public SessionLog selectByPrimaryKey(Integer id) {
        return sessionLogMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SessionLog record) {
        return sessionLogMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SessionLog record) {
        return sessionLogMapper.updateByPrimaryKey(record);
    }


    public List<SessionLog> getAllSessionLog(){
        return sessionLogMapper.getAllSessionLog();
    }

    public List<SessionLog> getRecentTenSessionLog(){
        return sessionLogMapper.getRecentTenSessionLog();
    }

    public List<SessionLog> findSessionLogWithPage(SessionLog record){
        return sessionLogMapper.findSessionLogWithPage(record);
    }

    @Override
    public Long getTotalCount() {
        return sessionLogMapper.getTotalCount();
    }

    @Override
    public Long getMonthCount() {
        return sessionLogMapper.getMonthCount();
    }

    @Override
    public Long getDayCount() {
        return sessionLogMapper.getDayCount();
    }

    public SessionLogMapper getSessionLogMapper() {
        return sessionLogMapper;
    }

    @Autowired
    public void setSessionLogMapper(SessionLogMapper sessionLogMapper) {
        this.sessionLogMapper = sessionLogMapper;
    }
}
