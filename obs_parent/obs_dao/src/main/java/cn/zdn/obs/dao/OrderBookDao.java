package cn.zdn.obs.dao;


import cn.zdn.obs.model.OrderBook;

import java.util.List;
import java.util.Map;

public interface OrderBookDao{


   // OrderBook select(Integer orderBookId);

    List<OrderBook> selectByOrderId(String orderBookId);

    List<Map<String, OrderBook>> selectByOrderId1(Integer orderBookId);
    //Integer insert(OrderBook orderBook);

    Integer update(OrderBook orderBook);

    Integer delete(Integer orderBookId);

    void insert(OrderBook orderBook);
}
