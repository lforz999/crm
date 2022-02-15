package com.bus.service;

import com.bus.entity.Permission;
import com.bus.mapper.PermissionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PermissionServiceImp implements PermissionService{
    @Autowired
    PermissionMapper pm;

    @Override
    public List<Permission> findMenuByName(String name) {
        return  pm.selectMenuByUserName(name);
    }

    @Override
    public List<Permission> findAllMenu() {
        return  pm.selectAllMenu();

    }

    @Override
    public List<Permission> findPowerMenuByName(String name) {
        return pm.selectPowerMenuByName(name);
    }

    @Override
    public int insert(Permission p) {
        return pm.insertSelective(p);
    }

    @Override
    public Permission selectByPrimaryKey(int id) {
        return pm.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Permission p) {
        return pm.updateByPrimaryKeySelective(p);
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return pm.deleteByPrimaryKey(id);
    }

    @Override
    public List<Permission> findPermissionByCondition(Permission p) {
        return pm.findPermissionByCondition(p);
    }
}
