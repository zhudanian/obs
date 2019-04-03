package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class SysUser implements Serializable {

    private Integer sysId;
    private String sysName;
    private String sysLoginName;
    private String sysPassword;
    private String sysPhone;
    private String sysEmail;
    private Integer isValid;
    private Date createDate;

}
