package cn.zdn.obs.front.controller;

import cn.zdn.obs.cart.BookCart;
import cn.zdn.obs.constants.Constant;
import cn.zdn.obs.front.cart.BookCartUtils;
import cn.zdn.obs.front.vo.OrderBookVO;
import cn.zdn.obs.model.*;
import cn.zdn.obs.service.BookService;
import cn.zdn.obs.service.CustomerService;
import cn.zdn.obs.service.OrderBookService;
import cn.zdn.obs.service.OrderService;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import javafx.scene.input.DataFormat;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/front/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderBookService orderBookService;
    @Autowired
    private BookService bookService;
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/queryMyOrder")
    public String queryMyOrder(Integer pageNum, Model model, HttpSession httpSession) throws Exception {
        if (ObjectUtils.isEmpty(pageNum)) {
            pageNum = Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum, 8);
        Customer customer = (Customer) httpSession.getAttribute("customer");
        Integer customerId = customer.getCustomerId();
        List<Order> orderList = orderService.queryByCustomerId(customerId);
        System.out.println(orderList);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        model.addAttribute("orderList", pageInfo);
        return "myOrders";
    }

    @ResponseBody
    @RequestMapping(value = "/generateOrder", method = RequestMethod.POST)
    public String generateOrder(HttpSession session, String contactName, String contactPhone, String contactAddress, String items) throws Exception {
        Customer customer = customerService.queryByCustomerId(((Customer) session.getAttribute("customer")).getCustomerId());
        List<OrderBookVO> list = JSONArray.parseArray(items, OrderBookVO.class);
        BigDecimal totalPrice = new BigDecimal(0.00);
        Orders orders = new Orders();
        OrderBook orderBook = new OrderBook();
        Date date = new Date();
        DateFormat formater = new SimpleDateFormat("YYYYMMDD");
        // formater.format(date);
        String orderId = formater.format(date) + (int) (Math.random() * 900 + 100);
        orders.setOrderId(orderId);
        orders.setCustomerId(customer.getCustomerId());
        orders.setContactName(contactName);
        orders.setContactPhone(contactPhone);
        orders.setContactAddress(contactAddress);
        List<OrderBook> orderBookList = new ArrayList<>();
        for (OrderBookVO orderBookVO : list) {
            //System.out.println("=======" + orderBookVO);
            Book book = bookService.queryByBookId(orderBookVO.getBookId());
            totalPrice = totalPrice.add(book.getBookPrice().multiply(new BigDecimal(orderBookVO.getNum())));
            orderBook.setBook(book);
            orderBook.setNum(orderBookVO.getNum());
            orderBook.setOrderId(orderId);
            orderBookList.add(orderBook);
        }
        orders.setTotalPrice(totalPrice);
        orderService.generateOrder(orders);
        orderBookService.addOrderBooks(orderBookList);

       // removeFromCartByIds();
// System.out.println(orders);
//        Book book = bookService.queryByBookId(items.getBookId());


//        BookCart bookCart = BookCartUtils.getBookCart(session);
//        Customer customer = customerService.queryByCustomerId(((Customer)session.getAttribute("customer")).getCustomerId());
//        Order order = new Order();
//        Collection<BookCartItem> bookCartItems =  bookCart.getBooks().values();
//        List<OrderBook> orderBookList = new ArrayList<>();
//
//        for (BookCartItem bookCartItem:bookCartItems){
//            OrderBook orderBook=new OrderBook();
//            orderBook.setId(bookCartItem.getBookCartItemId());
//            orderBook.setNum(bookCartItem.getNum());
//            orderBook.setBook(bookCartItem.getBook());
//            orderBookList.add(orderBook);
//        }
//
//        PropertyUtils.copyProperties(order, contact);
//        order.setTotalPrice(bookCart.getTotalMoney());
//        order.setCustomer(customer);
//        order.setOrderBookList(orderBookList);
        //Cart cart = new Cart();
        return "myOrders";

    }


}
