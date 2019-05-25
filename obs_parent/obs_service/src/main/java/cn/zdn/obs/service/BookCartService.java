package cn.zdn.obs.service;

import cn.zdn.obs.cart.BookCart;
import cn.zdn.obs.model.BookCartItem;

import java.util.List;
import java.util.Map;

public interface BookCartService {

    boolean addToCart(BookCart bookCart, Integer bookId, Integer num);

    void addToDB(BookCart bookCart);

    void removeFromCartById(BookCart bookCart, Integer bookId);

    void changeNum(BookCart bookCart, Integer bookId, Integer num);

    void clearCart(BookCart bookCart);

    List<BookCartItem> queryCartByCustomerId(Integer customerId);
}
