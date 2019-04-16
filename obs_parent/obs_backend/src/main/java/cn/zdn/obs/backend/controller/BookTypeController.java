package cn.zdn.obs.backend.controller;

import cn.zdn.obs.constants.Constant;
import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.model.BookType;
import cn.zdn.obs.service.BookTypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backend/bookTypeManager")
public class BookTypeController {
    @Autowired
    private BookTypeService bookTypeService;

    @RequestMapping("/queryAll")
    public String queryAll(Model model, Integer pageNum) {

        if (ObjectUtils.isEmpty(pageNum)) {
            pageNum = Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<BookType> bookTypes = bookTypeService.queryAll();
        PageInfo<BookType> pageInfo = new PageInfo<>(bookTypes);
        model.addAttribute("bookType", pageInfo);

        return "bookTypeManager";
    }


    //按Id查询：显示修改和编辑
    @RequestMapping("/queryByBookTypeId")
    @ResponseBody
    public ResponseResult queryByBookTypeId(Integer bookTypeId) {
        BookType bookType = bookTypeService.queryByBookTypeId(bookTypeId);
        return ResponseResult.success(bookType);
    }

    //修改类型状态

    @RequestMapping("/modifyStatus")
    @ResponseBody
    public ResponseResult modifyStatus(Integer id) {
        Integer res = bookTypeService.modifyStatus(id);
        if (res > 0) {
            return ResponseResult.success("修改成功！");
        } else {
            return ResponseResult.fail("修改失败!");
        }

    }

    //添加书籍类型

    /*  //删除书籍类型
      @RequestMapping("/removeByBookTypeId")
      @ResponseBody
      public ResponseResult removeByBookTypeId(Integer bookTypeId) {
          Integer res = bookTypeService.remove(bookTypeId);
          if (res > 0) {
              return ResponseResult.success("删除成功！");
          } else {
              return ResponseResult.fail("删除失败!");
          }
      }*/

    //修改类型名称
    @RequestMapping("/modify")
    @ResponseBody
    public ResponseResult modify(BookType bookType) {
        Integer res = bookTypeService.modify(bookType);
        if (res == 1) {
            return ResponseResult.success("修改成功！");
        } else {
            return ResponseResult.fail("修改失败!");
        }

    }

    @RequestMapping("/add")
    @ResponseBody
    public ResponseResult add(BookType bookType) {
        Integer res = bookTypeService.add(bookType);
        if (res == 1) {
            return ResponseResult.success("添加成功");
        } else {
            return ResponseResult.fail("添加失败");

        }
    }

    @RequestMapping("/checkBookTypeName")
    @ResponseBody
    //自动将被校验的值注入
    public Map<String, Object> checkBookTypeName(String bookTypeName) {

        Map<String, Object> map = new HashMap<>();
        boolean res = bookTypeService.checkBookTypeName(bookTypeName);
        //如果不存在该标题，可用
        if (res) {
            map.put("valid", true);
        } else {
            map.put("valid", false);
            map.put("message", "书籍类型【" + bookTypeName + "】已经存在");
        }
        return map;

    }
}
