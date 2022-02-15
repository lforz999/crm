package com.bus.test;

import com.bus.entity.RolePermission;
import com.bus.entity.User;
import com.bus.mapper.RolePermissionMapper;
import com.bus.mapper.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-ssm.xml")
public class TestMapper {
    @Autowired
    UserMapper um;

    @Autowired
    RolePermissionMapper rpm;

    @Test
    public void test(){
        User user = new User();
        user.setUserName("jack");
        user.setUserPassword("1111");
        int i = um.insert(user);
        System.out.println(i);
    }

    @Test
    public void test1(){
        new RolePermission(02,1, 2);
        new RolePermission(03,2, 2);
        new RolePermission(04,3, 2);
        System.out.println(rpm);
        Integer integer = rpm.deleteAllRolePermission(1);
        System.out.println(integer);
        /*List<RolePermission> list = rpm.selectAll();
        for (RolePermission rp:list
             ) {

            System.out.println(rp);
        }*/
    }

}
