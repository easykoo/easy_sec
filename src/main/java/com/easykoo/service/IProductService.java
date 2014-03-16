package com.easykoo.service;

import com.easykoo.mybatis.model.Category;
import com.easykoo.mybatis.model.Product;

import java.util.List;

public interface IProductService {
    int deleteByPrimaryKey(Integer productId);

    int deleteByPrimaryKey(String categoryId);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer productId);

    Category selectByPrimaryKey(String categoryId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Product record);

    List<Product> findProductWithPage(Product record);

    List<Category> getAllCategory();

    List<Category> getTopLevelCategory();

    List<Category> getChildrenCategory(String categoryId);

    int insert(Category record) throws Exception;

    String generateCategoryId(String parentCategory);

    List<Product> getProductsByCategory(String categoryId);
}