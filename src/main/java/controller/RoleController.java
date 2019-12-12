package controller;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Menu;
import pojo.Role;
import service.MenuService;
import service.RoleService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;


    @RequestMapping("/showAllRole")
    public String showAllRole(Model model){
        List<Role> roleList=roleService.queryAllRole();
        model.addAttribute("roleList",roleList);
        return "modules/sys/role";
    }

    @RequestMapping("/toAddRole")
    public String toAddRole(Model model){
        return "modules/sys/form";
    }

    @RequestMapping("/addRole")
    public String addRole(Model model){
        List<Menu> menuList=menuService.findAllMenu();
        model.addAttribute("menuList", menuList);
        return "modules/sys/roleForm";
    }

    @RequestMapping("/save")
    public String save(@ModelAttribute Role role, Model model){
        roleService.saveRole(role);
        return "modules/sys/role";
    }

    @RequestMapping(value="/export",method = RequestMethod.GET)
    @ResponseBody
    public  void export(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String sheetName="角色列表.xlsx";
        if(sheetName!=""){
            response.reset(); //清除buffer缓存
            Map<String,Object> map=new HashMap<String,Object>();
            // 指定下载的文件名，浏览器都会使用本地编码，即GBK，浏览器收到这个文件名后，用ISO-8859-1来解码，然后用GBK来显示
            // 所以我们用GBK解码，ISO-8859-1来编码，在浏览器那边会反过来执行。
            response.setHeader("Content-Disposition", "attachment;filename=" + new String(sheetName.getBytes("GBK"),"ISO-8859-1"));
            response.setContentType("application/vnd.ms-excel;charset=UTF-8");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            XSSFWorkbook workbook=null;
            //导出Excel对象
            workbook = roleService.exportExcelInfo(sheetName);
            OutputStream output;
            try {
                output = response.getOutputStream();
                BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
                bufferedOutPut.flush();
                workbook.write(bufferedOutPut);
                bufferedOutPut.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
