package com.bus.Controller;

import com.bus.entity.Permission;
import com.bus.service.PermissionService;
import com.bus.until.MenuData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("menu")
@CrossOrigin("*")
public class MenuController {
    @Autowired
    PermissionService ps;

    @RequestMapping("/showMenu")
    public String showMenu(String name, Model m){
        //这里其实可以直接查出所有的菜单
        //然后，由前端来用shiro标签，也控制是否显示
        System.out.println("----得到的用户名----"+name);
        List<Permission> list = ps.findMenuByName(name);
        m.addAttribute("list",list);
        return "main.jsp";
    }
    @RequestMapping("/showAllMenu")
    public String showAllMenu(String name, Model m){
        //这里其实可以直接查出所有的菜单
        //然后，由前端来用shiro标签，也控制是否显示
        System.out.println("----得到的用户名----"+name);
        List<Permission> list = ps.findAllMenu();
        m.addAttribute("list",list);
        return "main.jsp";
    }

    //让前端用bootstrap-treeview显示多级菜单，前端接受正确的数据，显示没有控制
    @RequestMapping("/powerMenu")
    @ResponseBody
    public List<MenuData> powerMenu(String name){
        //list里面可能有儿子，孙子。。。
        List<Permission> list = ps.findPowerMenuByName(name);
        //调用转换的成MenuData格式
        return changeToMenuData(list);
    }

    //把我们查到的权限菜单，传换成bootstrap-treeview需要的格式
    public List<MenuData> changeToMenuData(List<Permission> list){
        //递归去完成， 自己调用自己《退出机制》
        List<MenuData> mdlist = new ArrayList<MenuData>();
        for (Permission p:list){
            MenuData data = new MenuData();
            if (p.getList()!=null && p.getList().size()!=0){
                data.setText(p.getPinfo());
                data.setHref(p.getPurl());
                //能走到这里，说明有子菜单，就又要调用自己来转换
                data.setNodes(changeToMenuData(p.getList()));
            }else if (p.getList()==null || p.getList().size()==0){
                data.setText(p.getPinfo());
                data.setHref(p.getPurl());
            }
            mdlist.add(data);
        }
        return mdlist;
    }
}
