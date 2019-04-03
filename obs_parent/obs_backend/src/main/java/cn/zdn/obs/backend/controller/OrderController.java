package cn.zdn.obs.backend.controller;

import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.model.Order;
import cn.zdn.obs.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/backend/orderManager")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/queryAll")
    public String queryAll(Integer pageNum, Model model) {
        PageHelper.startPage(pageNum);
        List<Order> orders = orderService.queryAll();
        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        model.addAttribute("order", pageInfo);
        return "orderManager";
    }


    //按Id查询：显示修改和编辑
    @RequestMapping("/queryByOrderId")
    @ResponseBody
    public ResponseResult queryByOrderId(Integer orderId) {
        Order order = orderService.queryByOrderId(orderId);
        return ResponseResult.success(order);
    }

    //修改
    @RequestMapping("/modify")
    @ResponseBody
    public ResponseResult modify(Order order) {
        Integer res = orderService.modify(order);
        if (res > 0) {
            return ResponseResult.success("添加成功！");
        } else {
            return ResponseResult.fail("添加失败!");
        }

    }

    //删除书籍
    @RequestMapping("/removeByBookId")
    @ResponseBody
    public ResponseResult removeByOrderId(Integer orderId) {
        Integer res = orderService.remove(orderId);
        if (res > 0) {
            return ResponseResult.success("删除成功！");
        } else {
            return ResponseResult.fail("删除失败!");
        }
    }

    //添加书籍
    @RequestMapping("/add")
    @ResponseBody
    public ResponseResult add(Order order) {
        Integer res = orderService.add(order);
        if (res > 0) {
            return ResponseResult.success("添加成功！");
        } else {
            return ResponseResult.fail("添加失败!");
        }
    }

}
