package cn.zdn.obs.params;

import lombok.Data;

import java.io.Serializable;

@Data
public class SysUserParam implements Serializable {
    private String sysId;
    private String sysName;
    private String sysLoginName;
    private String sysPassword;
    private String sysPhone;
    private String sysEmail;
    private String isValid;
    private String createDate;
}
