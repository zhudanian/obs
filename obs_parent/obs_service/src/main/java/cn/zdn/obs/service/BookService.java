package cn.zdn.obs.service;

import cn.zdn.obs.cart.ShoppingCart;
import cn.zdn.obs.model.Book;
import cn.zdn.obs.params.BookParam;

import java.util.List;

public interface BookService {

    Book queryByBookId(Integer bookId);

    List<Book> queryAll();

    Integer remove(Integer bookId);

    List<Book> queryByBookParam(BookParam bookParam);

    Integer add(Book book);

    Integer modify(Book book);

    Book checkBookName(String bookName);

    List<Book> queryByHot();

    List<Book> queryNewBook();

    boolean addToCart(Integer bookId, ShoppingCart bookItem);

    List<Book> queryByInput(String inputString);
}
