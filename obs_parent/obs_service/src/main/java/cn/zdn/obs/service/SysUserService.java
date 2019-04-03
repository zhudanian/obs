package cn.zdn.obs.service;

import cn.zdn.obs.model.SysUser;
import cn.zdn.obs.params.SysUserParam;

import java.util.List;

public interface SysUserService {

    SysUser queryBySysLoginNameAndSysPassword(String sysLoginName, String sysPassword);

    boolean checkName(String loginName);

    List<SysUser> queryBySysUserParams(SysUserParam sysUserParam);

    List queryAll();

    Integer add(SysUser sysUser);

    Integer modifyStatus(Integer sysId);

    Integer modify(Integer sysId, SysUser sysUser);

    SysUser queryBySysId(Integer sysId);
}
