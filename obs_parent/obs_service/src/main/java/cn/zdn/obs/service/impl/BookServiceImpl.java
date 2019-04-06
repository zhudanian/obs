package cn.zdn.obs.service.impl;

import cn.zdn.obs.cart.ShoppingCart;
import cn.zdn.obs.dao.BookDao;
import cn.zdn.obs.model.Book;
import cn.zdn.obs.params.BookParam;
import cn.zdn.obs.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;

    @Override
    public Book queryByBookId(Integer bookId) {
        return bookDao.select(bookId);
    }

    @Override
    public List<Book> queryAll() {
        return bookDao.selectAll();
    }

    @Override
    public Integer modify(Book book) {
        return bookDao.update(book);
    }

    @Override
    public Book checkBookName(String bookName) {
        return bookDao.selectByBookName(bookName);

    }

    @Override
    public List<Book> queryByHot() {
        return bookDao.selectByHot();
    }

    @Override
    public List<Book> queryNewBook() {
        return bookDao.selectNewBook();
    }

    @Override
    public boolean addToCart(Integer bookId, ShoppingCart bookItem) {
        Book book = bookDao.select(bookId);
        if(book!=null){
            bookItem.addBook(book);
            return true;

        }
        return false;
    }

    @Override
    public List<Book> queryByInput(String inputString) {
        return bookDao.selectByInput(inputString);

    }

    @Override
    public Integer remove(Integer bookId) {
        return bookDao.delete(bookId);
    }

    @Override
    public Integer add(Book book) {
        return bookDao.insert(book);
    }

    @Override
    public List<Book> queryByBookParam(BookParam bookParam) {
        List<Book> books = bookDao.selectByBookParam(bookParam);
        return books;
    }


}
