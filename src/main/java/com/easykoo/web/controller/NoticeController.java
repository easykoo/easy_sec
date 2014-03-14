package com.easykoo.web.controller;

import com.easykoo.model.DataTablesResponse;
import com.easykoo.model.ResponseMessage;
import com.easykoo.mybatis.model.Notice;
import com.easykoo.service.INoticeService;
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
public class NoticeController {
    protected final Log logger = LogFactory.getLog(getClass());
    private INoticeService noticeService;
    private MessageSource messageSource;


    @RequestMapping(value = "/notice/allNotice.do", method = RequestMethod.GET)
    public String allNotice() {
        return "allNotice";
    }

    @RequestMapping(value = "/notice/publishNotice.do", method = RequestMethod.GET)
    public String publishNotice() {
        return "publishNotice";
    }

    @RequestMapping(value = "/notice/changeNotice.do", method = RequestMethod.GET)
    public String changeNotice() {
        return "changeNotice";
    }

    @RequestMapping(value = "/notice/publishNotice.do", method = RequestMethod.POST)
    public String publishNotice(@ModelAttribute("notice") Notice notice, Locale locale, ModelMap model) {
        try {
            noticeService.insert(notice);
            logger.debug("Notice " + notice.getNoticeId() + " publish successfully!");
        } catch (DuplicateKeyException e) {
            logger.error("Duplicate key!", e);
            model.addAttribute("message", new ResponseMessage(false, messageSource.getMessage("message.error.duplicate.key", null, locale)));
            return "publishNotice";
        }
        return "changeNotice";
    }

    @RequestMapping(value = "/notice/changeNotice.do", method = RequestMethod.POST)
    public String changeNotice(@ModelAttribute("notice") Notice notice, Locale locale, ModelMap model) {
        noticeService.updateByPrimaryKeySelective(notice);
        logger.debug("Notice updated successfully!");
        model.addAttribute("message", new ResponseMessage(true, messageSource.getMessage("message.change.success", null, locale)));
        return "changeNotice";
    }

    @ResponseBody
    @RequestMapping(value = "/notice/ajax/allNotice.do", produces = "application/json")
    public DataTablesResponse allNotice(@RequestParam int iDisplayStart, @RequestParam int iDisplayLength, @RequestParam int iSortCol_0, @RequestParam String sSortDir_0, HttpServletRequest request) {
        DataTablesResponse<Notice> dt = new DataTablesResponse();

        Notice notice = new Notice();
        notice.setPageActived(true);
        notice.setPageSize(iDisplayLength);
        notice.setDisplayStart(iDisplayStart);
        String sortColumn = request.getParameter("mDataProp_" + iSortCol_0);
        notice.addSortProperties(sortColumn, sSortDir_0);
        List<Notice> noticeList = noticeService.findNoticeWithPage(notice);

        dt.setData(noticeList);
        dt.setTotalDisplayRecords(notice.getTotalRecord());
        dt.setTotalRecords(notice.getTotalRecord());
        return dt;
    }

    @ResponseBody
    @RequestMapping(value = "/notice/ajax/deleteNotice.do", produces = "application/json")
    public ResponseMessage deleteNotice(@RequestParam(value = "noticeId") int noticeId, Locale locale) {
        Notice dbNotice = noticeService.selectByPrimaryKey(noticeId);
        if (dbNotice != null) {
            noticeService.deleteByPrimaryKey(noticeId);
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

    public INoticeService getNoticeService() {
        return noticeService;
    }

    @Autowired
    public void setNoticeService(INoticeService noticeService) {
        this.noticeService = noticeService;
    }
}
