package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class OrderBook implements Serializable {

    private String id;
    private String num;
    //订单明细对书 ：一对多
    private List<Book> bookList;

}
