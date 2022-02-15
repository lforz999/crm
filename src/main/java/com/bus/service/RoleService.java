package com.bus.service;


import com.bus.entity.Customer;
import com.bus.entity.Role;

import java.util.List;

public interface RoleService {

    int insert(Role r);

    List<Role> findAllRole();

    Role selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(Role r);

    int deleteByPrimaryKey(int id);

    List<Role> findRoleByCondition(Role r);
}
