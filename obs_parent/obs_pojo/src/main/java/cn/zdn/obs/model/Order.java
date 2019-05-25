package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
public class Order implements Serializable {

    private Integer orderId;
    private Date confirmDate;
    private Integer orderState;
    private BigDecimal totalPrice;
    private String contactName;
    private String contactPhone;
    private String contactAddress;

    //订单对人 ：多对一
    private Customer customer;

    //订单对评论：一对一
    private Comment comment;

    //订单对订单明细：一对多
    private List<OrderBook> orderBookList;

}
