package com.easykoo.mybatis.model;

import java.util.Date;

public class AccountSecurity extends Account{

    private String password;

    private Boolean tempFlag;

    private Integer failTime;

    private Date effectiveDate;

    private String verifyCode;

    private String token;

    private int rememberMe;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getRememberMe() {
        return rememberMe;
    }

    public void setRememberMe(int rememberMe) {
        this.rememberMe = rememberMe;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getTempFlag() {
        return tempFlag;
    }

    public void setTempFlag(Boolean tempFlag) {
        this.tempFlag = tempFlag;
    }

    public Integer getFailTime() {
        return failTime;
    }

    public void setFailTime(Integer failTime) {
        this.failTime = failTime;
    }

    public Date getEffectiveDate() {
        return effectiveDate;
    }

    public void setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }
}