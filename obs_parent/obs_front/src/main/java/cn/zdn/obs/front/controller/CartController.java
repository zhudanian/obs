package cn.zdn.obs.front.controller;

import cn.zdn.obs.cart.BookCart;
import cn.zdn.obs.cart.ShoppingCart;
import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.front.cart.BookCartUtils;
import cn.zdn.obs.front.cart.ShoppingCartUtils;
import cn.zdn.obs.service.BookCartService;
import cn.zdn.obs.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/front/cart")
public class CartController {

    @Autowired
    private BookService bookService;

    @Autowired
    private BookCartService bookCartService;

    @RequestMapping("/queryMyCart")
    public String queryMyCart() {
        return "myCart";
    }

    //将商品放入购物车
    @RequestMapping("/addToCart")
    @ResponseBody
    public ResponseResult addToCart(@RequestParam("bookId") Integer bookId,@RequestParam("num") Integer num, HttpSession session) {

        boolean flag = false;
        //获取购物车对象
        BookCart bookCart = BookCartUtils.getBookCart(session);
        //调用业务层的addToCart方法完成放入购物车逻辑,返回true:表示放入购物车成功，否则返回false
        flag = bookCartService.addToCart(bookCart,bookId,num);

        System.out.println(BookCartUtils.getBookCart(session));
        if (flag) {
            return ResponseResult.success("放入购物车成功");

        } else {
            return ResponseResult.fail("放入购物车失败");
        }
    }

    @RequestMapping("/clearCart")
    @ResponseBody
    public void clearCart(){

    }


}
