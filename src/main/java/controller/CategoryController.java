package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.AppCategory;
import service.AppCategoryService;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private AppCategoryService appCategoryService;

    @RequestMapping("/queryLevel2ByLevel1id/{level1id}")
    @ResponseBody
    public List<AppCategory> queryLevel2ByLevel1id(@PathVariable("level1id") Long level1id, Model model){
        List<AppCategory> categoryList=appCategoryService.queryLevel2ByLevel1id(level1id);
        return categoryList;
    }

    @RequestMapping("/queryLevel3ByLevel2id/{level2id}")
    @ResponseBody
    public List<AppCategory> queryLevel3ByLevel2id(@PathVariable("level2id") Long level2id, Model model){
        List<AppCategory> categoryList=appCategoryService.queryLevel3ByLevel2id(level2id);
        return categoryList;
    }
}
