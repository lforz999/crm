package com.bus.service;

import com.bus.entity.Customer;
import com.bus.mapper.CustomerMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;
import tk.mybatis.mapper.util.StringUtil;

import java.util.List;

@Service
@Transactional
public class CustomerServiceImp implements CustomerService{

    @Autowired
    CustomerMapper cm;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    @Override
    public int insert(Customer c) {
        return cm.insertSelective(c);
    }

/*
    @Override
    public List<Customer> findAllCustomer(String name) {
        return cm.selectAllCustomer(name);
    }
*/

    @Override
    public List<Customer> findAllCustomer(String name) {
        ObjectMapper objectMapper = new ObjectMapper();
//        Jedis jedis = new Jedis("localhost");
//        String customer = jedis.get("customer");
        String customer = redisTemplate.boundValueOps("customer").get();
        List<Customer> list=null;
        if (StringUtil.isEmpty(customer)){
            System.out.println("redis没数据，查询数据库");
            list = cm.selectAllCustomer(name);
            String s = null;
            try {
                s = objectMapper.writeValueAsString(list);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
//            jedis.set("customer", s);
//            jedis.close();
            redisTemplate.boundValueOps("customer").set(s);
        }else {
            JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, Customer.class);
            try {
                list = objectMapper.readValue(customer,javaType);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public String findAllCustomerJson(String name) {
        Jedis jedis = new Jedis("localhost");
        String customer = jedis.get("customer");
        if (customer == null || customer.length() == 0) {
            System.out.println("redis没数据，查询数据库");
            List<Customer> list = cm.selectAllCustomer(name);
            ObjectMapper objectMapper = new ObjectMapper();
            String s = null;
            try {
                s = objectMapper.writeValueAsString(list);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
            jedis.set("customer", s);
            jedis.close();
            return null;
        } else {
            System.out.println("redis有数据");
            return customer;
        }
    }


    @Override
    public Customer selectByPrimaryKey(int id) {
        return cm.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Customer c) {
        return cm.updateByPrimaryKeySelective(c);
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return cm.deleteByPrimaryKey(id);
    }

    @Override
    public List<Customer> findCustomersByCondition(Customer c) {
        return cm.findCustomersByCondition(c);
    }

    @Override
    public int findIdByName(String name) {
        return cm.selectIdByName(name);
    }
}
