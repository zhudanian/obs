package cn.zdn.obs.service.impl;

import cn.zdn.obs.dao.OrderDao;
import cn.zdn.obs.model.Order;
import cn.zdn.obs.service.OrderService;
import cn.zdn.obs.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public List<Order> queryAll() {
        System.out.println(orderDao.selectAll());
        return orderDao.selectAll();
    }

    @Override
    public void changeOrderState(Integer orderId) {
        orderDao.updateOrderState(orderId);

    }


  /*  @Override
    public Order queryByOrderId(Integer orderId) {
        return orderDao.selectByOrderId(orderId);
    }

    @Override
    public Integer add(Order order) {

        return orderDao.insert(order);
    }

    @Override
    public Integer modify(Order order) {
        return orderDao.update(order);
    }

    @Override
    public Integer remove(Integer orderId) {
        return orderDao.delete(orderId);
    }*/

    @Override
    public List<Order> queryByCustomerId(Integer customerId) {
        return null;
    }


}
