package com.easykoo.service;

import com.easykoo.mybatis.dao.FunctionMapper;
import com.easykoo.mybatis.dao.ModuleMapper;
import com.easykoo.mybatis.dao.PrivilegeMapper;
import com.easykoo.mybatis.model.Account;
import com.easykoo.mybatis.model.Function;
import com.easykoo.mybatis.model.Module;
import com.easykoo.mybatis.model.Privilege;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public boolean isAuthorized(String uri, Account account) {
        //todo check ban
        Function function = functionMapper.selectByUri(uri);
        //check permission in function
        if (function == null) {
            logger.debug("Not configured in function!");
            return false;
        }
        for (Privilege privilege : function.getPrivilegeList()) {
            if (privilege.getRoleId() == account.getRoleId() && privilege.getDepartmentId() == account.getDepartmentId()) {
                logger.debug("Authorized in function!");
                return true;
            }
        }
        logger.debug("Not authorized in function!");

        //check permission in module
        Module module = moduleMapper.selectByPrimaryKey(function.getModuleId());
        if (module == null) {
            logger.debug("Not configured in module!");
            return false;
        }
        for (Privilege privilege : module.getPrivilegeList()) {
            if (privilege.getRoleId() == account.getRoleId() && privilege.getDepartmentId() == account.getDepartmentId()) {
                logger.debug("Authorized in module!");
                return true;
            }
        }
        logger.debug("Not authorized in module!");
        return false;
    }
}
