package com.bus.mapper;

import com.bus.entity.Role;
import com.bus.entity.RolePermission;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface RolePermissionMapper extends Mapper<RolePermission> {
    List<Role> selectAllRolePermission();

    List<RolePermission> selectRolePermissionById(Integer id);

    List<RolePermission> findRolePermissionByCondition(RolePermission rp);

    Integer deleteAllRolePermission(Integer id);

    Integer insertMore(List<RolePermission> list);
}