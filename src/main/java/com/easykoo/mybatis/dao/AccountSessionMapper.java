package com.easykoo.mybatis.dao;

import com.easykoo.mybatis.model.AccountSession;

public interface AccountSessionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AccountSession record);

    int insertSelective(AccountSession record);

    AccountSession selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AccountSession record);

    int updateByPrimaryKey(AccountSession record);

    AccountSession getRecord(AccountSession record);

    int deleteByAccountId(Integer accountId);
}