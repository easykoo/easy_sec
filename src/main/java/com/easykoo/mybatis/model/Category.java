package com.easykoo.mybatis.model;

import com.easykoo.model.Page;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

public class Category extends Page {
    @JsonProperty("category_id")
    private String categoryId;

    private String description;

    private String cnDescription;

    private String parentCategory;

    private List<Category> children;

    private Integer priority;

    private String createUser;

    private Date createDate;

    private String updateUser;

    private Date updateDate;

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public String getCnDescription() {
        return cnDescription;
    }

    public void setCnDescription(String cnDescription) {
        this.cnDescription = cnDescription;
    }

    public List<Category> getChildren() {
        Collections.sort(children, new Comparator<Category>() {
            @Override
            public int compare(Category o1, Category o2) {
                return o1.getPriority() - o2.getPriority();
            }
        });
        return children;
    }

    public void setChildren(List<Category> children) {
        this.children = children;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(String parentCategory) {
        this.parentCategory = parentCategory;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}