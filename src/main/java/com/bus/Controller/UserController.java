package com.bus.Controller;

import com.bus.entity.Role;
import com.bus.entity.User;
import com.bus.mapper.RoleMapper;
import com.bus.service.UserService;
import com.bus.until.BootStrapPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import net.sf.json.JSONObject;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("shiro/user")
public class UserController {

    @Autowired
    UserService us;

    @Autowired
    RoleMapper rm;


    @ResponseBody
    @RequestMapping("toAdd")
    public String toAdd() {
        List<Role> roleList = rm.selectAll();
        HashMap<Object, Object> map = new HashMap<>();
        map.put("roleList", roleList);
        return JSONObject.fromObject(map).toString();
    }

    @ResponseBody
    @RequestMapping("/insert")
    public void insert(HttpServletResponse resp,String user_name,String user_password,Integer r_id) throws IOException {
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

    @ResponseBody
    @RequestMapping("toEdit")
    public String toEdit(Integer id) {
        User user = us.selectByPrimaryKey(id);
        List<Role> roleList =  rm.selectAll();
        HashMap<Object, Object> map = new HashMap<>();
        map.put("user", user);
        map.put("roleList", roleList);
        return JSONObject.fromObject(map).toString();
    }

    @ResponseBody
    @RequestMapping("update")
    public void doEdit(HttpServletResponse resp , Integer uID, String userName,String userPassword,Integer rid1) throws IOException {
        Md5Hash p = new Md5Hash(userPassword, "admin", 3);
        String password = String.valueOf(p);
        User user = new User(uID, userName, password,rid1);
        System.out.println(user);
        int i = us.updateByPrimaryKeySelective(user);
        System.out.println(i);
        PrintWriter out = resp.getWriter();
        if (i == 1) {
            out.print("ok");
        } else {
            out.print("no");
        }
    }

    @ResponseBody
    @RequestMapping("delete")
    public void doDelete(HttpServletResponse resp , Integer id) throws IOException {
        int i = us.deleteByPrimaryKey(id);
        PrintWriter out = resp.getWriter();
        if (i == 1) {
            out.print("ok");
        } else {
            out.print("no");
        }
    }

    @RequestMapping("select")
    public ModelAndView show() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("crm/user/showAllUser.jsp");
        return mav;
    }
    @RequestMapping("select3")
    public ModelAndView doshow() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("crm/user/showAllUser.jsp");
        return mav;
    }

    @ResponseBody
    @RequestMapping("select2")
    public String doshowAll(Integer offset,Integer limit,String user_name1) {
        Page<User> page = PageHelper.offsetPage(offset, limit);
        List<User> list = us.findUsersByCondition(new User(user_name1));
        BootStrapPage<User> bootpage = new BootStrapPage<>();
        bootpage.setTotal(Math.toIntExact(page.getTotal()));
        bootpage.setRows(list);
        return JSONObject.fromObject(bootpage).toString();
    }
    @ResponseBody
    @RequestMapping("select4")
    public String showAll(Integer offset,Integer limit,String user_name1) {
        Page<User> page = PageHelper.offsetPage(offset, limit);
        List<User> list = us.findAllUsersByCondition(new User(user_name1));
        BootStrapPage<User> bootpage = new BootStrapPage<>();
        bootpage.setTotal(Math.toIntExact(page.getTotal()));
        bootpage.setRows(list);
        return JSONObject.fromObject(bootpage).toString();
    }
}
