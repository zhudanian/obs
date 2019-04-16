package cn.zdn.obs.service.impl;

import cn.zdn.obs.constants.Constant;
import cn.zdn.obs.dao.SysUserDao;
import cn.zdn.obs.exceptions.SysuserNotExistException;
import cn.zdn.obs.model.SysUser;
import cn.zdn.obs.params.SysUserParam;
import cn.zdn.obs.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserDao sysUserDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public SysUser queryBySysLoginNameAndSysPassword(String sysLoginName, String sysPassword)  throws SysuserNotExistException {
        SysUser sysUser= sysUserDao.selectBySysLoginNameAndSysPassword(sysLoginName, DigestUtils.md5DigestAsHex(sysPassword.getBytes()), Constant.SYSUSER_VALID);
        if(sysUser!=null){
            return sysUser;
        }
        throw  new SysuserNotExistException("用户名或密码不正确");
    }

    @Override
    public boolean checkSysLoginName(String sysLoginName, Integer sysId) {
        SysUser sysUser = sysUserDao.selectBySysLoginNameAndSysId(sysLoginName,sysId);
        if(sysUser!=null){
            return false;
        }
        return true;
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
    public Integer modify(SysUser sysUser) {
        return sysUserDao.update(sysUser);

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
