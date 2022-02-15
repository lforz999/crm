package com.bus.Controller;

import com.bus.entity.Permission;
import com.bus.entity.Role;
import com.bus.service.PermissionService;
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
@RequestMapping("shiro/permission")
public class PermissionController {
    @Autowired
    PermissionService ps;

    @ResponseBody
    @RequestMapping("/insert")
    public void insert(HttpServletResponse resp, String p_name,String p_url,Integer is_menu,Integer parent_id,String p_info) throws IOException {
        Permission permission = new Permission(p_name, p_url, is_menu, parent_id, p_info);
        System.out.println(permission);
        int i = ps.insert(permission);
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
        Permission permission = ps.selectByPrimaryKey(id);
        HashMap<Object, Object> map = new HashMap<>();
        map.put("permission", permission);
        return JSONObject.fromObject(map).toString();
    }

    @ResponseBody
    @RequestMapping("update")
    public void doEdit(HttpServletResponse resp , Integer permissionID, String pName,String pUrl,Integer isMenu,Integer parentId,String pInfo) throws IOException {
        Permission permission = new Permission(permissionID,pName, pUrl, isMenu, parentId, pInfo);
        System.out.println(permission);
        int i = ps.updateByPrimaryKeySelective(permission);
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
        int i = ps.deleteByPrimaryKey(id);
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
        mav.setViewName("crm/permission/showAllPermission.jsp");
        return mav;
    }

    @ResponseBody
    @RequestMapping("select2")
    public String doshowAll(Integer offset,Integer limit,String p_name1) {
        Page<Permission> page = PageHelper.offsetPage(offset, limit);
        List<Permission> list = ps.findPermissionByCondition(new Permission(p_name1));
        BootStrapPage<Permission> bootpage = new BootStrapPage<>();
        bootpage.setTotal(Math.toIntExact(page.getTotal()));
        bootpage.setRows(list);
        return JSONObject.fromObject(bootpage).toString();
    }
}
