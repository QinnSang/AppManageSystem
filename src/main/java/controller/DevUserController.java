package controller;

import com.wf.captcha.utils.CaptchaUtil;
import constant.StateType;
import exception.ServiceException;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.DevUser;
import service.DevUserService;
import service.RegisterValidateService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/dev")
public class DevUserController extends BaseExceptionController{

    @Autowired
    private DevUserService devUserService;

    @Autowired
    private RegisterValidateService registerValidateService;

    //验证码
    @RequestMapping("/captcha/{flag}")
    public void captcha( HttpServletRequest request, HttpServletResponse response, @PathVariable("flag")boolean flag) throws Exception {
        //刷新验证码
        if(flag){
            CaptchaUtil.clear(request);  // 清除session中的验证码
        }
        CaptchaUtil.out(request, response);
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "dev/register";
    }

    @RequestMapping("/register")
    public String register(@ModelAttribute DevUser devUser, Model model){
        StateType stateType=devUserService.register(devUser);
        if(stateType==null){
            registerValidateService.sendEmail(devUser);
            return "redirect:register_success";
        }
        else{
            model.addAttribute("stateType",stateType);
            return "dev/register";
        }
    }

    @RequestMapping("/activate/{devEmail}/{validateCode}")
    public String activate(Model model,@PathVariable("devEmail")String devEmail,@PathVariable("validateCode")String validateCode){
        try {
            registerValidateService.activateUser(devEmail,validateCode);
            return "redirect:/";
        } catch (ServiceException e) {
            model.addAttribute("ErrorMsg",e.getMessage());
        }
        return "dev/activateFailed";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "dev/login";
    }


    @RequestMapping("/login")
    public String login(@ModelAttribute DevUser devUser,String verCode,Boolean rememberMe, HttpSession session, Model model, HttpServletRequest request){
        StateType stateType=null;
        if (!CaptchaUtil.ver(verCode, request)) {
            CaptchaUtil.clear(request);
            // 清除session中的验证码
            stateType=StateType.getStateType(16);
        }else{
            Subject currentUser = SecurityUtils.getSubject();
            if (!currentUser.isAuthenticated()){
                //把用户名和密码封装为UsernamepasswordToken 对象
                UsernamePasswordToken token = new UsernamePasswordToken(devUser.getDevCode(),devUser.getDevPassword());
                //remember me
                if(rememberMe!=null)
                    token.setRememberMe(true);
                try{
                    //执行登陆
                    currentUser.login(token);
                }catch (AuthenticationException ae){
                    stateType=StateType.getStateType(17);
                }
            }
        }
        if(stateType==null){
            session.setAttribute("devUser",devUser);
            //重定向到另外一个controller，即首页
            return "redirect:/dev/index";
        }
        model.addAttribute("stateType",stateType);
//        return "redirect:/";  //因为登录错误而需要返回页面提示消息，所以不能使用redirect，否则取不到stateType
        return "dev/login";
    }


    @RequestMapping("/index")
//    @RequiresPermissions("role:view")
    public String index(){
        return "dev/index";
    }
}
