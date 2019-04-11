package cn.zdn.obs.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/front/cart")
public class CartController {

    @RequestMapping("/queryMyCart")
    public String showHomePage() {

        return "myCart";
    }
}
