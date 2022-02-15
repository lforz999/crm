package com.bus.service;


import com.bus.entity.CustomerShare;

import java.util.List;

public interface CustomerShareService {

    int insert(CustomerShare cv);

    List<CustomerShare> findAllCustomerShare(String name);

    CustomerShare selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(CustomerShare cs);

    int deleteByPrimaryKey(int id);

    List<CustomerShare> findCustomersByCondition(CustomerShare cs);
}
