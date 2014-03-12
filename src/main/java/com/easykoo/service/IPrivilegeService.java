package com.easykoo.service;

import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.Privilege;

import java.util.List;

public interface IPrivilegeService {
    int deleteByPrimaryKey(Integer privilegeId);

    int insert(Privilege record);

    int insertSelective(Privilege record);

    Privilege selectByPrimaryKey(Integer privilegeId);

    int updateByPrimaryKeySelective(Privilege record);

    int updateByPrimaryKey(Privilege record);

    boolean isAuthorized(String test, Account account);
}