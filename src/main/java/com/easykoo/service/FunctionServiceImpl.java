package com.easykoo.service;

import com.easykoo.mybatis.dao.FunctionMapper;
import com.easykoo.mybatis.model.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Feb 22, 2014    Steven
 */
@Service("functionService")
public class FunctionServiceImpl implements IFunctionService {
    private FunctionMapper functionMapper;

    public FunctionMapper getFunctionMapper() {
        return functionMapper;
    }

    @Autowired
    public void setFunctionMapper(FunctionMapper functionMapper) {
        this.functionMapper = functionMapper;
    }

    @Override
    public int deleteByPrimaryKey(Integer functionId) {
        return 0;
    }

    @Override
    public int insert(Function record) {
        return 0;
    }

    @Override
    public int insertSelective(Function record) {
        return 0;
    }

    @Override
    public Function selectByPrimaryKey(Integer functionId) {
        return functionMapper.selectByPrimaryKey(functionId);
    }

    @Override
    public int updateByPrimaryKeySelective(Function record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Function record) {
        return 0;
    }

    @Override
    public Function selectByUri(String uri) {
        return functionMapper.selectByUri(uri);
    }
}
