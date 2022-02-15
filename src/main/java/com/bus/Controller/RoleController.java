package com.bus.Controller;

import com.bus.entity.Customer;
import com.bus.entity.Role;
import com.bus.service.CustomerService;
import com.bus.service.RoleService;
import com.bus.until.BootStrapPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import net.sf.json.JSONObject;
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

@Controller
@RequestMapping("shiro/role")
public class RoleController {
    @Autowired
    RoleService rs;

    @ResponseBody
    @RequestMapping("/insert")
    public void insert(HttpServletResponse resp, String role_name,String role_desc) throws IOException {
        Role role = new Role(role_name, role_desc);
        System.out.println(role);
        int i = rs.insert(role);
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
        Role role = rs.selectByPrimaryKey(id);
        HashMap<Object, Object> map = new HashMap<>();
        map.put("role", role);
        return JSONObject.fromObject(map).toString();
    }

    @ResponseBody
    @RequestMapping("update")
    public void doEdit(HttpServletResponse resp , Integer rID, String roleName,String roleDesc) throws IOException {
        Role role = new Role(rID, roleName, roleDesc);
        System.out.println(role);
        int i = rs.updateByPrimaryKeySelective(role);
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
        int i = rs.deleteByPrimaryKey(id);
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
        mav.setViewName("crm/role/showAllRole.jsp");
        return mav;
    }

    @ResponseBody
    @RequestMapping("select2")
    public String doshowAll(Integer offset,Integer limit,String role_name1) {
        Page<Role> page = PageHelper.offsetPage(offset, limit);
        List<Role> list = rs.findRoleByCondition(new Role(role_name1));
        BootStrapPage<Role> bootpage = new BootStrapPage<>();
        bootpage.setTotal(Math.toIntExact(page.getTotal()));
        bootpage.setRows(list);
        return JSONObject.fromObject(bootpage).toString();
    }
}
