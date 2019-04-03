package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class OrderBook implements Serializable {

    private String id;
    private String orderId;
    private String bookId;
    private String num;
    private String price;

}
