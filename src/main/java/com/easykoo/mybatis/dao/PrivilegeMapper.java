package com.easykoo.mybatis.dao;

import com.easykoo.mybatis.model.Privilege;

import java.util.Map;

public interface PrivilegeMapper {
    int deleteByPrimaryKey(Integer privilegeId);

    int insert(Privilege record);

    int insertSelective(Privilege record);

    Privilege selectByPrimaryKey(Integer privilegeId);

    int updateByPrimaryKeySelective(Privilege record);

    int updateByPrimaryKey(Privilege record);

    boolean checkFunctionPrivilege(Map<String, Object> params);

    boolean checkModulePrivilege(Map<String, Object> params);
}