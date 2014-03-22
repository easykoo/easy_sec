package com.easykoo.mybatis.dao;

import com.easykoo.mybatis.model.News;

import java.util.List;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer newsId);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer newsId);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);

    List<News> findNewsWithPage(News record);

    List<News> getTopPriorityNewss();
}