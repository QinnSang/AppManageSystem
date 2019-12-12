package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Menu;
import service.MenuService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;
    @RequestMapping("/showAllMenu")
    public String showAllMenu(Model model){
        List<Menu> menuList=menuService.findAllMenu();
        model.addAttribute("menuList", menuList);
        return "modules/sys/menu";
    }

}
