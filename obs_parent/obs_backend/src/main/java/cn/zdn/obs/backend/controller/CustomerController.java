package cn.zdn.obs.backend.controller;

import cn.zdn.obs.constants.Constant;
import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.model.Customer;
import cn.zdn.obs.service.CustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/backend/customerManager")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/queryAll")
    public String queryAll(Integer pageNum, Model model) {
        if (ObjectUtils.isEmpty(pageNum)) {
            pageNum = Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Customer> customers = customerService.queryAll();
        PageInfo<Customer> pageInfo = new PageInfo<>(customers);
        model.addAttribute("customer", pageInfo);
        return "customerManager";
    }


    //按Id查询：显示修改和编辑
    @RequestMapping("/queryByCustomerId")
    @ResponseBody
    public ResponseResult queryByCustomerId(Integer customerId) {
        Customer customer = customerService.queryByCustomerId(customerId);
        System.out.println(customer);
        return ResponseResult.success(customer);
    }

    //修改
    @RequestMapping("/modify")
    @ResponseBody
    public ResponseResult modify(Customer customer) {
        Integer res = customerService.modify(customer);
        if (res > 0) {
            return ResponseResult.success("添加成功！");
        } else {
            return ResponseResult.fail("添加失败!");
        }

    }

}
