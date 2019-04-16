package cn.zdn.obs.backend.controller;

import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.model.OrderBook;
import cn.zdn.obs.service.OrderBookService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backend/orderBookManager")
public class OrderBookController {
    @Autowired
    private OrderBookService orderBookService;

    @RequestMapping("/queryByOrderId")
    @ResponseBody
    public List<OrderBook> queryByOrderId(Integer orderId) {
        List<OrderBook> orderBookList = orderBookService.queryByOrderId(orderId);
        return orderBookList;
    }
}
