package com.bus.service;

import com.bus.entity.Role;
import com.bus.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImp implements RoleService{

    @Autowired
    RoleMapper rm;

    @Override
    public int insert(Role r) {
        return rm.insertSelective(r);
    }

    @Override
    public List<Role> findAllRole() {
        return null;
    }

    @Override
    public Role selectByPrimaryKey(int id) {
        return rm.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Role r) {
        return rm.updateByPrimaryKeySelective(r);
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return rm.deleteByPrimaryKey(id);
    }

    @Override
    public List<Role> findRoleByCondition(Role r) {
        return rm.findRoleByCondition(r);
    }
}
