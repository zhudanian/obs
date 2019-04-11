package cn.zdn.obs.front.controller;

import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.model.Customer;
import cn.zdn.obs.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/front/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;


    @RequestMapping("/myCenter")
    public String myCenter() {

        return "myCenter";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/login")
    public String login(String customerName, String customerPassword, Model model) {
        model.addAttribute("customer",null);
        Customer customer = customerService.queryCustomerByNameAndPassword(customerName, customerPassword);
        //System.out.println(customer);
        if (null == customer) {
            model.addAttribute("customer", customer);
            ResponseResult.success("登录成功!");
            return "main";
        } else {
            ResponseResult.fail("密码错误!");
            return "login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession httpSession) {
        httpSession.removeAttribute("customer");
        return "main";
    }

    @RequestMapping("checkNameNotExist")
    @ResponseBody
    public ResponseResult checkNameNotExist(String customerName) {

        customerService.checkNameExist(customerName);
        return ResponseResult.fail("用户不存在!");
    }

    @RequestMapping("/checkNameExist")
    public ResponseResult checkNameExist(String customerName) {

        customerService.checkNameExist(customerName);
        return ResponseResult.fail("用户名已被使用!");
    }

    @RequestMapping("/register")
    @ResponseBody
    public ResponseResult register(Customer customer) {
        customerService.add(customer);
        return ResponseResult.success("注册成功!");
    }

    @RequestMapping("/beMember")
    @ResponseBody
    public ResponseResult beMember() {

        return ResponseResult.success("恭喜你成功成为会员!");
    }

}
