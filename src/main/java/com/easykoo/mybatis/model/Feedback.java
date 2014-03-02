package com.easykoo.mybatis.model;

import org.codehaus.jackson.annotate.JsonProperty;

import java.util.Date;

public class Feedback extends Page {
    @JsonProperty(value = "feedback_id")
    private Integer feedbackId;

    private String email;

    private String name;

    private String content;

    private Boolean viewed;

    @JsonProperty(value = "create_date")
    private Date createDate;

    public Integer getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(Integer feedbackId) {
        this.feedbackId = feedbackId;
    }

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Boolean getViewed() {
        return viewed;
    }

    public void setViewed(Boolean viewed) {
        this.viewed = viewed;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}