package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class Orders implements Serializable {

    private String orderId;
    private String confirmDate;
    private Integer orderState;
    private BigDecimal totalPrice;
    private String contactName;
    private String contactPhone;
    private String contactAddress;
    private Integer orderBookId;
    private Integer num;
    private Integer bookId;
    private String bookName;
    private String bookImage;
    private BigDecimal bookPrice;
    private Integer customerId;


}
