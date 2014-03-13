package com.easykoo.service;

import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.Category;
import com.easykoo.mybatis.model.Product;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Feb 22, 2014    Steven
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml", "classpath:spring-mybatis.xml"})
public class ProductServiceTest {
    private Log logger = LogFactory.getLog(getClass());
    private IProductService productService;

    public IProductService getProductService() {
        return productService;
    }

    @Autowired
    public void setProductService(IProductService productService) {
        this.productService = productService;
    }

    @Test
    public void test1() {
        List<Category> categoryList = productService.getTopLevelCategory();
        logger.debug(categoryList.size());
//        product.setRoleId(5);
//        product.setUrl("create.do");
//        boolean b = productService.hasProduct(product);
//        logger.debug(b);
    }
}
