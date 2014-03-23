package com.easykoo.model;

import java.io.Serializable;

/**
 * Created by Jesse on 14-3-23.
 */
public class Settings implements Serializable {
    private String keywords;
    private String description;

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
