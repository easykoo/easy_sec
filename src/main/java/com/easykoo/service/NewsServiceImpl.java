package com.easykoo.service;

import com.easykoo.mybatis.dao.NewsMapper;
import com.easykoo.mybatis.model.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by easykooc on 14-2-25.
 */
@Service("newsService")
public class NewsServiceImpl implements INewsService {
    private NewsMapper newsMapper;

    public NewsMapper getNewsMapper() {
        return newsMapper;
    }

    @Autowired
    public void setNewsMapper(NewsMapper newsMapper) {
        this.newsMapper = newsMapper;
    }

    @Override
    public int deleteByPrimaryKey(Integer newsId) {
        return newsMapper.deleteByPrimaryKey(newsId);
    }

    @Override
    public int insert(News record) {
        return newsMapper.insert(record);
    }

    @Override
    public int insertSelective(News record) {
        return newsMapper.insertSelective(record);
    }

    @Override
    public News selectByPrimaryKey(Integer newsId) {
        return newsMapper.selectByPrimaryKey(newsId);
    }

    @Override
    public int updateByPrimaryKeySelective(News record) {
        return newsMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(News record) {
        return newsMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<News> getTopPriorityNewss() {
        return newsMapper.getTopPriorityNewss();
    }

    @Override
    public List<News> findNewsWithPage(News record) {
        return newsMapper.findNewsWithPage(record);
    }
}
