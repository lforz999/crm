package com.bus.mapper;

import com.bus.entity.Customer;
import com.bus.entity.CustomerShare;
import com.bus.entity.CustomerVisit;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface CustomerShareMapper extends Mapper<CustomerShare> {
    List<CustomerShare> selectAllCustomerShare(String name);

    List<CustomerShare> findCustomerShareByCondition(CustomerShare cs);
}
