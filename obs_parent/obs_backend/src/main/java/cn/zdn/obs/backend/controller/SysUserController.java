package cn.zdn.obs.backend.controller;

import cn.zdn.obs.params.SysUserParam;
import cn.zdn.obs.constants.Constant;
import cn.zdn.obs.constants.ResponseResult;
import cn.zdn.obs.model.SysUser;
import cn.zdn.obs.service.SysUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backend/sysUserManager")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    /*   //在执行该controller下的任意方式之前执行
    @ModelAttribute("roles")
    public List<Role> loadRoles() {
        return roleService.findAll();
    }*/


    @RequestMapping("/main")
    public String main() {
        return "main";
    }

    /*@RequestMapping("/login")
    public String login(String sysLoginName, String sysPassword, HttpSession session, Model model) {
        SysUser sysUser = sysUserService.queryBySysLoginNameAndSysPassword(sysLoginName, sysPassword);
        if (null != sysUser) {
            //将该sysUser存入session作用域
            session.setAttribute("sysUser", sysUser);
            //返回视图名称,通过视图解析器，将该名称拼接成完整的页面路径，从而实现页面的返回
            return "main";
        } else {
            model.addAttribute("errorMsg", "用户名或密码错误");
            return "login";
        }
    }
*/

    @RequestMapping("/login")
    public String login(String sysLoginName, String sysPassword, HttpSession session, Model model) {
        SysUser sysUser = sysUserService.queryBySysLoginNameAndSysPassword(sysLoginName, sysPassword);
        if (null != sysUser) {
            model.addAttribute("errorMsg", "用户名或密码错误");
            return "login";
        } else {

            //将该sysUser存入session作用域
            session.setAttribute("sysUser", sysUser);
            //返回视图名称,通过视图解析器，将该名称拼接成完整的页面路径，从而实现页面的返回
            return "main";
        }
    }

    @RequestMapping("/add")
    @ResponseBody
    public ResponseResult add(SysUser sysUser) {
        Integer res = sysUserService.add(sysUser);
        if (res > 0) {
            return ResponseResult.success("添加成功");
        } else {
            return ResponseResult.fail("添加失败");
        }
    }

    @RequestMapping("/modify")
    @ResponseBody
    public ResponseResult modify(Integer sysId) {

        SysUser sysUser = sysUserService.queryBySysId(sysId);

        Integer res = sysUserService.modify(sysId, sysUser);
        if (res > 0) {
            return ResponseResult.success("修改成功");
        } else {
            return ResponseResult.fail("修改失败");
        }

    }

    @RequestMapping("/modifyStatus")
    @ResponseBody
    public ResponseResult modifyStatus(int id) {
        Integer res = sysUserService.modifyStatus(id);
        if (res > 0) {
            return ResponseResult.success("更新成功");
        } else {
            return ResponseResult.fail("更新失败");
        }

    }


    //校验该登录账号是否已经存在
    @RequestMapping("/checkName")
    @ResponseBody
    //自动将被校验的值注入
    public Map<String, Object> checkName(String loginName) {

        Map<String, Object> map = new HashMap<>();
        boolean res = sysUserService.checkName(loginName);
        //如果不存在该用户名，可用
        if (res) {
            map.put("valid", true);
        } else {
            map.put("valid", false);
            map.put("message", "账号【" + loginName + "】已经存在");
        }
        return map;

    }


    @RequestMapping("/queryAll")
    public String queryAll(Integer pageNum, Model model) {
        if (ObjectUtils.isEmpty(pageNum)) {
            pageNum = Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<SysUser> sysUserList = sysUserService.queryAll();
        PageInfo<SysUser> pageInfo = new PageInfo<>(sysUserList);
        model.addAttribute("sysUser", pageInfo);
        return "sysUserManager";
    }

    @RequestMapping("/queryBySysUserParams")
    public String queryByParams(SysUserParam sysUserParam, Integer pageNum, Model model) {
        if (ObjectUtils.isEmpty(pageNum)) {
            pageNum = Constant.PAGE_NUM;
        }
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<SysUser> sysUsers = sysUserService.queryBySysUserParams(sysUserParam);
        PageInfo<SysUser> pageInfo = new PageInfo<>(sysUsers);
        model.addAttribute("data", pageInfo);
        model.addAttribute("sysUserParam", sysUserParam);
        return "sysUserManager";

    }

}
