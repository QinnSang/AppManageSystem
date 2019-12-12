package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.NewStudent;
import pojo.sorceResult;
import service.NewStudentInfoService;

import java.util.ArrayList;
import java.util.List;


@Controller
public class EchartsController {
    @Autowired
    private NewStudentInfoService newStudentInfoService;

    //首页柱状图
    @RequestMapping(value = "/hello")
    @ResponseBody
    public List<NewStudent> page() {
        //list获取sql数据
        List<NewStudent> newStudents = newStudentInfoService.getAllStudent();
        System.out.println("hello页面请求数据:" + newStudents.size());
        System.out.println("柱状图请求数据:" +newStudents.toString());
        return newStudents;
    }

    @RequestMapping(value = "/getScore")
    @ResponseBody
    public List<Integer> getScore() {
        List<NewStudent> newStudents = newStudentInfoService.getAllStudent();
        List<Integer> scores = null;
        for (NewStudent newStudent : newStudents) {
            scores.add(newStudent.getScore());
        }
        System.out.println("饼图请求数据:" +scores.toString());
        return scores;
    }

    @RequestMapping(value = "/myeCharts")
    public String myeCharts() {
        return "Hello";
    }

    @RequestMapping(value = "/getPieCharts")
    public String getPieCharts() {
        return "PieCharts";
    }

    @RequestMapping(value = "/getData")
    @ResponseBody
    public List<sorceResult> getData() {
        List<NewStudent> students = newStudentInfoService.getAllStudent();

        List<sorceResult> results = new ArrayList<sorceResult>();
        for (NewStudent newStudent : students) {
            // 把学生的成绩和姓名封装到一个result
            sorceResult result = new sorceResult(newStudent.getScore(), newStudent.getName());
            results.add(result);
        }
        System.out.println("json数据:"+results);
        return results;
    }
}

