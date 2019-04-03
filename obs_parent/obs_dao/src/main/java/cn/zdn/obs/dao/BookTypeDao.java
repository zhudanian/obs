package cn.zdn.obs.dao;


import cn.zdn.obs.model.BookType;

import java.util.List;

public interface BookTypeDao{


    BookType select(Integer bookTypeId);

    List<BookType> selectAll();

    Integer insert(BookType bookType);

    Integer update(BookType bookType);

    Integer delete(Integer bookTypeId);

    Integer updateStatus(Integer bookTypeId);

    List<BookType> selectByBookTypeState(Integer bookTypeEnable);
}
