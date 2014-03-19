package com.easykoo.web.controller;

import com.easykoo.model.DataTablesResponse;
import com.easykoo.model.ResponseMessage;
import com.easykoo.mybatis.model.Account;
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

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
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


    @RequestMapping(value = "/product.do")
    public String product(HttpServletRequest request, ModelMap model) {
        Product product = new Product();
        product.setPageActived(true);
        product.setCategoryId(request.getParameter("categoryId"));
        product.setPageNo(request.getParameter("pageNo"));
        product.setPageSize(request.getParameter("pageSize"));
        product.addSortProperties("priority", "asc");
        product.addSortProperties("create_date", "desc");
        List<Category> categoryList = productService.getTopLevelCategory();
        List<Product> productList = productService.findProductWithPage(product);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("productList", productList);
        model.addAttribute("page", product);
        return "product";
    }

    @RequestMapping(value = "/product/allProduct.do", method = RequestMethod.GET)
    public String allProduct() {
        return "allProduct";
    }

    @RequestMapping(value = "/product/publishProduct.do", method = RequestMethod.GET)
    public String publishProduct() {
        return "publishProduct";
    }

    @RequestMapping(value = "/product/createCategory.do", method = RequestMethod.GET)
    public String createCategoryView() {
        return "createCategory";
    }

    @RequestMapping(value = "/product/editCategory.do", method = RequestMethod.GET)
    public String editCategoryView() {
        return "editCategory";
    }

    @RequestMapping(value = "/product/publishProduct.do", method = RequestMethod.POST)
    public String publishProduct(@RequestParam("categoryId") String categoryId, @RequestParam("priority") Integer priority, @RequestParam("name") String name, @RequestParam("description") String description,
                                 @RequestParam("cnName") String cnName, @RequestParam("cnDescription") String cnDescription,
                                 @RequestParam("image") CommonsMultipartFile mFile, HttpServletRequest request, Locale locale, ModelMap model) {

        String productDirectory = ConfigUtils.getInstance().getProductDirectory();
        String productViewDirectory = ConfigUtils.getInstance().getProductViewDirectory();
        String productPreviewDirectory = ConfigUtils.getInstance().getProductPreviewDirectory();

        final int viewPicWidth = ConfigUtils.getInstance().getViewPictureWidth();
        final int previewPicWidth = ConfigUtils.getInstance().getPreviewPictureWidth();

        File file = null;
        File viewFile = null;
        File previewFile = null;
        if (!mFile.isEmpty()) {
            try {
                Product product = new Product();
                product.setCategoryId(categoryId);
                product.setPriority(priority);
                product.setName(name);
                product.setDescription(description);
                product.setCnName(cnName);
                product.setCnDescription(cnDescription);
                Account currUser = (Account) request.getSession().getAttribute("currentAccountSecurity");
                product.setCreateUser(currUser.getUsername());
                product.setUpdateUser(currUser.getUsername());
                String path = servletContext.getRealPath(productDirectory);
                File directory = new File(path);
                if (!directory.exists()) {
                    directory.mkdir();
                }

                file = new File(directory.getPath() + "/" + new Date().getTime() + ".jpg");
                mFile.transferTo(file);

                viewFile = createTransferImage(file, viewPicWidth, productViewDirectory);
                previewFile = createTransferImage(file, previewPicWidth, productPreviewDirectory);

                product.setImgPath(productDirectory + file.getName());
                product.setViewImgPath(productViewDirectory + file.getName());
                product.setPreImgPath(productPreviewDirectory + file.getName());
                productService.insert(product);
                model.addAttribute("message", new ResponseMessage(true, messageSource.getMessage("message.publish.success", null, locale)));
            } catch (DuplicateKeyException e) {
                if (file.exists()) {
                    file.delete();
                }
                if (viewFile.exists()) {
                    viewFile.delete();
                }
                if (previewFile.exists()) {
                    previewFile.delete();
                }
                logger.error(e);
                model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.publish.failed", null, locale)));
            } catch (Exception e) {
                if (file != null && file.exists()) {
                    file.delete();
                }
                if (viewFile != null && viewFile.exists()) {
                    viewFile.delete();
                }
                if (previewFile != null && previewFile.exists()) {
                    previewFile.delete();
                }
                logger.error(e);
                model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.publish.failed", null, locale)));
            }
        } else {
            model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.file.not.exists", null, locale)));
        }
        return "publishProduct";
    }

    private File createTransferImage(File srcImg, Integer destWidth, String destPath) throws IOException {
        File destDirectory = new File(servletContext.getRealPath(destPath));
        if (!destDirectory.exists()) {
            destDirectory.mkdir();
        }
        File destImg = new File(destDirectory.getPath() + "/" + srcImg.getName());

        if (!destImg.exists()) {
            destImg.createNewFile();
        }
        AffineTransform transform = new AffineTransform();
        BufferedImage bis = ImageIO.read(srcImg);

        int width = bis.getWidth();
        int height = bis.getHeight();
        int destHeight = (destWidth * height) / width;
        if (destHeight > destWidth) {
            destHeight = destWidth;
            destWidth = (destHeight * width) / height;
        }
        double sx = (double) destWidth / width;
        double sy = (double) destHeight / height;
        transform.setToScale(sx, sy);
        AffineTransformOp ato = new AffineTransformOp(transform, null);
        BufferedImage bid = new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_3BYTE_BGR);
        ato.filter(bis, bid);
        ImageIO.write(bid, "jpg", destImg);
        return destImg;
    }

    @ResponseBody
    @RequestMapping(value = "/product/ajax/changeProduct.do", method = RequestMethod.POST)
    public ResponseMessage changeProduct(@ModelAttribute("product") Product product, Locale locale) {
        productService.updateByPrimaryKeySelective(product);
        logger.debug("Product updated successfully!");
        return new ResponseMessage(true, messageSource.getMessage("message.change.success", null, locale));
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
            String path = servletContext.getRealPath(dbProduct.getImgPath());
            File file = new File(path);
            if (file.exists()) {
                file.delete();
            }
            String previewPath = servletContext.getRealPath(dbProduct.getImgPath().replace(ConfigUtils.getInstance().getProductDirectory(), ConfigUtils.getInstance().getProductPreviewDirectory()));
            File previewFile = new File(previewPath);
            if (previewFile.exists()) {
                previewFile.delete();
            }
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false, messageSource.getMessage("message.error.can.not.find.record", null, locale));
    }

    @ResponseBody
    @RequestMapping(value = "/product/ajax/deleteProducts.do", produces = "application/json")
    public ResponseMessage deleteProducts(Integer[] products, Locale locale) {
        if (products.length > 1) {
            for (int i = 0; i < products.length; i++) {
                Product dbProduct = productService.selectByPrimaryKey(products[i]);
                productService.deleteByPrimaryKey(products[i]);
                if (dbProduct != null) {
                    String path = servletContext.getRealPath(dbProduct.getImgPath());
                    File file = new File(path);
                    if (file.exists()) {
                        file.delete();
                    }
                    String previewPath = servletContext.getRealPath(dbProduct.getImgPath().replace(ConfigUtils.getInstance().getProductDirectory(), ConfigUtils.getInstance().getProductPreviewDirectory()));
                    File previewFile = new File(previewPath);
                    if (previewFile.exists()) {
                        previewFile.delete();
                    }
                }
            }
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

    @RequestMapping(value = "/product/createCategory.do", method = RequestMethod.POST)
    public String createCategory(@RequestParam("parentCategoryId") String parentCategoryId, @RequestParam("description") String description,
                                 @RequestParam("cnDescription") String cnDescription, Locale locale, ModelMap model) {
        try {
            Category category = new Category();
            category.setParentCategory(parentCategoryId);
            category.setDescription(description);
            category.setCnDescription(cnDescription);
            productService.insert(category);
            model.addAttribute("message", new ResponseMessage(true, messageSource.getMessage("message.create.success", null, locale)));
        } catch (DuplicateKeyException e) {
            logger.error(e);
            model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.publish.failed", null, locale)));
        } catch (Exception e) {
            logger.error(e);
            model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.publish.failed", null, locale)));
        }
        return "createCategory";
    }

    @RequestMapping(value = "/product/editCategory.do", method = RequestMethod.POST)
    public String editCategory(@RequestParam("categoryId") String categoryId, @RequestParam("description") String description,
                               @RequestParam("cnDescription") String cnDescription, Locale locale, ModelMap model) {
        try {
            Category category = new Category();
            category.setCategoryId(categoryId);
            category.setDescription(description);
            category.setCnDescription(cnDescription);
            productService.updateByPrimaryKeySelective(category);
            model.addAttribute("message", new ResponseMessage(true, messageSource.getMessage("message.change.success", null, locale)));
        } catch (Exception e) {
            logger.error(e);
            model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.change.failed", null, locale)));
        }
        return "editCategory";
    }

    @ResponseBody
    @RequestMapping(value = "/product/ajax/deleteCategory.do", produces = "application/json", method = RequestMethod.POST)
    public ResponseMessage editCategory(@RequestParam("categoryId") String categoryId, Locale locale, ModelMap model) {
        try {
            List<Category> children = productService.getChildrenCategory(categoryId);
            if (children != null && children.size() > 0) {
                throw new Exception();
            }
            List<Product> productList = productService.getProductsByCategory(categoryId);
            if (productList != null && productList.size() > 0) {
                throw new Exception();
            }
            productService.deleteByPrimaryKey(categoryId);
            return new ResponseMessage(true, messageSource.getMessage("message.delete.success", null, locale));
        } catch (Exception e) {
            logger.error(e);
            return new ResponseMessage(false, messageSource.getMessage("message.error.delete.failed", null, locale));
        }
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
