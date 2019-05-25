package cn.zdn.obs.front.controller;

import cn.zdn.obs.cart.BookCart;
import cn.zdn.obs.constants.Constant;
import cn.zdn.obs.front.cart.BookCartUtils;
import cn.zdn.obs.model.*;
import cn.zdn.obs.service.CustomerService;
import cn.zdn.obs.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Controller
@RequestMapping("/front/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/queryMyOrder")
    public String queryMyOrder(Integer pageNum, Model model, HttpSession httpSession) throws Exception {
        if (ObjectUtils.isEmpty(pageNum)) {
            pageNum = Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        Customer customer = (Customer) httpSession.getAttribute("customer");
        Integer customerId = customer.getCustomerId();
        List<Order> orderList = orderService.queryByCustomerId(customerId);
        System.out.println(orderList);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        model.addAttribute("orderList", pageInfo);
        return "myOrders";
    }

    @RequestMapping("/generateOrder")
    public String generateOrder(HttpSession session, Contact contact) throws Exception{
        BookCart bookCart = BookCartUtils.getBookCart(session);
        Customer customer = customerService.queryByCustomerId(((Customer)session.getAttribute("customer")).getCustomerId());
        Order order = new Order();
        Collection<BookCartItem> bookCartItems =  bookCart.getBooks().values();
        List<OrderBook> orderBookList = new ArrayList<>();

        for (BookCartItem bookCartItem:bookCartItems){
            OrderBook orderBook=new OrderBook();
            orderBook.setId(bookCartItem.getBookCartItemId());
            orderBook.setNum(bookCartItem.getNum());
            orderBook.setBook(bookCartItem.getBook());
            orderBookList.add(orderBook);
        }

        PropertyUtils.copyProperties(order, contact);
        order.setTotalPrice(bookCart.getTotalMoney());
        order.setCustomer(customer);
        order.setOrderBookList(orderBookList);
        //Cart cart = new Cart();
        return "myOrders";

    }


}
