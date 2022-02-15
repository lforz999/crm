package com.bus.service;


import com.bus.entity.Customer;

import java.util.List;

public interface CustomerService {

    int insert(Customer c);

    List<Customer> findAllCustomer(String name);

    String findAllCustomerJson(String name);

    Customer selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(Customer c);

    int deleteByPrimaryKey(int id);

    List<Customer> findCustomersByCondition(Customer c);

    int findIdByName(String name);
}
