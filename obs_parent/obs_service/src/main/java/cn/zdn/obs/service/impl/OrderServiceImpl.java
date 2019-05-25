package cn.zdn.obs.service.impl;

import cn.zdn.obs.dao.OrderBookDao;
import cn.zdn.obs.dao.OrderDao;
import cn.zdn.obs.model.Book;
import cn.zdn.obs.model.Order;
import cn.zdn.obs.model.OrderBook;
import cn.zdn.obs.service.OrderService;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Autowired
    private OrderBookDao orderBookDao;

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
    public List<Order> queryByCustomerId(Integer customerId) throws Exception{

             List<Order> orders =orderDao.selectByCustomerId(customerId);

        /*// 遍历循环每个订单
        for (Order order : orders) {
            // 下面代码是往每个订单里存放订单项以及商品信息
            //String sql1 = "select * from product pro,orderitem oi where pro.pid=oi.pid and oi.oid=?";
            List<Map<String, OrderBook>> list = orderBookDao.selectByOrderId1(order.getOrderId());
            //遍历循环查询出来的map信息，对商品、订单项、订单进行封装
            for (Map<String, OrderBook> map : list) {
                Book book = new Book();
                // 将查询的数据封装到product中
                BeanUtils.populate(book, map);
                OrderBook orderBook = new OrderBook();
                // 将查询的数据封装到orderitem中
                BeanUtils.populate(orderBook, map);
                // 将封装好的product再封装到orderitem中
                orderBook.setBook(book);
                // 将orderitem封装到order中
                order.getOrderBookList().add(orderBook);
            }
        }*/

        return orders;

    }

}
