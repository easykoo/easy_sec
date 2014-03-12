package com.easykoo.service;

import com.easykoo.mybatis.dao.NoticeMapper;
import com.easykoo.mybatis.model.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by easykooc on 14-2-25.
 */
@Service("noticeService")
public class NoticeServiceImpl implements INoticeService {
    private NoticeMapper noticeMapper;

    public NoticeMapper getNoticeMapper() {
        return noticeMapper;
    }

    @Autowired
    public void setNoticeMapper(NoticeMapper noticeMapper) {
        this.noticeMapper = noticeMapper;
    }

    @Override
    public int deleteByPrimaryKey(Integer noticeId) {
        return noticeMapper.deleteByPrimaryKey(noticeId);
    }

    @Override
    public int insert(Notice record) {
        return noticeMapper.insert(record);
    }

    @Override
    public int insertSelective(Notice record) {
        return noticeMapper.insertSelective(record);
    }

    @Override
    public Notice selectByPrimaryKey(Integer noticeId) {
        return noticeMapper.selectByPrimaryKey(noticeId);
    }

    @Override
    public int updateByPrimaryKeySelective(Notice record) {
        return noticeMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Notice record) {
        return noticeMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Notice> getTopPriorityNotices() {
        return noticeMapper.getTopPriorityNotices();
    }

    @Override
    public List<Notice> findNoticeWithPage(Notice record) {
        return noticeMapper.findNoticeWithPage(record);
    }
}
