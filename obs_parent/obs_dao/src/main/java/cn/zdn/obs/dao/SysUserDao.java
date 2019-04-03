package cn.zdn.obs.dao;


import cn.zdn.obs.model.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface SysUserDao {


    SysUser selectBySysLoginNameAndSysPassword(@Param("sysLoginName") String sysLoginName, @Param("sysPassword") String sysPassword,@Param("isValid")Integer isValid);

    List<SysUser> selectAll();

    Integer insert(SysUser sysUser);

    SysUser select(Integer sysId);

    Integer update(int id,SysUser sysUser);

    Integer updateStatus(Integer sysId);

    Integer delete(Integer sysId);
}
