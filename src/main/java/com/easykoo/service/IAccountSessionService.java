package com.easykoo.service;

import com.easykoo.mybatis.model.AccountSession;

/**
 * Feb 22, 2014    Steven
 */
public interface IAccountSessionService {
    int deleteByPrimaryKey(Integer id);

    int insert(AccountSession record);

    int insertSelective(AccountSession record);

    AccountSession selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AccountSession record);

    int updateByPrimaryKey(AccountSession record);

    AccountSession getRecord(AccountSession record);

    int deleteByAccountId(Integer accountId);
}
