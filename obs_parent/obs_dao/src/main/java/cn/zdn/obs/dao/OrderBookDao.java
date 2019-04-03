package cn.zdn.obs.dao;


import cn.zdn.obs.model.OrderBook;

import java.util.List;

public interface OrderBookDao{


    OrderBook select(Integer orderBookId);

    List<OrderBook> selectAll();

    Integer insert(OrderBook orderBook);

    Integer update(OrderBook orderBook);

    Integer delete(Integer orderBookId);

}
