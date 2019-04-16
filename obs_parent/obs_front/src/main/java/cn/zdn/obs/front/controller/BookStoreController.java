package cn.zdn.obs.front.controller;

import cn.zdn.obs.cart.ShoppingCart;
import cn.zdn.obs.constants.Constant;
import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.front.cart.ShoppingCartUtils;
import cn.zdn.obs.model.Book;
import cn.zdn.obs.model.BookType;
import cn.zdn.obs.params.BookParam;
import cn.zdn.obs.service.BookService;
import cn.zdn.obs.service.BookTypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

@Controller
@RequestMapping("/front/bookstore")
public class BookStoreController {

    @Autowired
    private BookTypeService bookTypeService;
    @Autowired
    private BookService bookService;

    @RequestMapping("/showBookstore")
    public String showBookstore(Model model) {
        List<Book> hotBooks = bookService.queryByHot();
        model.addAttribute("hotBooks", hotBooks);
        List<Book> newBooks = bookService.queryNewBook();
        model.addAttribute("newBooks", newBooks);
        return "bookstore";
    }

    //sideBar
    @ModelAttribute("bookTypeList")
    public List<BookType> queryEnable() {
        List<BookType> bookTypeList = bookTypeService.queryEnable(Constant.BOOK_TYPE_ENABLE);
        // System.out.println(bookTypeList);
        return bookTypeList;
    }




    //按Id查询：显示修改和编辑
    @RequestMapping("/queryByBookId")
    @ResponseBody
    public ResponseResult queryByBookId(Integer bookId) {
        Book book = bookService.queryByBookId(bookId);
        return ResponseResult.success(book);
    }

    @RequestMapping("queryByInput")
    public List<Book> queryByInput(String inputString) {
        List<Book> bookList = bookService.queryByInput(inputString);
        //System.out.println(bookList);
        return bookList;
    }

    @RequestMapping("/showPic")
    public void showPic(String image, OutputStream out) throws IOException {

        //将http请求读取为流
        URL url = new URL(image);
        URLConnection urlConnection = url.openConnection();
        InputStream is = urlConnection.getInputStream();

        BufferedOutputStream bos = new BufferedOutputStream(out);

        //创建缓冲字节流
        //将输入流写入输出流
        byte[] data = new byte[4096];
        int size = is.read(data);
        while (size != -1) {
            bos.write(data, 0, size);
            size = is.read(data);
        }

        //关闭这些流
        is.close();
        bos.flush();
        bos.close();
    }

}
