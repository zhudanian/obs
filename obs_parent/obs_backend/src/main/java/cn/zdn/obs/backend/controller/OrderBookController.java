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

import java.util.List;

@Controller
@RequestMapping("/backend/orderBookManager")
public class OrderBookController {
    @Autowired
    private OrderBookService orderBookService;

    @RequestMapping("/queryAll")
    public String queryAll(Integer pageNum, Model model) {
        PageHelper.startPage(pageNum);
        List<OrderBook> orderBooks = orderBookService.queryAll();
        PageInfo<OrderBook> pageInfo = new PageInfo<>(orderBooks);
        model.addAttribute("orderBook", pageInfo);
        return "orderBookManager";
    }


    //按Id查询：显示修改和编辑
    @RequestMapping("/queryByOrderBookId")
    @ResponseBody
    public ResponseResult queryByOrderBookId(Integer orderBookId) {
        OrderBook orderBook = orderBookService.queryByOrderBookId(orderBookId);
        return ResponseResult.success(orderBook);
    }

    //修改
    @RequestMapping("/modify")
    @ResponseBody
    public ResponseResult modify(OrderBook orderBook) {
        Integer res = orderBookService.modify(orderBook);
        if (res > 0) {
            return ResponseResult.success("添加成功！");
        } else {
            return ResponseResult.fail("添加失败!");
        }

    }

    //删除书籍
    @RequestMapping("/removeByBookId")
    @ResponseBody
    public ResponseResult removeByOrderBookId(Integer orderBookId) {
        Integer res = orderBookService.remove(orderBookId);
        if (res > 0) {
            return ResponseResult.success("删除成功！");
        } else {
            return ResponseResult.fail("删除失败!");
        }
    }

    //添加书籍
    @RequestMapping("/add")
    @ResponseBody
    public ResponseResult add(OrderBook orderBook) {
        Integer res = orderBookService.add(orderBook);
        if (res > 0) {
            return ResponseResult.success("添加成功！");
        } else {
            return ResponseResult.fail("添加失败!");
        }
    }

}
