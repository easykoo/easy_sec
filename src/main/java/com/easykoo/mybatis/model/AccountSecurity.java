package com.easykoo.mybatis.model;

import java.util.Date;

public class AccountSecurity extends Account{

    private String password;

    private Boolean tempFlag;

    private Integer failTime;

    private Date effectiveDate;

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