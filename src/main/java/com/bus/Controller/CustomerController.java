package com.bus.Controller;

import com.bus.entity.Customer;
import com.bus.entity.CustomerShare;
import com.bus.mapper.CustomerShareMapper;
import com.bus.mapper.UserMapper;
import com.bus.service.CustomerService;
import com.bus.until.BootStrapPage;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import jdk.nashorn.internal.runtime.JSONListAdapter;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
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
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("shiro/customer")
public class CustomerController {
    @Autowired
    CustomerService cs;

    @Autowired
    UserMapper um;

    @Autowired
    CustomerShareMapper csm;

    @ResponseBody
    @RequestMapping("/insert")
    public void insert(HttpServletResponse resp, String c_name) throws IOException {
        Subject subject = SecurityUtils.getSubject();
        String name = (String) subject.getPrincipal();
        int u_name = um.selectIdByName(name);
        Customer c = new Customer(c_name);
        System.out.println(c);
        int i = cs.insert(c);
        PrintWriter out = resp.getWriter();
        if (i == 1) {
            out.print("ok");
        } else {
            out.print("no");
        }
        int id = cs.findIdByName(c_name);
        csm.insert(new CustomerShare(id,u_name));
    }

    @ResponseBody
    @RequestMapping("toEdit")
    public String toEdit(Integer id) {
        Customer customer = cs.selectByPrimaryKey(id);
        HashMap<Object, Object> map = new HashMap<>();
        map.put("customer", customer);
        return JSONObject.fromObject(map).toString();
    }

    @ResponseBody
    @RequestMapping("update")
    public void doEdit(HttpServletResponse resp , Integer cID, String cName) throws IOException {
        Customer customer = new Customer(cID, cName);
        System.out.println(customer);
        int i = cs.updateByPrimaryKeySelective(customer);
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
        int i = cs.deleteByPrimaryKey(id);
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
        mav.setViewName("crm/customer/showAllCustomer.jsp");
        return mav;
    }

    @RequestMapping("select3")
    public ModelAndView showAll() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("crm/customer/showAllCustomer.jsp");
        return mav;
    }

    @ResponseBody
    @RequestMapping("select4")
    public String doshowAll(Integer offset,Integer limit,Integer c_name1) {
        Page<Customer> page = PageHelper.offsetPage(offset, limit);
        List<Customer> list = cs.findCustomersByCondition(new Customer(c_name1));
        BootStrapPage<Customer> bootpage = new BootStrapPage<>();
        bootpage.setTotal(Math.toIntExact(page.getTotal()));
        bootpage.setRows(list);
        return JSONObject.fromObject(bootpage).toString();
    }
    @ResponseBody
    @RequestMapping("select2")
    public String doshowAll(Integer offset,Integer limit) {
        Subject subject = SecurityUtils.getSubject();
        String name = (String) subject.getPrincipal();
        Page<Customer> page = PageHelper.offsetPage(offset, limit);
        List<Customer> list = cs.findAllCustomer(name);
        //redis
       /* String json = cs.findAllCustomerJson(name);
        System.out.println(json);*/
       /* List<Customer> list = null;
        if (json==null){
            list = cs.findAllCustomer(name);
        }else {
             list = com.alibaba.fastjson.JSONObject.parseArray(json,Customer.class);
        }*/
        System.out.println(list);
        BootStrapPage<Customer> bootpage = new BootStrapPage<>();
        bootpage.setTotal(Math.toIntExact(page.getTotal()));
        bootpage.setRows(list);
        return JSONObject.fromObject(bootpage).toString();
    }
}
