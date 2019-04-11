package cn.zdn.obs.front.controller;

import cn.zdn.obs.cart.ShoppingCart;
import cn.zdn.obs.constants.Constant;
import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.front.cart.ShoppingCartUtils;
import cn.zdn.obs.model.Book;
import cn.zdn.obs.model.BookType;
import cn.zdn.obs.params.BookParam;
import cn.zdn.obs.service.BookService;
import cn.zdn.obs.service.BookTypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/front/bookstore")
public class BookStoreController {

    @Autowired
    private BookTypeService bookTypeService;
    @Autowired
    private BookService bookService;

    @RequestMapping("/showBookstore")
    public String showBookstore(Model model) {
        List<Book> hotBooks = bookService.queryByHot();
        model.addAttribute("hotBooks", hotBooks);
        //System.out.println(hotBooks);
        List<Book> newBooks = bookService.queryNewBook();
        model.addAttribute("newBooks", newBooks);
        //System.out.println(newBooks);
        return "bookstore";
    }

    //sideBar
    @ModelAttribute("bookTypeList")
    public List<BookType> queryEnable() {
        List<BookType> bookTypeList = bookTypeService.queryEnable(Constant.BOOK_TYPE_ENABLE);
       // System.out.println(bookTypeList);
        return bookTypeList;
    }


    //将商品放入购物车
    @RequestMapping("/addToCart")
    @ResponseBody
    public ResponseResult addToCart(int id, HttpSession session) {
        boolean flag = false;
        //获取购物车对象
        ShoppingCart bookItem = ShoppingCartUtils.getShoppingCart(session);
        //调用业务层的addToCart方法完成放入购物车逻辑,返回true:表示放入购物车成功，否则返回false
        flag = bookService.addToCart(id, bookItem);

        if (flag) {
            return ResponseResult.success("放入购物车成功");

        } else {
            return ResponseResult.fail("放入购物车失败");
        }

    }

    @RequestMapping("queryByInput")
    public List<Book> queryByInput(String inputString) {
        List<Book> bookList = bookService.queryByInput(inputString);
        //System.out.println(bookList);
        return bookList;
    }

}
