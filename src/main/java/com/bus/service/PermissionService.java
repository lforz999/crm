package com.bus.service;


import com.bus.entity.Permission;
import com.bus.entity.Role;

import java.util.List;

public interface PermissionService {
    List<Permission> findMenuByName(String name);

    List<Permission> findAllMenu();

    List<Permission> findPowerMenuByName(String name);

    int insert(Permission p);

    Permission selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(Permission p);

    int deleteByPrimaryKey(int id);

    List<Permission> findPermissionByCondition(Permission p);
}
