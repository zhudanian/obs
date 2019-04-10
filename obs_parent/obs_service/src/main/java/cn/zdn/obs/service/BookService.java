package cn.zdn.obs.service;

import cn.zdn.obs.cart.ShoppingCart;
import cn.zdn.obs.dto.BookDto;
import cn.zdn.obs.exceptions.FileUploadException;
import cn.zdn.obs.model.Book;
import cn.zdn.obs.params.BookParam;

import java.io.OutputStream;
import java.util.List;

public interface BookService {

    Book queryByBookId(Integer bookId);

    List<Book> queryAll();

    Integer remove(Integer bookId);

    List<Book> queryByBookParam(BookParam bookParam);

    void add(BookDto bookDto)throws FileUploadException;

    Integer modify(Book book);

    Book checkBookName(String bookName);

    List<Book> queryByHot();

    List<Book> queryNewBook();

    boolean addToCart(Integer bookId, ShoppingCart bookItem);

    List<Book> queryByInput(String inputString);

    void getBookImage(String path, OutputStream out);
}
