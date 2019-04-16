package cn.zdn.obs.backend.controller;

import cn.zdn.obs.exceptions.SysuserNotExistException;
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
import org.springframework.util.DigestUtils;
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


    @RequestMapping("/login")
    public String login(String sysLoginName, String sysPassword, HttpSession session, Model model) throws SysuserNotExistException {
        try {
            SysUser sysUser = sysUserService.queryBySysLoginNameAndSysPassword(sysLoginName, sysPassword);
            //将该sysuser存入session作用域
            session.setAttribute("sysUser", sysUser);
            //返回视图名称,通过视图解析器，将该名称拼接成完整的页面路径，从而实现页面的返回
            return "main";
        } catch (SysuserNotExistException e) {
            //e.printStackTrace();
            model.addAttribute("errorMsg", e.getMessage());
            return "login";
        }
    }

    @RequestMapping("/logout")
    @ResponseBody
    public void logout(HttpSession httpSession) {
        httpSession.invalidate();
    }

    @RequestMapping("/add")
    @ResponseBody
    public ResponseResult add(SysUser sysUser) {
        sysUser.setSysPassword(DigestUtils.md5DigestAsHex(sysUser.getSysPassword().getBytes()));
        Integer res = sysUserService.add(sysUser);
        if (res == 1) {
            return ResponseResult.success("添加成功");
        } else {
            return ResponseResult.fail("添加失败");
        }
    }

    @RequestMapping("/modify")
    @ResponseBody
    public ResponseResult modify(SysUser sysUser) {
        Integer res = sysUserService.modify(sysUser);
        if (res == 1) {
            return ResponseResult.success("修改成功");
        } else {
            return ResponseResult.fail("修改失败");
        }

    }

    @RequestMapping("/modifyStatus")
    @ResponseBody
    public ResponseResult modifyStatus(Integer sysId) {
        Integer res = sysUserService.modifyStatus(sysId);
        if (res == 1) {
            return ResponseResult.success("更新成功");
        } else {
            return ResponseResult.fail("更新失败");
        }

    }


    //校验该登录账号是否已经存在
    @RequestMapping("/checkSysLoginName")
    @ResponseBody
    //自动将被校验的值注入
    public Map<String, Object> checkSysLoginName(String sysLoginName, Integer sysId) {

        Map<String, Object> map = new HashMap<>();
        boolean res = sysUserService.checkSysLoginName(sysLoginName, sysId);
        //如果不存在该用户名，可用
        if (res) {
            map.put("valid", true);
        } else {
            map.put("valid", false);
            map.put("message", "账号【" + sysLoginName + "】已经存在");
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

    @RequestMapping("queryBySysId")
    @ResponseBody
    public ResponseResult queryBySysId(Integer sysId) {
        SysUser sysUser = sysUserService.queryBySysId(sysId);
        return ResponseResult.success(sysUser);
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
