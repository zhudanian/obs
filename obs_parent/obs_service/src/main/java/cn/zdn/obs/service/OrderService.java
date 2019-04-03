package cn.zdn.obs.service;

import cn.zdn.obs.model.Order;

import java.util.List;

public interface OrderService {

    List<Order> queryAll();

    Order queryByOrderId(Integer orderId);

    Integer modify(Order order);

    Integer remove(Integer orderId);

    Integer add(Order order);
}
