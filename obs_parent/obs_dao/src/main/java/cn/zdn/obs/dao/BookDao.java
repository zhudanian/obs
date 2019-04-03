package cn.zdn.obs.dao;


import cn.zdn.obs.model.Book;
import cn.zdn.obs.params.BookParam;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDao {

    List<Book> selectByBookParam(@Param("bookParam") BookParam bookParam);

    Object select(Integer bookId);

    List<Book> selectAll();

    Integer update(Book book);

    Integer delete(Integer bookId);

    Integer insert(Book book);

    Book selectByBookName(String bookName);
}
