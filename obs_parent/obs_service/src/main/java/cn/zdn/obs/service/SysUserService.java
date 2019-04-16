package cn.zdn.obs.service;

import cn.zdn.obs.exceptions.SysuserNotExistException;
import cn.zdn.obs.model.SysUser;
import cn.zdn.obs.params.SysUserParam;

import java.util.List;

public interface SysUserService {

    SysUser queryBySysLoginNameAndSysPassword(String sysLoginName, String sysPassword)  throws SysuserNotExistException;

    boolean checkSysLoginName(String sysLoginName, Integer sysId);

    List<SysUser> queryBySysUserParams(SysUserParam sysUserParam);

    List queryAll();

    Integer add(SysUser sysUser);

    Integer modifyStatus(Integer sysId);

    Integer modify(SysUser sysUser);

    SysUser queryBySysId(Integer sysId);
}
