package cn.zdn.obs.front.cart;

import cn.zdn.obs.cart.BookCart;
import javax.servlet.http.HttpSession;

public class BookCartUtils {

    /**
     * 从session作用域中获取购物车对象,若session中还没有该购物车对象，创建一个新的对象，
     * 放入session作用域，若有，直接返回该购物车对象(单例)
     */

    public static BookCart getBookCart(HttpSession session){
        BookCart bookCart = (BookCart) session.getAttribute("bookCart");
        if(bookCart==null){
            bookCart  = new BookCart();
            session.setAttribute("bookCart",bookCart);
        }
        return  bookCart;
    }


}
