package cn.zdn.obs.service;

import cn.zdn.obs.model.Order;
import cn.zdn.obs.model.Orders;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface OrderService {
    //后台
    List<Order> queryAll();

    /*Order queryByOrderId(Integer orderId);

    Integer modify(Order order);

    Integer remove(Integer orderId);

    Integer add(Order order);*/

    //前台
    List<Order> queryByCustomerId(Integer customerId) throws Exception;

    void changeOrderState(String orderId);

    void generateOrder(Orders orders);
}
