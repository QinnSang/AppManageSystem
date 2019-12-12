package controller;

import com.github.pagehelper.PageInfo;
import dto.AppInfoDto;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pojo.AppCategory;
import pojo.AppInfo;
import pojo.DataDictionary;
import pojo.DevUser;
import service.AppCategoryService;
import service.AppInfoService;
import service.DataDictionaryService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/app")
public class DevAppController {

    @Autowired
    private AppInfoService appInfoService;

    @Autowired
    private DataDictionaryService dataDictionaryService;

    @Autowired
    private AppCategoryService appCategoryService;

    @RequestMapping("/index")
    public String index(Model model, HttpSession session){
        DevUser devUser = (DevUser) SecurityUtils.getSubject().getPrincipal();
        Long devId=devUser.getId();
        session.setAttribute("devId",devId);
        AppInfoDto appInfoDto=new AppInfoDto();
        appInfoDto.setDevId(devId);
        //初次查询，所以需要设置pageNum和pageSize
//        appInfoDto.setPageNum(1);
//        appInfoDto.setPageSize(1);
        PageInfo<AppInfo> pageInfo=appInfoService.query(appInfoDto);
        model.addAttribute("pageInfo",pageInfo);
        togethre(model);
        return "app/index";
    }


    @RequestMapping("/query")
    public String query(@ModelAttribute AppInfoDto appInfoDto,Model model,HttpSession session){
        Object devId = session.getAttribute("devId");
        if(devId!=null){
            appInfoDto.setDevId((Long) devId);
            PageInfo<AppInfo> pageInfo=appInfoService.query(appInfoDto);
            model.addAttribute("pageInfo",pageInfo);
            togethre(model);
            //保存查询条件
            model.addAttribute("appInfoDto",appInfoDto);
            return "app/index";
        }else{
            return "redirect:/";
        }
    }

    @RequestMapping("/index2")
    public String index2(Model model){
        togethre(model);
        return "app/index2";

    }

    @RequestMapping("/query2")
    @ResponseBody
    public Map<String,Object> query2(@ModelAttribute AppInfoDto appInfoDto, Model model, HttpSession session){
        Object devId = session.getAttribute("devId");
        appInfoDto.setDevId((Long) devId);
        PageInfo<AppInfo> pageInfo=appInfoService.query(appInfoDto);
        Map<String,Object> tableData =new HashMap<>();
        //这是layui要求返回的json数据格式
        tableData.put("code", 0);
        tableData.put("msg", "");
        //将全部数据的条数作为count传给前台（一共多少条）
        tableData.put("count", pageInfo.getTotal());
        //将分页后的数据返回（每页要显示的数据）
        tableData.put("data", pageInfo);

        togethre(model);

        //返回给前端
        return tableData;
    }


    public void togethre(Model model){
        //查询所有平台
        List<DataDictionary> appFlatforms=dataDictionaryService.queryAllFlatform();
        //查询所有APP的状态
        List<DataDictionary> appStatus=dataDictionaryService.queryAllAppStatus();
        //查询一级分类
        List<AppCategory> level1s=appCategoryService.queryAllLevel1();
        model.addAttribute("appStatus",appStatus);
        model.addAttribute("appFlatforms",appFlatforms);
        model.addAttribute("level1s",level1s);
    }

    @RequestMapping("/toAdd")
    public String toAdd(Model model){
        togethre(model);
        return "app/add";
    }

    @RequestMapping("/add")
    public String add(@ModelAttribute AppInfo appInfo, HttpSession session){
        Long devId = (Long)session.getAttribute("devId");
        boolean addFlag=appInfoService.add(appInfo,devId);
        return "forward:index/"+devId;
    }

    @RequestMapping("/toEdit/{appId}")
    public String toEdit(@PathVariable("appId")Long appId,Model model){
        AppInfo appInfo=appInfoService.queryByAppId(appId);
        model.addAttribute("appInfo",appInfo);
        togethre(model);
        return "app/edit";
    }

    @RequestMapping("/edit")
    public String edit(AppInfo appInfo,HttpSession session){
        Long devId= (Long) session.getAttribute("devId");
        boolean updateFlag=appInfoService.updateSingleByAppId(appInfo,devId);
        return "redirect:/app/index/"+devId;
    }

    @RequestMapping("/queryAppDetail/{appId}")
    public String queryAppDetail(@PathVariable("appId")Long appId,HttpSession session,Model model){
        AppInfo appInfo=appInfoService.queryAppDetail(appId);
        model.addAttribute("appInfo",appInfo);
        return "app/appDetail";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public boolean delete(@RequestParam("appId")Long appId, HttpSession session ){
        Long devId = (Long)session.getAttribute("devId");
        boolean deteleFlag=appInfoService.delete(appId);
        return deteleFlag;
    }

}
