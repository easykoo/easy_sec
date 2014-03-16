package com.easykoo.mybatis.dao;

import com.easykoo.mybatis.model.Category;

import java.util.List;
import java.util.Map;

public interface CategoryMapper {
    int deleteByPrimaryKey(String categoryId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(String categoryId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    List<Category> getAllCategory();

    List<Category> getTopLevelCategory();

    List<Category> getChildrenCategory(String parentCategory);

    String generateCategoryId(Map<String, String> params);
}