package com.easykoo.service;

import com.easykoo.mybatis.dao.SubscribeMapper;
import com.easykoo.mybatis.model.Subscribe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by easykooc on 14-2-25.
 */
@Service("subscribeService")
public class SubscribeServiceImpl implements ISubscribeService {
    private SubscribeMapper subscribeMapper;

    public SubscribeMapper getSubscribeMapper() {
        return subscribeMapper;
    }
    @Autowired
    public void setSubscribeMapper(SubscribeMapper subscribeMapper) {
        this.subscribeMapper = subscribeMapper;
    }

    @Override
    public int deleteByPrimaryKey(String email) {
        return subscribeMapper.deleteByPrimaryKey(email);
    }

    @Override
    public int insert(Subscribe record) {
        return subscribeMapper.insert(record);
    }

    @Override
    public int insertSelective(Subscribe record) {
        return subscribeMapper.insertSelective(record);
    }

    @Override
    public Subscribe selectByPrimaryKey(String email) {
        return subscribeMapper.selectByPrimaryKey(email);
    }

    @Override
    public int updateByPrimaryKeySelective(Subscribe record) {
        return subscribeMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Subscribe record) {
        return subscribeMapper.updateByPrimaryKey(record);
    }
}
