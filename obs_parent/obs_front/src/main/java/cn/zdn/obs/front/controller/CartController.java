package cn.zdn.obs.front.controller;

import cn.zdn.obs.cart.BookCart;
import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.front.cart.BookCartUtils;
import cn.zdn.obs.model.Contact;
import cn.zdn.obs.model.Customer;
import cn.zdn.obs.service.BookCartService;
import cn.zdn.obs.service.BookService;
import cn.zdn.obs.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/front/cart")
public class CartController {


    @Autowired
    private BookCartService bookCartService;

    @Autowired
    private ContactService contactService;
    @RequestMapping("/queryMyCart")
    public String queryMyCart(HttpSession httpSession, Model model) {
      /*
        Integer customerId = ((Customer) httpSession.getAttribute("customer")).getCustomerId();
        List<Contact> contactList = contactService.queryAllContact(customerId);

        model.addAttribute("contactList", contactList);*/

        //Customer customer = customerService.queryByCustomerId(customerId);
        if(httpSession.getAttribute("customer")!=null){
            Integer customerId = ((Customer) httpSession.getAttribute("customer")).getCustomerId();
            List<Contact> contactList = contactService.queryAllContact(customerId);
            System.out.println(contactList);
            //model.addAttribute("customer", customer);
            model.addAttribute("contactList", contactList);
        }

        return "myCart";
    }

    //将商品放入购物车
    @RequestMapping("/addToCart")
    @ResponseBody
    public ResponseResult addToCart(@RequestParam("bookId") Integer bookId, @RequestParam("num") Integer num, HttpSession session) {
        //   System.out.println(1);
        boolean flag = false;
        //获取购物车对象
        BookCart bookCart = BookCartUtils.getBookCart(session);
        //调用业务层的addToCart方法完成放入购物车逻辑,返回true:表示放入购物车成功，否则返回false
        flag = bookCartService.addToCart(bookCart, bookId, num);

        System.out.println(BookCartUtils.getBookCart(session));
        if (flag) {
            return ResponseResult.success("放入购物车成功");

        } else {
            return ResponseResult.fail("放入购物车失败");
        }
    }


    @RequestMapping("/removeFromCartByIds")
    @ResponseBody
    public void removeFromCartByIds(int[] bookIds,HttpSession session) {
       // System.out.println(bookIds);
        BookCart bookCart = BookCartUtils.getBookCart(session);
        for(Integer bookId:bookIds){
            bookCartService.removeFromCartById(bookCart,bookId);
        }
    }

    @RequestMapping("/removeFromCartById")
    @ResponseBody
    public void removeFromCartById(Integer bookId,HttpSession session) {
        BookCart bookCart = BookCartUtils.getBookCart(session);
        bookCartService.removeFromCartById(bookCart,bookId);
    }

    @RequestMapping("/clearCart")
    @ResponseBody
    public void clearCart(HttpSession session) {
        BookCart bookCart = BookCartUtils.getBookCart(session);
        bookCartService.clearCart(bookCart);
    }

    @RequestMapping("/changeNum")
    @ResponseBody
    public void changeNum(Integer bookId,Integer num,HttpSession session){
        System.out.println(bookId);
        System.out.println(num);
        BookCart bookCart = BookCartUtils.getBookCart(session);
        bookCartService.changeNum(bookCart,bookId,num);
    }


}
