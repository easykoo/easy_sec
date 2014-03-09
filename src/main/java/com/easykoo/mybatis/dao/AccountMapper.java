package com.easykoo.mybatis.dao;

import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.Page;

import java.util.List;

public interface AccountMapper {
    int deleteByPrimaryKey(Integer accountId);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(Integer accountId);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);

    List<Account> getAllAccount();

    List<Account> findAccountWithPage(Account record);

    boolean checkUsername(String username);

    boolean checkEmail(String email);
}