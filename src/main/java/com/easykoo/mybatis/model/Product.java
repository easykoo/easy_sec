package com.easykoo.mybatis.model;

import com.easykoo.model.Page;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.Date;

public class Product extends Page {

    private Category category;

    @JsonProperty("product_id")
    private Integer productId;

    private String name;

    private String description;

    @JsonProperty("cn_name")
    private String cnName;

    private String cnDescription;

    @JsonProperty("category_id")
    private String categoryId;

    private String imgPath;

    private String preImgPath;

    private Integer priority;

    private String createUser;

    @JsonProperty("create_date")
    private Date createDate;

    private String updateUser;

    private Date updateDate;

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public String getCnName() {
        return cnName;
    }

    public void setCnName(String cnName) {
        this.cnName = cnName;
    }

    public String getCnDescription() {
        return cnDescription;
    }

    public void setCnDescription(String cnDescription) {
        this.cnDescription = cnDescription;
    }

    public String getPreImgPath() {
        return preImgPath;
    }

    public void setPreImgPath(String preImgPath) {
        this.preImgPath = preImgPath;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
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