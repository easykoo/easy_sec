package com.easykoo.service;

import com.easykoo.mybatis.model.Subscribe;

public interface ISubscribeService {
    int deleteByPrimaryKey(String email);

    int insert(Subscribe record);

    int insertSelective(Subscribe record);

    Subscribe selectByPrimaryKey(String email);

    int updateByPrimaryKeySelective(Subscribe record);

    int updateByPrimaryKey(Subscribe record);
}