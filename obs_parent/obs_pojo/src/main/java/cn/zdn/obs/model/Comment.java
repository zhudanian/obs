package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
@Data
public class Comment implements Serializable {

    private Integer commentId;

    private String commentContent;
    private String userResponse;

    //评论对人： 多对一
    private Customer customer;

    //评论对订单： 多对一
    private Order order;

}
