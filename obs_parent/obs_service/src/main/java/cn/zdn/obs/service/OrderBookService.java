package cn.zdn.obs.service;

import cn.zdn.obs.model.OrderBook;

import java.util.List;

public interface OrderBookService {

    OrderBook queryByOrderBookId(Integer orderBookId);

    List<OrderBook> queryAll();

    Integer add(OrderBook orderBook);

    Integer remove(Integer orderBookId);

    Integer modify(OrderBook orderBook);
}
