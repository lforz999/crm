package com.bus.mapper;

import com.bus.entity.Customer;
import com.bus.entity.CustomerShare;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface CustomerMapper extends Mapper<Customer> {
    List<Customer> selectAllCustomer(String name);

    List<Customer> findCustomersByCondition(Customer c);

    List<Customer> findCustomersByName(String name);

    int selectIdByName(String name);

    String selectone();
}
