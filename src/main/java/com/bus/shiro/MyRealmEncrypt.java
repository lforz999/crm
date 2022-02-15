package com.bus.shiro;

import com.bus.mapper.PermissionMapper;
import com.bus.mapper.RoleMapper;
import com.bus.mapper.UserMapper;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
public class MyRealmEncrypt extends AuthorizingRealm {
    @Autowired
    UserMapper um;

    @Autowired
    PermissionMapper pm;

    @Autowired
    RoleMapper rm;

    //这里是从数据库查出的数据
    public String getPasswordByUserName(String name){
        System.out.println("-- 访问数据库 --");
        return um.selectPasswordByName(name);
    }

    @Override //认证
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String username = token.getUsername();
        System.out.println("传过来的用户名"+username);
        String password = getPasswordByUserName(username);
        if (password == null){
            return null;
        }
        //加盐操作
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(username, password,"myRealm");
        //盐是字节类型的
        //                                              一般用username
        info.setCredentialsSalt(ByteSource.Util.bytes("admin"));

        return info;
    }

    //     避免重复
    public Set<String> getRolesByUserName(String userName){
        List<String> list = rm.selectRoleByName(userName);
        HashSet<String> set = new HashSet<>(list);
        return set;
    }

    public Set<String> getPermissionByUserName(String name){
        List<String> list = pm.selectPermissionsByUserName(name);
        for (String s:list
             ) {
            System.out.println("所有权限:"+s);
        }
        return new HashSet<String>(list);
    }

    @Override //授权
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
//        String username = (String) principalCollection.getPrimaryPrincipal();
        String username = (String)getAvailablePrincipal(principalCollection);
        System.out.println("要检查权限的用户名："+username);
        //后面，和spring整合后，这里就用数据库操作来替换
        Set<String> roles = getRolesByUserName(username);
        Set<String> permission = getPermissionByUserName(username);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setRoles(roles);
        info.setStringPermissions(permission);
        return info;
    }
}
