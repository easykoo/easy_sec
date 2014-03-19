package com.easykoo.service;

import com.easykoo.mybatis.dao.FunctionMapper;
import com.easykoo.mybatis.dao.ModuleMapper;
import com.easykoo.mybatis.dao.PrivilegeMapper;
import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.Function;
import com.easykoo.mybatis.model.Privilege;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.HashMap;

/**
 * Feb 22, 2014    Steven
 */
@Service("privilegeService")
public class PrivilegeServiceImpl implements IPrivilegeService {
    private Log logger = LogFactory.getLog(getClass());
    private PrivilegeMapper privilegeMapper;
    private FunctionMapper functionMapper;
    private ModuleMapper moduleMapper;

    public FunctionMapper getFunctionMapper() {
        return functionMapper;
    }

    @Autowired
    public void setFunctionMapper(FunctionMapper functionMapper) {
        this.functionMapper = functionMapper;
    }

    public ModuleMapper getModuleMapper() {
        return moduleMapper;
    }

    @Autowired
    public void setModuleMapper(ModuleMapper moduleMapper) {
        this.moduleMapper = moduleMapper;
    }

    public PrivilegeMapper getPrivilegeMapper() {
        return privilegeMapper;
    }

    @Autowired
    public void setPrivilegeMapper(PrivilegeMapper privilegeMapper) {
        this.privilegeMapper = privilegeMapper;
    }

    @Override
    public int deleteByPrimaryKey(Integer privilegeId) {
        return privilegeMapper.deleteByPrimaryKey(privilegeId);
    }

    @Override
    public int insert(Privilege record) {
        return privilegeMapper.insert(record);
    }

    @Override
    public int insertSelective(Privilege record) {
        return privilegeMapper.insertSelective(record);
    }

    @Override
    public Privilege selectByPrimaryKey(Integer privilegeId) {
        return privilegeMapper.selectByPrimaryKey(privilegeId);
    }

    @Override
    public int updateByPrimaryKeySelective(Privilege record) {
        return privilegeMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Privilege record) {
        return privilegeMapper.updateByPrimaryKey(record);
    }

    @Override
    public boolean isAuthorized(String test, Account account) {
        //todo check ban
        if (account != null) {
            try {
                //check module privilege with moduleId
                Integer moduleId = Integer.parseInt(test);
                checkModulePrivilege(account.getRoleId(), account.getDepartmentId(), moduleId);
                if (checkFunctionPrivilege(account.getRoleId(), account.getDepartmentId(), test)) {
                    logger.debug("Authorized in function!");
                    return true;
                }
            } catch (NumberFormatException e) {
                //check function privilege
                if (checkFunctionPrivilege(account.getRoleId(), account.getDepartmentId(), test)) {
                    logger.debug("Authorized in function!");
                    return true;
                }
                logger.debug("Not authorized in function!");

                //check module privilege
                if (checkModulePrivilege(account.getRoleId(), account.getDepartmentId(), test)) {
                    logger.debug("Authorized in module!");
                    return true;
                }
            }
            logger.debug("Not authorized in module!");
            return false;
        } else {
            logger.debug("No account in session!");
            return false;
        }
    }

    private boolean checkModulePrivilege(Integer roleId, Integer departmentId, Integer moduleId) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("roleId", roleId);
        params.put("departmentId", departmentId);
        params.put("moduleId", moduleId);
        return privilegeMapper.checkModulePrivilegeWithModuleId(params);
    }

    boolean checkFunctionPrivilege(int roleId, int departmentId, String uri) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("roleId", roleId);
        params.put("departmentId", departmentId);
        params.put("uri", uri);
        return privilegeMapper.checkFunctionPrivilege(params);
    }

    boolean checkModulePrivilege(int roleId, int departmentId, String uri) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("roleId", roleId);
        params.put("departmentId", departmentId);
        params.put("uri", uri);
        return privilegeMapper.checkModulePrivilege(params);
    }
}
