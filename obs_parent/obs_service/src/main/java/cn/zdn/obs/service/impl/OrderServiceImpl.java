package cn.zdn.obs.service.impl;

import cn.zdn.obs.dao.OrderDao;
import cn.zdn.obs.model.Order;
import cn.zdn.obs.service.OrderService;
import cn.zdn.obs.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public Order queryByOrderId(Integer orderId) {
        return orderDao.select(orderId);
    }

    @Override
    public List<Order> queryAll() {
        return orderDao.selectAll();
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
    }
}
