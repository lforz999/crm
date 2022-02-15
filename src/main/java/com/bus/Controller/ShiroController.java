package com.bus.Controller;

import com.bus.entity.Role;
import com.bus.entity.User;
import com.bus.mapper.RoleMapper;
import com.bus.mapper.UserMapper;
import com.bus.service.UserService;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("shiro")
public class ShiroController {

    @Autowired
    UserService us;

    @Autowired
    RoleMapper rm;

    @Autowired
    UserMapper um;

    @RequestMapping("/changeLanguage.action")
    public String changeLanguage(Locale locale){
        System.out.println("change  -->"+locale);
        return "index.jsp";
    }

    @RequestMapping("/login")
    public String login(User user){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getUserPassword());
        try{
            subject.login(token);
            //判断认证状态
            if (subject.isAuthenticated()){
                System.out.println("认证通过");
                //检查权限
//                subject.checkPermissions("product:select","product:insert");
                //检查角色
//                subject.checkRole("productManager");
//                return "main.jsp";
                return "forward:/menu/showAllMenu?name="+user.getUserName();
            }
        }catch (UnknownAccountException e){
            System.out.println("账号有误！！");
        }catch (IncorrectCredentialsException e){
            System.out.println("密码错误！！");
        }catch (UnauthorizedException e){
            System.out.println("对不起，权限不足！"+e.getMessage());
        }
//        return "index.jsp";
        return "index.html";
    }

    @RequestMapping("/testPermission")
    @RequiresPermissions({"product:insert","product:select"})
    public String test(){
        Subject subject = SecurityUtils.getSubject();

        System.out.println("权限测试");
        return null;
    }

    @RequestMapping("/testRole")
    @RequiresRoles(value = {"admin","productManager"},logical = Logical.OR)
    public String testRole(){
        Subject subject = SecurityUtils.getSubject();
        System.out.println("角色测试");
        return null;
    }
    @RequestMapping("/mytest")
    public void mytest(){
        System.out.println("--mytsest测试--");
    }

    @ResponseBody
    @RequestMapping("/updatePassword")
    public void updatePassword(HttpServletResponse resp, String oldPassword,String newPassword) throws IOException {
        Subject subject = SecurityUtils.getSubject();
        String name = (String) subject.getPrincipal();
        System.out.println(name);
        int id = um.selectIdByName(name);
        String password1 = um.selectPasswordByName(name);
        System.out.println(password1);
        Md5Hash p = new Md5Hash(oldPassword, "admin", 3);
        String password2 = String.valueOf(p);
        System.out.println(password2);
        Md5Hash p1 = new Md5Hash(newPassword, "admin", 3);
        String password3 = String.valueOf(p1);
        System.out.println(password3);
        PrintWriter out = resp.getWriter();
        if (!password1.equals(password2)){
            out.print("none");
        }else if (password2.equals(password3)){
            out.print("no");
        }else if (!password2.equals(password3) && password1.equals(password2)){
            int i = um.updateByPrimaryKeySelective(new User(id,name, password3));
            System.out.println(i);
            out.print("ok");
        }
    }



    @ResponseBody
    @RequestMapping("/insert")
    public void insert(HttpServletResponse resp, String user_name, String user_password) throws IOException {
        int r_id = 2;
        System.out.println("要添加");
        Md5Hash p = new Md5Hash(user_password, "admin", 3);
        String password = String.valueOf(p);
        User user = new User(user_name, password,r_id);
        System.out.println(user);
        int i = us.insert(user);
        PrintWriter out = resp.getWriter();
        if (i == 1) {
            out.print("ok");
        } else {
            out.print("no");
        }
    }

    @RequestMapping("/loginOut")
    public String loginOut(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:index.html";
    }
}
