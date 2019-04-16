package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
public class Customer implements Serializable {

    private Integer customerId;
    private String customerName;
    private String customerPassword;
    private String customerAddress;
    private String customerPhone;
    private Date customerRegisterDate;

    //人对订单、地址、评论 ：一对多
    //购物车 ：一对一
    private List<Order> orderList;
    private List<Contact> contactList;
    private List<Cart> cartList;
    private List<Comment> commentList;


}
