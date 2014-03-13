package com.easykoo.service;

import com.easykoo.mybatis.model.Category;
import com.easykoo.mybatis.model.Product;

import java.util.List;

public interface IProductService {
    int deleteByPrimaryKey(Integer productId);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer productId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    List<Product> findProductWithPage(Product record);

    List<Category> getAllCategory();

    List<Category> getTopLevelCategory();

    List<Category> getChildrenCategory(String categoryId);
}