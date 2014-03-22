package com.easykoo.service;

import com.easykoo.mybatis.model.News;

import java.util.List;

public interface INewsService {
    int deleteByPrimaryKey(Integer newsId);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer newsId);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);

    List<News> getTopPriorityNewss();

    List<News> findNewsWithPage(News record);
}