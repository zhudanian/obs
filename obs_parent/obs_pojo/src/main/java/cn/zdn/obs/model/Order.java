package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class Order implements Serializable {

    private Integer orderId;
    private Date confirmDate;
    private Integer orderState;
    private BigDecimal totalPrice;
    private Integer customerId;
    private String contactName;
    private String contactPhone;
    private String contactAddress;
    private Integer commentId;


}
