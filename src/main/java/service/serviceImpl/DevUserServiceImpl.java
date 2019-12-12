package service.serviceImpl;

import constant.StateType;
import mapper.DevUserMapper;
import mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.DevUser;
import secure.util.SecureUtils;
import service.DevUserService;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("devUserService")
public class DevUserServiceImpl implements DevUserService {

    @Autowired
    private DevUserMapper devUserMapper;
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public StateType  login(DevUser devUser) {
        String pwdMd5= SecureUtils.getMD5(devUser.getDevPassword());
        devUser.setDevPassword(pwdMd5);
        List<DevUser> devUsers = devUserMapper.queryByNameAndPwd(devUser);
        if(devUsers!=null && devUsers.size()==1){
            devUser=devUsers.get(0);
            //账号是否被激活
            if(devUser.getStatus()!=0)
                return null;
            else{
                return  StateType.getStateType(15);
            }
        }else{
            return  StateType.getStateType(14);
        }
    }

    @Override
    public StateType register(DevUser devUser) {
        Map<String, Object> map=new HashMap<>();
        DevUser user=devUserMapper.queryByName(devUser.getDevCode());
        if(user==null){
             user=devUserMapper.queryByEmail(devUser.getDevEmail());
            if(user==null){
                //todo 发送邮件时把注册时间当做参数传过去，对参数进行签名。验证时与当前时间比较，减少了保存时间的操作。
                String pwdMd5= SecureUtils.getMD5(devUser.getDevPassword());
                String validatecode=SecureUtils.getMD5(devUser.getDevEmail());
                devUser.setDevPassword(pwdMd5);
                devUser.setValidateCode(validatecode);
                devUser.setCreationDate(new Date());
                devUser.setStatus(0);
                boolean insertFlag=devUserMapper.register(devUser)==1?true:false;
                if(insertFlag){
                    return null;
                }else{
                    //注册失败
                     return  StateType.getStateType(13);
                }
            }else{
                //邮箱已被注册
                return  StateType.getStateType(12);
            }
        }else{
            //账号已被注册
            return  StateType.getStateType(11);
        }
    }

    @Override
    public DevUser queryByName(String userName) {
        DevUser user=devUserMapper.queryByName(userName);
        if(user!=null){
            user.setRoleList(roleMapper.getRoleByUser(user.getId()));
        }
        return user ;
    }


}
