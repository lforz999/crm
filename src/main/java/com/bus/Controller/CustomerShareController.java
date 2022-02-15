package com.bus.Controller;

import com.bus.entity.Customer;
import com.bus.entity.CustomerShare;
import com.bus.entity.CustomerShare;
import com.bus.entity.User;
import com.bus.mapper.CustomerMapper;
import com.bus.mapper.UserMapper;
import com.bus.service.CustomerShareService;
import com.bus.service.CustomerShareService;
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
@RequestMapping("shiro/customershare")
public class CustomerShareController {
    @Autowired
    CustomerShareService chs;

    @Autowired
    CustomerMapper cm;

    @Autowired
    UserMapper um;

    @ResponseBody
    @RequestMapping("toAdd")
    public String toAdd() {
        List<Customer> customerList = cm.selectAll();
        List<User> userList = um.selectAll();
        HashMap<Object, Object> map = new HashMap<>();
        map.put("customerList", customerList);
        map.put("userList", userList);
        return JSONObject.fromObject(map).toString();
    }

    @ResponseBody
    @RequestMapping("/insert")
    public void insert(HttpServletResponse resp, Integer c_name,Integer u_name) throws IOException {
        CustomerShare c = new CustomerShare(c_name,u_name);
        System.out.println(c);
        int i = chs.insert(c);
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
        CustomerShare customerShare = chs.selectByPrimaryKey(id);
        List<Customer> customerList = cm.selectAll();
        List<User> userList = um.selectAll();
        HashMap<Object, Object> map = new HashMap<>();
        map.put("customerShare", customerShare);
        map.put("customerList", customerList);
        map.put("userList", userList);
        return JSONObject.fromObject(map).toString();
    }

    @ResponseBody
    @RequestMapping("update")
    public void doEdit(HttpServletResponse resp , Integer cvID, Integer cName,Integer uName) throws IOException {
        CustomerShare customer = new CustomerShare(cvID, cName,uName);
        System.out.println(customer);
        int i = chs.updateByPrimaryKeySelective(customer);
        System.out.println(i);
        PrintWriter out = resp.getWriter();
        if (i == 1) {
            out.print("ok");
        } else {
            out.print("no");
        }
    }
    @ResponseBody
    @RequestMapping("toShare")
    public String toShare(Integer id) {
        CustomerShare customerShare = chs.selectByPrimaryKey(id);
        List<Customer> customerList = cm.selectAll();
        List<User> userList = um.selectAll();
        HashMap<Object, Object> map = new HashMap<>();
        map.put("customerShare", customerShare);
        map.put("customerList", customerList);
        map.put("userList", userList);
        return JSONObject.fromObject(map).toString();
    }
    @ResponseBody
    @RequestMapping("share")
    public void doshare(HttpServletResponse resp , Integer cscName,Integer csuName) throws IOException {
        CustomerShare cs = new CustomerShare(cscName,csuName);
        int i = chs.insert(cs);
        PrintWriter out = resp.getWriter();
        if (i == 1) {
            out.print("ok");
        } else {
            out.print("no");
        }
    }
    @ResponseBody
    @RequestMapping("delete")
    public void delete(HttpServletResponse resp , Integer id) throws IOException {
        int i = chs.deleteByPrimaryKey(id);
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
        mav.setViewName("crm/customershare/showAllCustomerShare.jsp");
        return mav;
    }
    @RequestMapping("select3")
    public ModelAndView showAll() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("crm/customershare/showAllCustomerShare.jsp");
        return mav;
    }

    @ResponseBody
    @RequestMapping("select4")
    public String doshowAll(Integer offset,Integer limit,Integer c_name1) {
        Page<CustomerShare> page = PageHelper.offsetPage(offset, limit);
        List<CustomerShare> list = chs.findCustomersByCondition(new CustomerShare(new Customer(c_name1)));
        BootStrapPage<CustomerShare> bootpage = new BootStrapPage<>();
        bootpage.setTotal(Math.toIntExact(page.getTotal()));
        bootpage.setRows(list);
        return JSONObject.fromObject(bootpage).toString();
    }
    @ResponseBody
    @RequestMapping("select2")
    public String doshowAllByName(Integer offset,Integer limit) {
        Subject subject = SecurityUtils.getSubject();
        String name = (String) subject.getPrincipal();
        Page<CustomerShare> page = PageHelper.offsetPage(offset, limit);
        List<CustomerShare> list = chs.findAllCustomerShare(name);
        BootStrapPage<CustomerShare> bootpage = new BootStrapPage<>();
        bootpage.setTotal(Math.toIntExact(page.getTotal()));
        bootpage.setRows(list);
        return JSONObject.fromObject(bootpage).toString();
    }
}
