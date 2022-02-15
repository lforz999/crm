package com.bus.service;


import com.bus.entity.Role;
import com.bus.entity.RolePermission;

import java.util.List;

public interface RolePermissionService {

    int insert(RolePermission rp);

    RolePermission selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(RolePermission rp);

    int deleteByPrimaryKey(int id);

    int deleteAll(int id);

    int insertMore(List<RolePermission> list);

    List<Role> findAllRolePermission();

    List<RolePermission> findRoleByCondition(RolePermission rp);
}
