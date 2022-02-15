package com.bus.mapper;

import com.bus.entity.Permission;
import com.bus.entity.Role;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface PermissionMapper extends Mapper<Permission> {

    List<String> selectPermissionsByUserName(String name);

    List<Permission> selectMenuByUserName(String name);

    List<Permission> selectAllMenu();

    //直接从数据库查出来正确的菜单
    List<Permission> selectPowerMenuByName(String name);

    List<Permission> findPermissionByCondition(Permission p);

    List<Permission> selectone(String name);

    List<Permission> selectPermissionByParentIdAndName1();
}