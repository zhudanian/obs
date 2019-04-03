package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Customer implements Serializable {

    private Integer customerId;
    private String customerName;
    private String customerPassword;
    private String customerAddress;
    private String customerPhone;
    private Date customerRegisterDate;

}
