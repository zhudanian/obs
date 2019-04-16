package cn.zdn.obs.backend.controller;

import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.model.Comment;
import cn.zdn.obs.model.Customer;
import cn.zdn.obs.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/backend/commentManager")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/queryAll")
    public String queryAll(Integer pageNum, Model model,HttpSession httpSession) {
        Customer customer =(Customer)httpSession.getAttribute("customer");
        Integer customerId=customer.getCustomerId();
        PageHelper.startPage(pageNum);
        List<Comment> comments = commentService.queryAll(customerId);
        PageInfo<Comment> pageInfo = new PageInfo<>(comments);
        model.addAttribute("comment", pageInfo);
        return "commentManager";
    }

}
