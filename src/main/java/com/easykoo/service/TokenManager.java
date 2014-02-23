package com.easykoo.service;

import com.easykoo.mybatis.model.AccountSecurity;
import com.easykoo.mybatis.model.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Feb 22, 2014    Steven
 */
@Service("tokenManager")
public class TokenManager {

    public void login(AccountSecurity accountSecurity) {

    }

    public Token getToken() {
        return null;
    }
}
