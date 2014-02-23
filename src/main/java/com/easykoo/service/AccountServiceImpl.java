package com.easykoo.service;

import com.easykoo.mybatis.dao.AccountMapper;
import com.easykoo.mybatis.dao.AccountSecurityMapper;
import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.AccountSecurity;
import com.easykoo.mybatis.model.Page;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Feb 22, 2014    Steven
 */
@Service("accountService")
public class AccountServiceImpl implements IAccountService {
    private AccountMapper accountMapper;
    private AccountSecurityMapper accountSecurityMapper;

    public AccountMapper getAccountMapper() {
        return accountMapper;
    }

    @Autowired
    public void setAccountMapper(AccountMapper accountMapper) {
        this.accountMapper = accountMapper;
    }

    public AccountSecurityMapper getAccountSecurityMapper() {
        return accountSecurityMapper;
    }

    @Autowired
    public void setAccountSecurityMapper(AccountSecurityMapper accountSecurityMapper) {
        this.accountSecurityMapper = accountSecurityMapper;
    }

    @Override
    public void deleteByPrimaryKey(Integer accountId) {
        accountSecurityMapper.deleteByPrimaryKey(accountId);
        accountMapper.deleteByPrimaryKey(accountId);
    }

    @Override
    public void insert(AccountSecurity record) {
        accountSecurityMapper.insert(record);
    }

    @Override
    public void insert(Account record) {
        accountMapper.insert(record);
    }

    @Override
    public void insertFullAccount(AccountSecurity record) {
        accountMapper.insert(record);
        accountSecurityMapper.insert(record);
    }

    @Override
    public void insertSelective(Account record) {
        accountMapper.insertSelective(record);
    }

    @Override
    public void insertSelective(AccountSecurity record) {
        accountSecurityMapper.insertSelective(record);
    }

    @Override
    public void insertFullSelective(AccountSecurity record) {
        accountMapper.insertSelective(record);
        accountSecurityMapper.insertSelective(record);
    }

    @Override
    public Account selectByPrimaryKey(Integer accountId) {
        return accountMapper.selectByPrimaryKey(accountId);
    }

    public AccountSecurity selectFullByPrimaryKey(Integer accountId) {
        Account account = accountMapper.selectByPrimaryKey(accountId);
        AccountSecurity accountSecurity = accountSecurityMapper.selectByPrimaryKey(accountId);
        if (accountSecurity == null) {
            accountSecurity = new AccountSecurity();
        }
        BeanUtils.copyProperties(account, accountSecurity);
        return accountSecurity;
    }

    @Override
    public void updateByPrimaryKeySelective(Account record) {
        accountMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateByPrimaryKeySelective(AccountSecurity record) {
        accountSecurityMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateFullByPrimaryKeySelective(AccountSecurity record) {
        accountMapper.updateByPrimaryKeySelective(record);
        accountSecurityMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void updateByPrimaryKey(AccountSecurity record) {
        accountSecurityMapper.updateByPrimaryKey(record);
    }

    @Override
    public void updateByPrimaryKey(Account record) {
        accountMapper.updateByPrimaryKey(record);
    }

    @Override
    public void updateFullByPrimaryKey(AccountSecurity record) {
        accountMapper.updateByPrimaryKey(record);
        accountSecurityMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Account> getAllAccount() {
        return accountMapper.getAllAccount();
    }

    @Override
    public AccountSecurity login(AccountSecurity record) {
        return accountSecurityMapper.login(record);
    }

    @Override
    public List<Account> findAccountWithPage(Account record) {
        return accountMapper.findAccountWithPage(record);
    }
}
