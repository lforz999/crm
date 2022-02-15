package com.bus.service;

import com.bus.entity.CustomerVisit;
import com.bus.mapper.CustomerVisitMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CustomerVisitServiceImp implements CustomerVisitService{

    @Autowired
    CustomerVisitMapper cvm;

    @Override
    public int insert(CustomerVisit cv) {
        return cvm.insertSelective(cv);
    }

    @Override
    public List<CustomerVisit> findAllCustomerVisit(String name) {
        return cvm.selectAllCustomerVisit(name);
    }

    @Override
    public CustomerVisit selectByPrimaryKey(int id) {
        return cvm.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(CustomerVisit cv) {
        return cvm.updateByPrimaryKeySelective(cv);
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return cvm.deleteByPrimaryKey(id);
    }

    @Override
    public List<CustomerVisit> findCustomersByCondition(CustomerVisit cv) {
        return cvm.findCustomerVisitByCondition(cv);
    }
}
