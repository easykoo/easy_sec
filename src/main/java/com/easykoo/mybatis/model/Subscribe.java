package com.easykoo.mybatis.model;

import com.easykoo.model.Page;

import java.util.Date;

public class Subscribe extends Page {
    private String email;

    private String name;

    private Date createDate;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}