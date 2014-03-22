package com.easykoo.web.controller;

import com.easykoo.model.DataTablesResponse;
import com.easykoo.model.ResponseMessage;
import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.News;
import com.easykoo.service.INewsService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Locale;

/**
 * Feb 22, 2014 Steven
 */

@Controller
public class NewsController {
    protected final Log logger = LogFactory.getLog(getClass());
    private INewsService newsService;
    private MessageSource messageSource;


    @RequestMapping(value = "/news.do", method = RequestMethod.GET)
    public String news(HttpServletRequest request, Locale locale, ModelMap model) {
        News news = new News();
        news.setLang("en".equals(locale.getLanguage()) ? "en" : "zh_CN");
        news.setPageActived(true);
        news.setPageNo(request.getParameter("pageNo"));
        news.setPageSize(20);
        news.addSortProperties("priority", "asc");
        news.addSortProperties("create_date", "desc");
        List<News> newsList = newsService.findNewsWithPage(news);
        model.addAttribute("newsList", newsList);
        model.addAttribute("page", news);
        return "news";
    }

    @RequestMapping(value = "/news/allNews.do", method = RequestMethod.GET)
    public String allNews() {
        return "allNews";
    }

    @RequestMapping(value = "/news/showNews.do", method = RequestMethod.GET)
    public String showNews(@RequestParam("id") int id, ModelMap model) {
        News news = newsService.selectByPrimaryKey(id);
        model.addAttribute("news", news);
        return "showNews";
    }

    @RequestMapping(value = "/news/publishNews.do", method = RequestMethod.GET)
    public String publishNews() {
        return "publishNews";
    }

    @RequestMapping(value = "/news/changeNews.do", method = RequestMethod.GET)
    public String changeNews() {
        return "changeNews";
    }

    @RequestMapping(value = "/news/publishNews.do", method = RequestMethod.POST)
    public String publishNews(@ModelAttribute("news") News news, HttpServletRequest request, Locale locale, ModelMap model) {
        try {
            Account currUser = (Account) request.getSession().getAttribute("currentAccountSecurity");
            news.setCreateUser(currUser.getUsername());
            news.setUpdateUser(currUser.getUsername());
            newsService.insert(news);
            logger.debug("News " + news.getNewsId() + " publish successfully!");
        } catch (DuplicateKeyException e) {
            logger.error("Duplicate key!", e);
            model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.duplicate.key", null, locale)));
            return "publishNews";
        }
        return "publishNews";
    }

    @RequestMapping(value = "/news/changeNews.do", method = RequestMethod.POST)
    public String changeNews(@ModelAttribute("news") News news, Locale locale, ModelMap model) {
        newsService.updateByPrimaryKeySelective(news);
        logger.debug("News updated successfully!");
        model.addAttribute("message", new ResponseMessage(true, messageSource.getMessage("message.change.success", null, locale)));
        return "changeNews";
    }

    @ResponseBody
    @RequestMapping(value = "/news/ajax/allNews.do", produces = "application/json")
    public DataTablesResponse allNews(@RequestParam int iDisplayStart, @RequestParam int iDisplayLength, @RequestParam int iSortCol_0, @RequestParam String sSortDir_0, HttpServletRequest request) {
        DataTablesResponse<News> dt = new DataTablesResponse();

        News news = new News();
        news.setPageActived(true);
        news.setPageSize(iDisplayLength);
        news.setDisplayStart(iDisplayStart);
        String sortColumn = request.getParameter("mDataProp_" + iSortCol_0);
        news.addSortProperties(sortColumn, sSortDir_0);
        List<News> newsList = newsService.findNewsWithPage(news);

        dt.setData(newsList);
        dt.setTotalDisplayRecords(news.getTotalRecord());
        dt.setTotalRecords(news.getTotalRecord());
        return dt;
    }

    @ResponseBody
    @RequestMapping(value = "/news/ajax/deleteNews.do", produces = "application/json")
    public ResponseMessage deleteNews(@RequestParam(value = "newsId") int newsId, Locale locale) {
        News dbNews = newsService.selectByPrimaryKey(newsId);
        if (dbNews != null) {
            newsService.deleteByPrimaryKey(newsId);
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false, messageSource.getMessage("message.error.can.not.find.record", null, locale));
    }

    @ResponseBody
    @RequestMapping(value = "/news/ajax/changeNews.do", method = RequestMethod.POST)
    public ResponseMessage changeNews(@ModelAttribute("news") News news, Locale locale) {
        newsService.updateByPrimaryKeySelective(news);
        logger.debug("News updated successfully!");
        return new ResponseMessage(true, messageSource.getMessage("message.change.success", null, locale));
    }

    @ResponseBody
    @RequestMapping(value = "/news/ajax/deleteNewsArray.do", produces = "application/json")
    public ResponseMessage deleteNewsArray(Integer[] newsArray, Locale locale) {
        if (newsArray.length > 1) {
            for (int i = 0; i < newsArray.length; i++) {
                newsService.deleteByPrimaryKey(newsArray[i]);
            }
            return new ResponseMessage(true);
        }
        return new ResponseMessage(false, messageSource.getMessage("message.error.can.not.find.record", null, locale));
    }

    public MessageSource getMessageSource() {
        return messageSource;
    }

    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    public INewsService getNewsService() {
        return newsService;
    }

    @Autowired
    public void setNewsService(INewsService newsService) {
        this.newsService = newsService;
    }
}
