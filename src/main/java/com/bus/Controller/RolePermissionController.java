package com.bus.Controller;

import com.bus.entity.Permission;
import com.bus.entity.Role;
import com.bus.entity.RolePermission;
import com.bus.mapper.PermissionMapper;
import com.bus.mapper.RoleMapper;
import com.bus.mapper.RolePermissionMapper;
import com.bus.service.RolePermissionService;
import com.bus.until.BootStrapPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("shiro/rolepermission")
public class RolePermissionController {
    @Autowired
    RolePermissionService rps;

    @Autowired
    RolePermissionMapper rpm;

    @Autowired
    RoleMapper rm;

    @Autowired
    PermissionMapper pm;

    @ResponseBody
    @RequestMapping("getBroth")
    public String getBroth() {
        List<Role> roleList = rm.selectAll();
        List<Permission> permissionList = pm.selectAll();
        Object[] arr = {roleList, permissionList};
        return JSONArray.fromObject(arr).toString();
    }

    @ResponseBody
    @RequestMapping("toAdd")
    public String toAdd() {
        List<Role> roleList = rm.selectAll();
        List<Permission> permissionList = pm.selectAllMenu();
        HashMap<Object, Object> map = new HashMap<>();
        map.put("roleList", roleList);
        map.put("permissionList", permissionList);
        return JSONObject.fromObject(map).toString();
    }

    @ResponseBody
    @RequestMapping("/insert")
    public void insert(HttpServletResponse resp, Integer rpname3,String check_val1) throws IOException {
        List<String> list1 = Arrays.asList(check_val1.split(","));
        List<RolePermission> list =new ArrayList<RolePermission>();
        for (String s:list1) {
            System.out.println(Integer.valueOf(s));
            list.add(new RolePermission(rpname3, Integer.valueOf(s)));
        }
        int i = rps.insertMore(list);
        System.out.println(i);
        PrintWriter out = resp.getWriter();
        if (i > 1) {
            out.print("ok");
        } else {
            out.print("no");
        }
    }

    @ResponseBody
    @RequestMapping("toEdit")
    public synchronized String toEdit(Integer id) {
       /* RolePermission rolepermission = rps.selectByPrimaryKey(id);
        List<Role> roleList = rm.selectAll();
        List<Permission> permissionList = pm.selectAll();
        HashMap<Object, Object> map = new HashMap<>();
        map.put("rolepermission", rolepermission);
        map.put("roleList", roleList);
        map.put("permissionList", permissionList);
        return JSONObject.fromObject(map).toString();*/
        List<Permission> list = pm.selectAllMenu();
        String name = rm.selectRoleById(id);
        List<Permission> cList = pm.selectone(name);

        System.out.println(list);
        System.out.println(cList);
        HashMap<Object, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("cList", cList);
        map.put("id", id);
        return JSONObject.fromObject(map).toString();
    }

    @ResponseBody
    @RequestMapping("update")
    public void doEdit(HttpServletResponse resp , Integer rpID, String check_val) throws IOException {
        System.out.println(rpID);
        System.out.println(check_val);
        List<String> list1 = Arrays.asList(check_val.split(","));
        System.out.println(list1);
        List<RolePermission> list =new ArrayList<RolePermission>();
        for (String s:list1) {
            System.out.println(Integer.valueOf(s));
            list.add(new RolePermission(rpID, Integer.valueOf(s)));
        }
        System.out.println(list);
        List<RolePermission> list2 = rpm.selectRolePermissionById(rpID);
        if (list2!=null){
            int deleteAll = rps.deleteAll(rpID);
            System.out.println(deleteAll);
        }
        int i = rps.insertMore(list);
        System.out.println(i);
        PrintWriter out = resp.getWriter();
        if (i > 0) {
            out.print("ok");
        } else {
            out.print("no");
        }
    }

    @ResponseBody
    @RequestMapping("delete")
    public void doDelete(HttpServletResponse resp , Integer id) throws IOException {
        int i = rps.deleteByPrimaryKey(id);
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
        mav.setViewName("crm/rolepermission/showAllRolePermission.jsp");
        return mav;
    }

    @ResponseBody
    @RequestMapping("select2")
    public String doshowAll(Integer offset,Integer limit) {
        Page<Role> page = PageHelper.offsetPage(offset, limit);
        List<Role> list = rm.selectAll();
        System.out.println(list);
        BootStrapPage<Role> bootpage = new BootStrapPage<>();
        bootpage.setTotal(Math.toIntExact(page.getTotal()));
        bootpage.setRows(list);
        return JSONObject.fromObject(bootpage).toString();
    }
    @ResponseBody
    @RequestMapping("selectone")
    public String selectone(Integer id, HttpServletRequest request) {
        List<Permission> plist = null;
        System.out.println("--------"+id);
        String name = rm.selectRoleById(id);
        List<Permission> clist = pm.selectone(name);
        System.out.println("--------->"+clist);
        for (Permission p:clist
             ) {
            plist = p.getList();
            System.out.println(p);
            for (Permission p2:plist
                 ) {
                System.out.println("========>"+p2);
            }
        }
//        m.addAttribute("clist",clist);
//        m.addAttribute("plist",plist);
//        request.setAttribute("clist",clist);
        HashMap<Object, Object> map = new HashMap<>();
        map.put("clist", clist);
//        map.put("plist", plist);
        return JSONObject.fromObject(map).toString();
    }

}
