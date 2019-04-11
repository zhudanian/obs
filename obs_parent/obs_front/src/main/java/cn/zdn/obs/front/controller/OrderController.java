package cn.zdn.obs.front.controller;

import cn.zdn.obs.constants.Constant;
import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.model.Customer;
import cn.zdn.obs.model.Order;
import cn.zdn.obs.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/front/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/queryMyOrder")
    public String queryMyOrder(Integer pageNum, Model model, HttpSession httpSession) {
        if (ObjectUtils.isEmpty(pageNum)) {
            pageNum = Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        Customer customer = (Customer) httpSession.getAttribute("customer");
        Integer customerId = customer.getCustomerId();
        List<Order> orderList = orderService.queryByCustomerId(customerId);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        model.addAttribute("orderList", pageInfo);
        return "myOrders";
    }
}
