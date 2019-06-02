package cn.zdn.obs.dao;


import cn.zdn.obs.model.Order;
import cn.zdn.obs.model.Orders;

import java.util.List;

public interface OrderDao{

    Order selectByOrderId(Integer orderId);

    List<Order> selectAll();

    Integer insert(Orders orders);

    Integer update(Order order);

    Integer delete(Integer orderId);

    void updateOrderState(String orderId);

    List<Order> selectByCustomerId(Integer customerId);
}
