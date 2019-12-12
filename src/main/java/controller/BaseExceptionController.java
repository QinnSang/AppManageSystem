package controller;

import exception.ServiceException;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

public abstract class BaseExceptionController {

    /**
     * 基于@ExceptionHandler的异常处理
     */
//    @ExceptionHandler
//    public String exception(HttpServletRequest request, Exception ex){
//        request.setAttribute("ex",ex);
//        //根据不同错误转向不同页面，即异常与View的对应关系
//        if(ex instanceof SQLException){
//            return "error/sql-error";
//            //自定义异常
//        } else if (ex instanceof ServiceException) {
//            return "error/my-error";
//            //未知错误
//        }else{
//            return "error/error";
//        }
//    }

}
