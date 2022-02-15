package com.bus.mapper;

import com.bus.entity.CustomerVisit;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface CustomerVisitMapper extends Mapper<CustomerVisit> {
    List<CustomerVisit> selectAllCustomerVisit(String name);

    List<CustomerVisit> findCustomerVisitByCondition(CustomerVisit cv);
}
