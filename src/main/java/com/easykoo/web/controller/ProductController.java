package com.easykoo.web.controller;

import com.easykoo.model.DataTablesResponse;
import com.easykoo.model.ResponseMessage;
import com.easykoo.mybatis.model.Category;
import com.easykoo.mybatis.model.Product;
import com.easykoo.service.IProductService;
import com.easykoo.util.ConfigUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Feb 22, 2014 Steven
 */

@Controller
public class ProductController implements ServletContextAware {
    protected final Log logger = LogFactory.getLog(getClass());
    private IProductService productService;
    private MessageSource messageSource;
    private ServletContext servletContext;


    @RequestMapping(value = "/product/allProduct.do", method = RequestMethod.GET)
    public String allProduct() {
        return "allProduct";
    }

    @RequestMapping(value = "/product/publishProduct.do", method = RequestMethod.GET)
    public String publishProduct() {
        return "publishProduct";
    }

    @RequestMapping(value = "/product/allCategory.do", method = RequestMethod.GET)
    public String allCategory() {
        return "allCategory";
    }

    @RequestMapping(value = "/product/changeProductView.do", method = RequestMethod.GET)
    public String changeProductView() {
        return "changeProduct";
    }

    @RequestMapping(value = "/product/publishProduct.do", method = RequestMethod.POST)
    public String handleFormUpload(@RequestParam("categoryId") String categoryId, @RequestParam("name") String name, @RequestParam("description") String description,
                                   @RequestParam("image") CommonsMultipartFile mFile, Locale locale, ModelMap model) {
        File file = null;
        if (!mFile.isEmpty()) {
            try {
                Product product = new Product();
                product.setCategoryId(categoryId);
                product.setName(name);
                product.setDescription(description);

                String productDirectory = ConfigUtils.getInstance().getProductDirectory();
                String path = this.servletContext.getRealPath(productDirectory);
                File directory = new File(path);
                if (!directory.exists()) {
                    directory.mkdir();
                }
                file = new File(directory.getPath() + "/" + new Date().getTime() + ".jpg");
                mFile.transferTo(file);
                product.setImg(productDirectory + "/" + file.getName());
                productService.insert(product);
                model.addAttribute("message", new ResponseMessage(true, messageSource.getMessage("message.publish.success", null, locale)));
            } catch (DuplicateKeyException e) {
                if (file.exists()) {
                    file.delete();
                }
                logger.error(e);
                model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.publish.failed", null, locale)));
            } catch (Exception e) {
                logger.error(e);
                model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.publish.failed", null, locale)));
            }
        } else {
            model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.file.not.exists", null, locale)));
        }
        return "publishProduct";
    }

    @RequestMapping(value = "/product/changeProduct.do", method = RequestMethod.POST)
    public String changeProfile(@ModelAttribute("product") Product product, Locale locale, ModelMap model) {
        productService.updateByPrimaryKeySelective(product);
        logger.debug("Product updated successfully!");
        model.addAttribute("message", new ResponseMessage(true, messageSource.getMessage("message.change.success", null, locale)));
        return "changeProduct";
    }

    @ResponseBody
    @RequestMapping(value = "/product/ajax/allProduct.do", produces = "application/json")
    public DataTablesResponse allProduct(@RequestParam int iDisplayStart, @RequestParam int iDisplayLength, @RequestParam int iSortCol_0, @RequestParam String sSortDir_0, HttpServletRequest request) {
        DataTablesResponse<Product> dt = new DataTablesResponse();

        Product product = new Product();
        product.setPageActived(true);
        product.setPageSize(iDisplayLength);
        product.setDisplayStart(iDisplayStart);
        String sortColumn = request.getParameter("mDataProp_" + iSortCol_0);
        product.addSortProperties(sortColumn, sSortDir_0);
        List<Product> productList = productService.findProductWithPage(product);

        dt.setData(productList);
        dt.setTotalDisplayRecords(product.getTotalRecord());
        dt.setTotalRecords(product.getTotalRecord());
        return dt;
    }

    @ResponseBody
    @RequestMapping(value = "/product/ajax/deleteProduct.do", produces = "application/json")
    public ResponseMessage deleteProduct(@RequestParam(value = "productId") int productId, Locale locale) {
        Product dbProduct = productService.selectByPrimaryKey(productId);
        if (dbProduct != null) {
            productService.deleteByPrimaryKey(productId);
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false, messageSource.getMessage("message.error.can.not.find.record", null, locale));
    }


    @ResponseBody
    @RequestMapping(value = "/product/ajax/getTopLevelCategory.do", produces = "application/json")
    public ResponseMessage getTopLevelCategory(HttpServletRequest request) {
        List<Category> categoryList = productService.getTopLevelCategory();
        ResponseMessage message = new ResponseMessage(true);
        message.setObj(categoryList);
        return message;
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public MessageSource getMessageSource() {
        return messageSource;
    }

    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    public IProductService getProductService() {
        return productService;
    }

    @Autowired
    public void setProductService(IProductService productService) {
        this.productService = productService;
    }
}
