package com.easykoo.service;

import com.easykoo.mybatis.dao.AccountSessionMapper;
import com.easykoo.mybatis.model.AccountSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Feb 22, 2014    Steven
 */
@Service("accountSessionService")
public class AccountSessionServiceImpl implements IAccountSessionService {
    private AccountSessionMapper accountSessionMapper;

    public AccountSessionMapper getAccountSessionMapper() {
        return accountSessionMapper;
    }
    @Autowired
    public void setAccountSessionMapper(AccountSessionMapper accountSessionMapper) {
        this.accountSessionMapper = accountSessionMapper;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return accountSessionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(AccountSession record) {
        return accountSessionMapper.insert(record);
    }

    @Override
    public int insertSelective(AccountSession record) {
        return accountSessionMapper.insertSelective(record);
    }

    @Override
    public AccountSession selectByPrimaryKey(Integer id) {
        return accountSessionMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(AccountSession record) {
        return accountSessionMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(AccountSession record) {
        return accountSessionMapper.updateByPrimaryKey(record);
    }

    @Override
    public AccountSession getRecord(AccountSession record) {
        return accountSessionMapper.getRecord(record);
    }

    @Override
    public int deleteByAccountId(Integer accountId) {
        return accountSessionMapper.deleteByAccountId(accountId);
    }
}
