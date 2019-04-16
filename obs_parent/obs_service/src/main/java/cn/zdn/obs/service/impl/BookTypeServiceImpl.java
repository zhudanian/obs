package cn.zdn.obs.service.impl;

import cn.zdn.obs.dao.BookTypeDao;
import cn.zdn.obs.model.BookType;
import cn.zdn.obs.service.BookTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class BookTypeServiceImpl implements BookTypeService {
    @Autowired
    private BookTypeDao bookTypeDao;

    @Override
    public BookType queryByBookTypeId(Integer bookTypeId) {

        return bookTypeDao.select(bookTypeId);
    }

    @Override
    public List<BookType> queryAll() {
        return bookTypeDao.selectAll();
    }

    @Override
    public Integer add(BookType bookType) {
        return bookTypeDao.insert(bookType);
    }

    @Override
    public Integer modify(BookType bookType) {
        return bookTypeDao.update(bookType);
    }

    @Override
    public Integer modifyStatus(Integer bookTypeId) {
        return bookTypeDao.updateStatus(bookTypeId);
    }

    @Override
    public List<BookType> queryEnable(Integer bookTypeEnable) {
        List<BookType> bookTypeList= bookTypeDao.selectByBookTypeState(bookTypeEnable);
        return bookTypeList;
    }

    @Override
    public boolean checkBookTypeName(String bookTypeName) {
        BookType bookType = bookTypeDao.selectByBookTypeName(bookTypeName);
        if(bookType!=null){
            return false;
        }
        return true;
    }

    @Override
    public Integer remove(Integer bookTypeId) {
        return bookTypeDao.delete(bookTypeId);
    }
}
