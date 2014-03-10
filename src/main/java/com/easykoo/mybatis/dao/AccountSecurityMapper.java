package com.easykoo.mybatis.dao;

import com.easykoo.mybatis.model.AccountSecurity;

import java.util.Map;

public interface AccountSecurityMapper {
    int deleteByPrimaryKey(Integer accountId);

    int insert(AccountSecurity record);

    int insertSelective(AccountSecurity record);

    AccountSecurity selectByPrimaryKey(Integer accountId);

    int updateByPrimaryKeySelective(AccountSecurity record);

    int updateByPrimaryKey(AccountSecurity record);

    AccountSecurity login(AccountSecurity record);

    boolean checkPassword(Map params);
}