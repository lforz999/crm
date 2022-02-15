package com.bus.Controller;

import com.bus.entity.Role;
import com.bus.entity.User;
import com.bus.mapper.RoleMapper;
import com.bus.service.UserService;
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

@Controller
public class IndexController {


    @RequestMapping("/index")
    public ModelAndView index(){
        System.out.println("-- index无action --");
        ModelAndView mav = new ModelAndView();
//        mav.setViewName("index.jsp");
        mav.setViewName("index.html");
        return mav;
    }


}
