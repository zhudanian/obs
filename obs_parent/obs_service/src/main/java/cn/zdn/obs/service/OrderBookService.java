package cn.zdn.obs.service;

import cn.zdn.obs.model.OrderBook;

import java.util.List;

public interface OrderBookService {

    List<OrderBook> queryByOrderId(String orderId);

    void addOrderBooks(List<OrderBook> orderBookList);
}
