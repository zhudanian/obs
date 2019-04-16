package cn.zdn.obs.backend.controller;

import cn.zdn.obs.backend.vo.BookVO;
import cn.zdn.obs.constants.Constant;
import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.dto.BookDto;
import cn.zdn.obs.model.Book;
import cn.zdn.obs.model.BookType;
import cn.zdn.obs.params.BookParam;
import cn.zdn.obs.service.BookService;
import cn.zdn.obs.service.BookTypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backend/bookManager")
public class BookController {
    @Autowired
    private BookService bookService;

    @Autowired
    private BookTypeService bookTypeService;

    @RequestMapping("/checkBookName")
    @ResponseBody
    public Map<String, Object> checkBookName(String bookName) {
        Map<String, Object> map = new HashMap<>();
        Book book = bookService.checkBookName(bookName);
        System.out.println(book);
        if (null != book) {
            //当valid值为true,不输出消息，为false,输出message所对应的值
            map.put("valid", false);
            map.put("message", "书" + bookName + "已经存在");
        } else {
            map.put("valid", true);
        }
        return map;
    }

    //查询所有书籍
    @RequestMapping("/queryAll")
    public String queryAll(Integer pageNum, Model model) {
        if (ObjectUtils.isEmpty(pageNum)) {
            pageNum = Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Book> books = bookService.queryAll();
        PageInfo<Book> pageInfo = new PageInfo<>(books);
        model.addAttribute("book", pageInfo);
        return "bookManager";
    }

    //按条件查询书籍
    @RequestMapping("/queryByBookParam")
    public String queryByBookParam(BookParam bookParam, Integer pageNum, Model model) {
        if (ObjectUtils.isEmpty(pageNum)) {
            pageNum = Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Book> books = bookService.queryByBookParam(bookParam);
        PageInfo<Book> pageInfo = new PageInfo<>(books);
        model.addAttribute("book", pageInfo);
        return "bookManager";
    }

    //在修改模态框和添加模态框的下拉列表中显示启用状态下的商品类型名称
    @ModelAttribute("bookTypes")
    //执行该controller下所有请求,先执行该方法，值存入key为bookTypes中,默认作用相当于request
    public List<BookType> queryEnable() {
        return bookTypeService.queryEnable(Constant.BOOK_TYPE_ENABLE);

    }

    //按Id查询：显示修改和编辑
    @RequestMapping("/queryByBookId")
    @ResponseBody
    public ResponseResult queryByBookId(Integer bookId) {
        Book book = bookService.queryByBookId(bookId);
        return ResponseResult.success(book);
    }

    //修改
    @RequestMapping("/modify")
    @ResponseBody
    public ResponseResult modify(BookVO bookVO) {
        System.out.println(bookVO);
        try {
            Book book = new Book();
            PropertyUtils.copyProperties(book, bookVO);
            System.out.println(book);
            BookType bookType = new BookType();
            bookType.setBookTypeId(bookVO.getBookTypeId());
            book.setBookType(bookType);
            bookService.modify(book);
            return ResponseResult.success("修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseResult.fail("修改失败!");
        }

    }

    //删除书籍
    @RequestMapping("/removeByBookId")
    @ResponseBody
    public ResponseResult removeByBookId(Integer bookId) {
        Integer res = bookService.remove(bookId);
        if (res > 0) {
            return ResponseResult.success("删除成功！");
        } else {
            return ResponseResult.fail("删除失败!");
        }
    }

    //获取图片
    /*
    逻辑：根据图片的路径，转成字节流，----》拷贝到输出流
     */
    @RequestMapping("/getImg")
    public void getImg(String path,OutputStream out){

        bookService.getBookImage(path,out);

    }

    //添加书籍
    @RequestMapping("/add")
    public String add(BookVO bookVO, Integer pageNum, Model model) {
        //System.out.println(111);
        //return "bookManager";

        //获取图片存放的物理路径
        //String uploadPath = session.getServletContext().getRealPath("/WEB-INF/upload");
        //将VO转换成DTO
        BookDto bookDto = new BookDto();
        System.out.println(bookVO);
        //bookDto.setName(bookVO.getName());
        //bookDto.setPrice(bookVO.getPrice());
        try {
            //将vo中属性值对应的拷贝到dto的相关属性中(属性必须一一对应),获取部分值
            PropertyUtils.copyProperties(bookDto, bookVO);
            //获取原始文件名
            bookDto.setFileName(bookVO.getFile().getOriginalFilename());
            bookDto.setInputStream(bookVO.getFile().getInputStream());
            //bookDto.setUploadPath(uploadPath);
            bookService.add(bookDto);
            model.addAttribute("successMsg", "添加成功");

        } catch (Exception e) {
            model.addAttribute("errorMsg", e.getMessage());
        }

        //返回列表页面
        return "forward:queryAll?pageNum"+pageNum;//转发到findAll请求
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
        int size=0;
        size = is.read(data);
        while (size!=-1){
            bos.write(data,0,size);
            size=is.read(data);
        }

        //关闭这些流
        is.close();
        bos.flush();
        bos.close();
    }



}

