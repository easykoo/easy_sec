package com.easykoo.service;

import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.AccountSecurity;
import com.easykoo.mybatis.model.Page;

import java.util.List;

/**
 * Feb 22, 2014    Steven
 */
public interface IAccountService {

    public void deleteByPrimaryKey(Integer accountId);

    public void insert(Account record);

    public void insert(AccountSecurity record);

    public void insertFullAccount(AccountSecurity record);

    public void insertSelective(Account record);

    public void insertSelective(AccountSecurity record);

    public void insertFullSelective(AccountSecurity record);

    public Account selectByPrimaryKey(Integer accountId);

    public AccountSecurity selectFullByPrimaryKey(Integer accountId);

    public void updateByPrimaryKeySelective(Account record);

    public void updateByPrimaryKeySelective(AccountSecurity record);

    public void updateFullByPrimaryKeySelective(AccountSecurity record);

    public void updateByPrimaryKey(Account record);

    public void updateByPrimaryKey(AccountSecurity record);

    public void updateFullByPrimaryKey(AccountSecurity record);

    public List<Account> getAllAccount();

    public AccountSecurity login(AccountSecurity record);

    List<Account> findAccountWithPage(Account record);

    boolean checkUsername(String username);

    boolean checkEmail(String email);
}
