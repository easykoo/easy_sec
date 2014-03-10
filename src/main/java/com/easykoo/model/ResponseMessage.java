package com.easykoo.model;

import com.alibaba.druid.support.json.JSONUtils;

import java.io.Serializable;

/**
 * Created by Jesse on 14-3-9.
 */
public class ResponseMessage implements Serializable {
    private boolean isSuccess;
    private String message;

    public ResponseMessage(boolean isSuccess, String message) {
        this.isSuccess = isSuccess;
        this.message = message;
    }

    public boolean isSuccess() {
        return isSuccess;
    }

    public void setSuccess(boolean isSuccess) {
        this.isSuccess = isSuccess;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return JSONUtils.toJSONString(this);
    }
}
