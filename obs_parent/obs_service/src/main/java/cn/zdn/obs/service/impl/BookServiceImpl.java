package cn.zdn.obs.service.impl;

import cn.zdn.obs.cart.ShoppingCart;
import cn.zdn.obs.dao.BookDao;
import cn.zdn.obs.dto.BookDto;
import cn.zdn.obs.exceptions.FileUploadException;
import cn.zdn.obs.ftp.FtpConfig;
import cn.zdn.obs.ftp.FtpUtils;
import cn.zdn.obs.model.Book;
import cn.zdn.obs.model.BookType;
import cn.zdn.obs.params.BookParam;
import cn.zdn.obs.service.BookService;
import cn.zdn.obs.utils.StringUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StreamUtils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;

    @Autowired
    private FtpConfig ftpConfig;

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
    public List<Book> queryByInput(String inputString) {
        return bookDao.selectByInput(inputString);

    }

    @Override
    public void getBookImage(String path, OutputStream out) {
        try {
            StreamUtils.copy(new FileInputStream(path),out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Integer remove(Integer bookId) {
        return bookDao.delete(bookId);
    }

    @Override
    public void add(BookDto bookDto) throws FileUploadException {
        //获取文件名
        //处理该文件名，通过一种方式获取一个尽可能不冲突的文件名
        String fileName = StringUtils.renameFileName(bookDto.getFileName());
        //String filePath = bookDto.getUploadPath() + "\\" + fileName;

        //获取ftp服务器上的二级目录
        String picSavePath ="/images";


        String filePath = "";
        //上传文件
        try {
            //StreamUtils.copy(bookDto.getInputStream(), new FileOutputStream(filePath));
            filePath = FtpUtils.pictureUploadByConfig(ftpConfig, fileName, picSavePath, bookDto.getInputStream());
        } catch (IOException e) {
            throw new FileUploadException("文件上传失败:" + e.getMessage());
        }

        //将相关值保存到数据库
        //dto--->pojo
        Book book = new Book();
        try {
            PropertyUtils.copyProperties(book, bookDto);
            book.setBookImage(filePath);
            BookType bookType = new BookType();
            bookType.setBookTypeId(bookDto.getBookTypeId());
            book.setBookType(bookType);
            book.setOnSaleTime(new Date());
            System.out.println(book);
            bookDao.insert(book);


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<Book> queryByBookParam(BookParam bookParam) {

        return bookDao.selectByBookParam(bookParam);
    }




}
