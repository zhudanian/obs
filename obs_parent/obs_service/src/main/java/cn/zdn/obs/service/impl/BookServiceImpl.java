package cn.zdn.obs.service.impl;

import cn.zdn.obs.dao.BookDao;
import cn.zdn.obs.model.Book;
import cn.zdn.obs.params.BookParam;
import cn.zdn.obs.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;

    @Override
    public Book queryByBookId(Integer bookId) {
        return (Book)bookDao.select(bookId);
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
