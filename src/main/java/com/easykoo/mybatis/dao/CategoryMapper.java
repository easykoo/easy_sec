package com.easykoo.mybatis.dao;

import com.easykoo.mybatis.model.Category;

import java.util.List;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer categoryId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer categoryId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    List<Category> getAllCategory();

    List<Category> getTopLevelCategory();

    List<Category> getChildrenCategory(String parentCategory);
}