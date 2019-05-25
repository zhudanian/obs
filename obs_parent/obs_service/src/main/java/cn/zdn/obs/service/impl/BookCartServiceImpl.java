package cn.zdn.obs.service.impl;

import cn.zdn.obs.cart.BookCart;
import cn.zdn.obs.dao.BookCartDao;
import cn.zdn.obs.dao.BookDao;
import cn.zdn.obs.model.Book;
import cn.zdn.obs.model.BookCartItem;
import cn.zdn.obs.service.BookCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BookCartServiceImpl implements BookCartService {

    @Autowired
    private BookDao bookDao;

   @Autowired
   private BookCartDao bookCartDao;

    @Override
    public boolean addToCart(BookCart bookCart, Integer bookId ,Integer num) {
        Book book = bookDao.select(bookId);
        if (book != null) {
            bookCart.addBookToCart(book, num);
            return true;

        }
        return false;
    }

    @Override
    public void addToDB(BookCart bookCart) {

    }

    @Override
    public void removeFromCartById(BookCart bookCart,Integer bookId) {
        bookCart.removeBookItem(bookId);
    }

    @Override
    public void changeNum(BookCart bookCart, Integer bookId, Integer num) {
        bookCart.updateBookNum(bookId,num);
    }

    @Override
    public void clearCart(BookCart bookCart) {
        bookCart.clear();
    }

    @Override
    public List<BookCartItem> queryCartByCustomerId(Integer customerId) {
        List<BookCartItem> bookCartItem = bookCartDao.selectCartByCustomerId(customerId);
        System.out.println(bookCartItem);
        return bookCartItem;
    }


}
