package cn.zdn.obs.service.impl;

import cn.zdn.obs.dao.OrderBookDao;
import cn.zdn.obs.model.OrderBook;
import cn.zdn.obs.service.OrderBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class OrderBookServiceImpl implements OrderBookService {
    @Autowired
    private OrderBookDao orderBookDao;

    @Override
    public List<OrderBook> queryByOrderId(Integer orderId) {
        return orderBookDao.selectByOrderId(orderId);
    }

  /*  @Override
    public OrderBook queryByOrderBookId(Integer orderBookId) {

        return orderBookDao.select(orderBookId);
    }

    @Override
    public Integer add(OrderBook orderBook) {
        return orderBookDao.insert(orderBook);
    }

    @Override
    public Integer modify(OrderBook orderBook) {
        return orderBookDao.update(orderBook);
    }

    @Override
    public Integer remove(Integer orderBookId) {
        return orderBookDao.delete(orderBookId);
    }*/
}
