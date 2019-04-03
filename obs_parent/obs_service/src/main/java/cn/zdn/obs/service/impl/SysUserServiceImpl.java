package cn.zdn.obs.service.impl;

import cn.zdn.obs.constants.Constant;
import cn.zdn.obs.dao.SysUserDao;
import cn.zdn.obs.exceptions.SysUserNotExistException;
import cn.zdn.obs.model.SysUser;
import cn.zdn.obs.params.SysUserParam;
import cn.zdn.obs.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserDao sysUserDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public SysUser queryBySysLoginNameAndSysPassword(String sysLoginName, String sysPassword) {
        SysUser sysUser = sysUserDao.selectBySysLoginNameAndSysPassword(sysLoginName, sysPassword, Constant.SYSUSER_VALID);
        return sysUser;
    }

    @Override
    public boolean checkName(String loginName) {
        return false;
    }

    @Override
    public List<SysUser> queryBySysUserParams(SysUserParam sysUserParam) {
        return null;
    }

    @Override
    public List<SysUser> queryAll() {
        return sysUserDao.selectAll();
    }

    @Override
    public Integer add(SysUser sysUser) {
        return sysUserDao.insert(sysUser);
    }

    @Override
    public Integer modify(Integer sysId, SysUser sysUser) {
        return sysUserDao.update(sysId, sysUser);

    }

    @Override
    public SysUser queryBySysId(Integer sysId) {
        return sysUserDao.select(sysId);
    }

    @Override
    public Integer modifyStatus(Integer sysId) {
        return sysUserDao.updateStatus(sysId);
    }


}
