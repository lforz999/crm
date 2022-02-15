package com.bus.service;

import com.bus.entity.CustomerShare;
import com.bus.entity.CustomerShare;
import com.bus.mapper.CustomerShareMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CustomerShareServiceImp implements CustomerShareService{

    @Autowired
    CustomerShareMapper csm;

    @Override
    public int insert(CustomerShare cs) {
        return csm.insertSelective(cs);
    }

    @Override
    public List<CustomerShare> findAllCustomerShare(String name) {
        return csm.selectAllCustomerShare(name);
    }

    @Override
    public CustomerShare selectByPrimaryKey(int id) {
        return csm.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(CustomerShare cs) {
        return csm.updateByPrimaryKeySelective(cs);
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return csm.deleteByPrimaryKey(id);
    }

    @Override
    public List<CustomerShare> findCustomersByCondition(CustomerShare cs) {
        return csm.findCustomerShareByCondition(cs);
    }
}
