package com.bus.service;

import com.bus.entity.Role;
import com.bus.entity.RolePermission;
import com.bus.mapper.RolePermissionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RolePermissionServiceImp implements RolePermissionService{

    @Autowired
    RolePermissionMapper rpm;

    @Override
    public int insert(RolePermission rp) {
        return rpm.insertSelective(rp);
    }

    @Override
    public RolePermission selectByPrimaryKey(int id) {
        return rpm.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(RolePermission rp) {
        return rpm.updateByPrimaryKeySelective(rp);
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return rpm.deleteByPrimaryKey(id);
    }

    @Override
    public int deleteAll(int id) {
        return rpm.deleteAllRolePermission(id);
    }

    @Override
    public int insertMore(List<RolePermission> list) {
        return rpm.insertMore(list);
    }

    @Override
    public List<Role> findAllRolePermission() {
        return rpm.selectAllRolePermission();
    }

    @Override
    public List<RolePermission> findRoleByCondition(RolePermission rp) {
        return rpm.findRolePermissionByCondition(rp);
    }
}
