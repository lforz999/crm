package com.bus.Controller;

import com.bus.entity.*;
import com.bus.mapper.CustomerMapper;
import com.bus.mapper.UserMapper;
import com.bus.service.CustomerService;
import com.bus.service.CustomerVisitService;
import com.bus.until.BootStrapPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
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
@RequestMapping("shiro/customervisit")
public class CustomerVisitController {
    @Autowired
    CustomerVisitService cvs;

    @Autowired
    CustomerMapper cm;

    @Autowired
    UserMapper um;

    @ResponseBody
    @RequestMapping("toAdd")
    public String toAdd() {
        Subject subject = SecurityUtils.getSubject();
        String name = (String) subject.getPrincipal();
        List<Customer> customerList = cm.findCustomersByName(name);
        List<User> userList = um.selectAll();
        HashMap<Object, Object> map = new HashMap<>();
        map.put("customerList", customerList);
        map.put("userList", userList);
        return JSONObject.fromObject(map).toString();
    }

    @ResponseBody
    @RequestMapping("/insert")
    public void insert(HttpServletResponse resp, Integer c_name) throws IOException {
        Subject subject = SecurityUtils.getSubject();
        String name = (String) subject.getPrincipal();
        int u_name = um.selectIdByName(name);
        CustomerVisit c = new CustomerVisit(c_name,u_name);
        System.out.println(c);
        int i = cvs.insert(c);
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
        CustomerVisit customerVisit = cvs.selectByPrimaryKey(id);
        List<Customer> customerList = cm.selectAll();
        List<User> userList = um.selectAll();
        HashMap<Object, Object> map = new HashMap<>();
        map.put("customerVisit", customerVisit);
        map.put("customerList", customerList);
        map.put("userList", userList);
        return JSONObject.fromObject(map).toString();
    }

    @ResponseBody
    @RequestMapping("update")
    public void doEdit(HttpServletResponse resp , Integer cID, Integer cName,Integer uName) throws IOException {
        CustomerVisit customer = new CustomerVisit(cID, cName,uName);
        System.out.println(customer);
        int i = cvs.updateByPrimaryKeySelective(customer);
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
        int i = cvs.deleteByPrimaryKey(id);
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
        mav.setViewName("crm/customervisit/showAllCustomerVisit.jsp");
        return mav;
    }
    @RequestMapping("select3")
    public ModelAndView showAll() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("crm/customervisit/showAllCustomerVisit.jsp");
        return mav;
    }
    @ResponseBody
    @RequestMapping("select4")
    public String doshow(Integer offset,Integer limit,Integer c_name1) {
        Page<CustomerVisit> page = PageHelper.offsetPage(offset, limit);
        List<CustomerVisit> list = cvs.findCustomersByCondition(new CustomerVisit(c_name1));
        BootStrapPage<CustomerVisit> bootpage = new BootStrapPage<>();
        bootpage.setTotal(Math.toIntExact(page.getTotal()));
        bootpage.setRows(list);
        return JSONObject.fromObject(bootpage).toString();
    }
    @ResponseBody
    @RequestMapping("select2")
    public String doshowAll(Integer offset,Integer limit) {
        Subject subject = SecurityUtils.getSubject();
        String name = (String) subject.getPrincipal();
        Page<CustomerVisit> page = PageHelper.offsetPage(offset, limit);
        List<CustomerVisit> list = cvs.findAllCustomerVisit(name);
        BootStrapPage<CustomerVisit> bootpage = new BootStrapPage<>();
        bootpage.setTotal(Math.toIntExact(page.getTotal()));
        bootpage.setRows(list);
        return JSONObject.fromObject(bootpage).toString();
    }
}
