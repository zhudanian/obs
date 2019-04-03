package cn.zdn.obs.backend.controller;

import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.model.Comment;
import cn.zdn.obs.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/backend/commentManager")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @RequestMapping("/queryAll")
    public String queryAll(Integer pageNum, Model model) {
        PageHelper.startPage(pageNum);
        List<Comment> comments = commentService.queryAll();
        PageInfo<Comment> pageInfo = new PageInfo<>(comments);
        model.addAttribute("comment", pageInfo);
        return "commentManager";
    }


    //按Id查询：显示修改和编辑
    @RequestMapping("/queryByCommentId")
    @ResponseBody
    public ResponseResult queryByCommentId(Integer commentId) {
        Comment comment = commentService.queryByCommentId(commentId);
        return ResponseResult.success(comment);
    }

    //修改
    @RequestMapping("/modify")
    @ResponseBody
    public ResponseResult modify(Comment comment) {
        Integer res = commentService.modify(comment);
        if (res > 0) {
            return ResponseResult.success("添加成功！");
        } else {
            return ResponseResult.fail("添加失败!");
        }

    }

    //删除书籍
    @RequestMapping("/removeByBookId")
    @ResponseBody
    public ResponseResult removeByCommentId(Integer commentId) {
        Integer res = commentService.remove(commentId);
        if (res > 0) {
            return ResponseResult.success("删除成功！");
        } else {
            return ResponseResult.fail("删除失败!");
        }
    }

    //添加书籍
    @RequestMapping("/add")
    @ResponseBody
    public ResponseResult add(Comment comment) {
        Integer res = commentService.add(comment);
        if (res > 0) {
            return ResponseResult.success("添加成功！");
        } else {
            return ResponseResult.fail("添加失败!");
        }
    }

}
