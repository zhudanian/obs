package cn.zdn.obs.front.controller;

import cn.zdn.obs.cart.BookCart;
import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.exceptions.CustomerNotExistException;

import cn.zdn.obs.front.cart.BookCartUtils;
import cn.zdn.obs.model.BookCartItem;
import cn.zdn.obs.model.Contact;
import cn.zdn.obs.model.Customer;
import cn.zdn.obs.service.BookCartService;
import cn.zdn.obs.service.ContactService;
import cn.zdn.obs.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;


@Controller
@RequestMapping("/front/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ContactService contactService;

    @Autowired
    private BookCartService bookCartService;

    @RequestMapping("toMyCenter")
    public String myCenter(HttpSession httpSession, Model model) {
        Integer customerId = ((Customer) httpSession.getAttribute("customer")).getCustomerId();
        Customer customer = customerService.queryByCustomerId(customerId);

        System.out.println(customerId);
        List<Contact> contactList = contactService.queryAllContact(customerId);
        System.out.println(contactList);
        model.addAttribute("customer", customer);
        model.addAttribute("contactList", contactList);
        return "myCenter";
    }

    @RequestMapping("/toRegister")
    public String toRegister() {
        return "register";
    }

    @RequestMapping("/register")
    public String register(Customer customer, Model model) {

        customer.setCustomerPassword(DigestUtils.md5DigestAsHex(customer.getCustomerPassword().getBytes()));
        Integer res = customerService.add(customer);
        if (res == 1) {
            model.addAttribute("successMessage", "注册成功!");
            return "forward:/front/bookstore/showBookstore";
        } else {
            model.addAttribute("errorMessage", "注册失败!");
            return "register";
        }

    }

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/login")
    public String login(String customerName, String customerPassword, HttpSession session, Model model) throws CustomerNotExistException {
        try {
            Customer customer = customerService.queryCustomerByNameAndPassword(customerName, customerPassword);
            List<BookCartItem> bookCartItem = bookCartService.queryCartByCustomerId(customer.getCustomerId());
            Map<Integer, BookCartItem> books = bookCartItem.stream().collect(Collectors.toMap(BookCartItem::getBookCartItemId, Function.identity(), (key1, key2) -> key2));
            System.out.println(books);
            BookCart bookCart = new BookCart();
            bookCart.setBooks(books);

            //将该sysuser存入session作用域
            session.setAttribute("customer", customer);
            session.setAttribute("bookCart", bookCart);

            System.out.println(((BookCart) session.getAttribute("bookCart")).getItems());

            return "forward:/front/bookstore/showBookstore";

        } catch (CustomerNotExistException e) {
            //e.printStackTrace();
            model.addAttribute("errorMsg", e.getMessage());
            //返回视图名称,通过视图解析器，将该名称拼接成完整的页面路径，从而实现页面的返回
            return "login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession httpSession) {
        BookCart bookCart = (BookCart) httpSession.getAttribute("bookCart");
        bookCartService.addToDB(bookCart);
        httpSession.invalidate();

        return "forward:/front/bookstore/showBookstore";
    }

    @RequestMapping("/checkCustomerName")
    @ResponseBody
    //自动将被校验的值注入
    public Map<String, Object> checkCustomerName(String customerName) {
        Map<String, Object> map = new HashMap<>();
        boolean res = customerService.checkCustomerName(customerName);
        //如果不存在该用户名，可用
        if (res) {
            map.put("valid", true);
        } else {
            map.put("valid", false);
            map.put("message", "账号【" + customerName + "】已经存在");
        }
        return map;
    }

    //修改账号信息
    @RequestMapping("/modifyBaseInfo")
    @ResponseBody
    public ResponseResult modifyBaseInfo(Customer customer, HttpSession httpSession) {
        customer.setCustomerId(((Customer) httpSession.getAttribute("customer")).getCustomerId());
        System.out.println(customer);
        Integer res = customerService.modify(customer);
        if (res == 1) {
            return ResponseResult.success("修改成功！");
        } else {
            return ResponseResult.fail("修改失败!");
        }
    }

//    @RequestMapping("/beMember")
//    @ResponseBody
//    public ResponseResult beMember() {
//
//        return ResponseResult.success("恭喜你成功成为会员!");
//    }

    @RequestMapping("/addAddress")
    @ResponseBody
    public ResponseResult addAddress(Contact contact, HttpSession httpSession) {
        Integer customerId = ((Customer) httpSession.getAttribute("customer")).getCustomerId();
        contact.setCustomer(customerService.queryByCustomerId(customerId));
        Integer res = contactService.addAddress(contact);
        if (res == 1) {
            return ResponseResult.success("添加成功");
        } else {
            return ResponseResult.fail("添加失败");
        }

    }

    @RequestMapping("/queryAddressById")
    @ResponseBody
    public ResponseResult queryAddressById(Integer contactId) {
        System.out.println(contactId);
        Contact res = contactService.queryAddressById(contactId);
        System.out.println(res);
        ResponseResult responseResult = new ResponseResult();
        responseResult.setObj(res);
        return responseResult;
    }

    @RequestMapping("/modifyAddress")
    @ResponseBody
    public ResponseResult modifyAddress(Contact contact) {
        System.out.println(contact);
        Integer res = contactService.modifyAddress(contact);
        if (res == 1) {
            return ResponseResult.success("修改成功");
        } else {
            return ResponseResult.fail("修改失败");
        }

    }

    @RequestMapping("/removeAddress")
    @ResponseBody
    public ResponseResult removeAddress(Integer contactId) {
        Integer res = contactService.removeAddress(contactId);
        if (res == 1) {
            return ResponseResult.success("删除成功");
        } else {
            return ResponseResult.fail("删除成功");
        }

    }

}
