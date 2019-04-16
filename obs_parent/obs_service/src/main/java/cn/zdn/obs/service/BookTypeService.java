package cn.zdn.obs.service;

import cn.zdn.obs.model.BookType;

import java.util.List;

public interface BookTypeService {

    BookType queryByBookTypeId(Integer bookTypeId);

    List<BookType> queryAll();

    Integer add(BookType bookType);

    Integer remove(Integer bookTypeId);

    Integer modify(BookType bookType);

    Integer modifyStatus(Integer bookTypeId);

    List<BookType> queryEnable(Integer bookTypeEnable);

    boolean checkBookTypeName(String bookTypeName);
}
