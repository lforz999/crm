package com.bus.service;


import com.bus.entity.CustomerVisit;

import java.util.List;

public interface CustomerVisitService {

    int insert(CustomerVisit cv);

    List<CustomerVisit> findAllCustomerVisit(String name);

    CustomerVisit selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(CustomerVisit cv);

    int deleteByPrimaryKey(int id);

    List<CustomerVisit> findCustomersByCondition(CustomerVisit cv);
}
