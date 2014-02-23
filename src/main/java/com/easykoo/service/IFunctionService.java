package com.easykoo.service;

import com.easykoo.mybatis.model.Function;

public interface IFunctionService {
    int deleteByPrimaryKey(Integer functionId);

    int insert(Function record);

    int insertSelective(Function record);

    Function selectByPrimaryKey(Integer functionId);

    int updateByPrimaryKeySelective(Function record);

    int updateByPrimaryKey(Function record);

    Function selectByUri(String uri);
}