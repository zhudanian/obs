package cn.zdn.obs.dao;


import cn.zdn.obs.model.Order;

import java.util.List;

public interface OrderDao{

    Order select(Integer orderId);

    List<Order> selectAll();

    Integer insert(Order order);

    Integer update(Order order);

    Integer delete(Integer orderId);




}
