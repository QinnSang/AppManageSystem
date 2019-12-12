package service.serviceImpl;

import exception.ServiceException;
import mapper.DevUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.DevUser;
import service.RegisterValidateService;
import util.SendEmail;
import java.util.Date;

@Service("RegisterValidateService")
public class RegisterValidateServiceImpl implements RegisterValidateService {

    @Autowired
    private DevUserMapper devUserMapper;
    /**
     * 处理注册
     */


    public void sendEmail(DevUser devUser){
        Long as=5480l;
        ///邮件的内容
        StringBuffer sb=new StringBuffer("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
        sb.append("<a href=\"http://localhost:8080/dev/activate/");
        sb.append(devUser.getDevEmail());
        sb.append("/");
        sb.append(devUser.getValidateCode());
        sb.append("\">http://localhost:8080/devUser/activate/");
        sb.append(devUser.getDevEmail());
        sb.append("/");
        sb.append(devUser.getValidateCode());
        sb.append("</a>");

        //发送邮件
        SendEmail.send(devUser.getDevEmail(), sb.toString());
        System.out.println("发送邮件");

    }

    /**
     * 处理激活
     */
    ///传递激活码和email过来
    public void activateUser(String devEmail , String validateCode)throws ServiceException{
        //数据访问层，通过email获取用户信息
        DevUser devUser=devUserMapper.queryByEmail(devEmail);
        //验证用户是否存在
        if(devUser!=null) {
            //验证用户激活状态
            if(devUser.getStatus()==0) {
                ///没激活
                Date currentTime = new Date();//获取当前时间
                //验证链接是否过期
                currentTime.before(devUser.getCreationDate());
                if(currentTime.before(devUser.getLastActivateTime())) {
                    //验证激活码是否正确
                    if(validateCode.equals(devUser.getValidateCode())) {
                        //激活成功， //并更新用户的激活状态，为已激活
                        System.out.println("==sq==="+devUser.getStatus());
                        devUser.setStatus(1);//把状态改为激活
                        System.out.println("==sh==="+devUser.getStatus());
                        if(!(devUserMapper.updateDevUser(devUser)==1)){
                            throw new ServiceException("激活失败");
                        };
                    } else {
                        throw new ServiceException("激活码不正确");
                    }
                } else { throw new ServiceException("激活码已过期！");
                }
            } else {
                throw new ServiceException("邮箱已激活，请登录！");
            }
        } else {
            throw new ServiceException("该邮箱未注册（邮箱地址不存在）！");
        }

    }

}
