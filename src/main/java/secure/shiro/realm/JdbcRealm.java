package secure.shiro.realm;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import pojo.DevUser;
import pojo.Menu;
import pojo.Role;
import service.DevUserService;
import service.MenuService;

import java.util.List;

public class JdbcRealm extends AuthorizingRealm {

    @Autowired
    private DevUserService devUserService;
    @Autowired
    private MenuService menuService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String userName=token.getPrincipal().toString();
        DevUser user=devUserService.queryByName(userName);
        //账号是否被激活
        if(user.getStatus()!=0)
            return null;
        SimpleAuthenticationInfo info=new SimpleAuthenticationInfo(user,user.getDevPassword(), ByteSource.Util.bytes(user.getDevCode()),this.getName());
        return info;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("=========授权===========");
        DevUser devUser = (DevUser) principals.getPrimaryPrincipal();
//        Principal principal = (Principal) getAvailablePrincipal(principals);
//        DevUser devUser = devUserService.queryByName(principal.getName());
        if (devUser != null) {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            List<Menu> list = menuService.getMenuList(devUser.getId());
            for (Menu menu : list) {
                if (StringUtils.isNotBlank(menu.getPermission())) {
                    // 添加基于Permission的权限信息
                    for (String permission : StringUtils.split(menu.getPermission(), ",")) {
                        info.addStringPermission(permission);
                    }
                }
            }
            // 添加用户权限
            info.addStringPermission("user");
            // 添加用户角色信息
            for (Role role : devUser.getRoleList()) {
                info.addRole(role.getName());
            }
            return info;
        }
        return null;
    }


    /**
     * 但设置缓存后，授权的权限发生变化时需要清理缓存
     * 可以调用父类的清理缓存方法，也可自己定义方法，当授权时对调用该方法进行清理缓存即可
     * @param principals
     */
//    @Override
//    protected void clearCache(PrincipalCollection principals) {
//        super.clearCache(principals);
//    }

        //自定义清理缓存方法
    public void clearCache(){
        Subject subject= SecurityUtils.getSubject();
        super.clearCache(subject.getPrincipals());
    }

}